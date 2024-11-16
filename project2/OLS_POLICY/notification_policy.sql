BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'notif_ols',
        column_name   => 'notif_ols_col',
        default_options   => 'read_control, write_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'notif_ols',
        level_num      => 20,
        short_name     => 'CONF',
        long_name      => 'CONFIDENTIAL'
    );
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'notif_ols',
        level_num      => 30,
        short_name     => 'S',
        long_name      => 'SECRET'
    );
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'notif_ols',
        level_num      => 40,
        short_name     => 'TS',
        long_name      => 'TOP_SECRET'
    );
END;


 -- Group Define
BEGIN
    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'notif_ols',
        group_num       =>  2000,
        short_name      => 'MG',
        long_name       => 'MANAGEMENT'
    );

 -- SoC
    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'notif_ols',
        group_num       =>  2100,
        short_name      => 'HR',
        long_name       => 'HUMANRES',
        parent_name     => 'MG'
    );

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'notif_ols',
        group_num       =>  2200,
        short_name      => 'PR',
        long_name       => 'PROCUREMENT',
        parent_name     => 'MG'
   );
   SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'notif_ols',
        group_num       =>  2300,
        short_name      => 'FIN',
        long_name       => 'FINANCE',
        parent_name     => 'MG'
   );
   SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'notif_ols',
        group_num       =>  2400,
        short_name      => 'SEC',
        long_name       => 'SECURITY',
        parent_name     => 'MG'
   );

   SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'notif_ols',
        group_num       =>  2500,
        short_name      => 'BM',
        long_name       => 'BOOKMANAGER',
        parent_name     => 'MG'
    );
   
END;



-- set the student label

BEGIN
    SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'notif_ols',
        user_name       => 'STD001',
        max_level       => 'CONF',
        min_level       => 'CONF'
    );
END;

--set the teacher label
BEGIN
    SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'notif_ols',
        user_name       => 'TEACHER01',
        max_level       => 'S',
        min_level       => 'CONF'
    );
END;


-- set the admin label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'notif_ols',
        user_name       => 'lbac_admin',
        max_level       => 'TS',
        min_level       => 'CONF'
    );

     SA_USER_ADMIN.SET_GROUPS (
        policy_name    => 'notif_ols',
        user_name      => 'lbac_admin', 
        read_groups    => 'MG',
        write_groups   => 'MG',
        def_groups     => 'MG',
        row_groups     => 'MG'
    );
END;


BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'notif_ols',
        user_name       => 'HR_ADMIN',
        max_level       => 'TS',
        min_level       => 'CONF'
    );

     SA_USER_ADMIN.SET_GROUPS (
        policy_name    => 'notif_ols',
        user_name      => 'HR_ADMIN', 
        read_groups    => 'HR',
        write_groups   => 'HR',
        def_groups     => 'HR',
        row_groups     => 'HR'
    );
END;


-- imply policy to table
BEGIN
 SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
  policy_name    => 'notif_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'Notifications',
  table_options  => 'read_control, write_control',
  predicate      => NULL);
END;


BEGIN
 SA_POLICY_ADMIN.DISABLE_TABLE_POLICY(
  policy_name   => 'notif_ols',
  schema_name   => 'lbac_admin',
  table_name    => 'Notifications');
END;


BEGIN
 SA_POLICY_ADMIN.REMOVE_TABLE_POLICY(
  policy_name    => 'notif_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'Notifications',
  drop_column    => TRUE);
END;
/

-- check the level compartment group
SELECT * FROM ALL_SA_POLICIES;
SELECT * FROM ALL_SA_LEVELS;
SELECT * FROM ALL_SA_COMPARTMENTS;
SELECT * FROM ALL_SA_GROUPS;
SELECT * FROM ALL_SA_USER_LABELS;