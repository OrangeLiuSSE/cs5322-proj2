-- read policy

BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'user_read_ols',
        column_name   => 'user_read_ols_col',
        default_options   => 'read_control');
END;

    --  LevelDefine
BEGIN

    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'user_read_ols',
        level_num      => 20,
        short_name     => 'NR',
        long_name      => 'NORMAL_USER'
    );

    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'user_read_ols',
        level_num      => 30,
        short_name     => 'MG',
        long_name      => 'MANAGER'
    );

END;


BEGIN
-- Compartment Define
    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'user_read_ols',
        comp_num       => 15,
        short_name     => 'G',
        long_name      => 'GUEST'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'user_read_ols',
        comp_num       => 25,
        short_name     => 'S',
        long_name      => 'STUDENT'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'user_read_ols',
        comp_num       => 35,
        short_name     => 'T',
        long_name      => 'TEACHER'
    );
END;


-- write(manager) policy

BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'user_mg_ols',
        column_name   => 'user_mg_ols_col',
        default_options   => 'insert_control, delete_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'user_mg_ols',
        level_num      => 30,
        short_name     => 'S',
        long_name      => 'SECRET'
    );
END;



-- set the guest label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'user_read_ols',
        user_name       => 'GUEST01',
        max_level       => 'NR',
        min_level       => 'NR'
    );

SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'user_read_ols',
        user_name       => 'GUEST01',
        read_comps      => 'G',
        write_comps     => '',
        def_comps       => NULL,
        row_comps       => NULL
    );
END;


-- set the student label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'user_read_ols',
        user_name       => 'STD001',
        max_level       => 'NR',
        min_level       => 'NR'
    );

SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'user_read_ols',
        user_name       => 'STD001',
        read_comps      => 'S',
        write_comps     => '',
        def_comps       => NULL,
        row_comps       => NULL
    );
END;

-- set the teacher lable
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'user_read_ols',
        user_name       => 'TEACHER01',
        max_level       => 'NR',
        min_level       => 'NR'
    );

SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'user_read_ols',
        user_name       => 'TEACHER01',
        read_comps      => 'S,T',
        write_comps     => '',
        def_comps       => NULL,
        row_comps       => NULL
    );
END;


-- set the admin label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'user_read_ols',
        user_name       => 'lbac_admin',
        max_level       => 'MG',
        min_level       => 'NR'
    );

SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'user_read_ols',
        user_name       => 'lbac_admin',
        read_comps      => 'G,S,T',
        write_comps     => 'G,S,T',
        def_comps       => 'G',
        row_comps       => 'G'
    );
END;

BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'user_mg_ols',
        user_name       => 'lbac_admin',
        max_level       => 'S',
        min_level       => 'S'
    );
END;





-- imply policy to table
BEGIN
 SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
  policy_name    => 'user_read_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'Users',
  table_options  => 'read_control',
  predicate      => NULL);
END;

BEGIN
 SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
  policy_name    => 'user_mg_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'Users',
  table_options  => 'insert_control, delete_control',
  predicate      => NULL);
END;


-- BEGIN
--  SA_POLICY_ADMIN.REMOVE_TABLE_POLICY(
--   policy_name    => 'invent_insert_ols',
--   schema_name    => 'lbac_admin',
--   table_name     => 'Book_Inventory',
--   drop_column    => TRUE);
-- END;
-- /

-- check the level compartment group
SELECT * FROM ALL_SA_POLICIES;
SELECT * FROM ALL_SA_LEVELS;
SELECT * FROM ALL_SA_COMPARTMENTS;
SELECT * FROM ALL_SA_GROUPS;
SELECT * FROM ALL_SA_USER_LABELS;