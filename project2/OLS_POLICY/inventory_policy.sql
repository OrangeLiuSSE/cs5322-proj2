BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'invent_read_ols',
        column_name   => 'invent_read_ols_col',
        default_options   => 'read_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'invent_read_ols',
        level_num      => 20,
        short_name     => 'CONF',
        long_name      => 'CONFIDENTIAL'
    );
END;

BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'invent_insert_ols',
        column_name   => 'invent_insert_ols_col',
        default_options   => 'insert_control, delete_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'invent_insert_ols',
        level_num      => 30,
        short_name     => 'S',
        long_name      => 'SECRET'
    );
END;




-- set the admin label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'invent_read_ols',
        user_name       => 'lbac_admin',
        max_level       => 'CONF',
        min_level       => 'CONF'
    );
END;



BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'invent_read_ols',
        user_name       => 'PR_ADMIN',
        max_level       => 'CONF',
        min_level       => 'CONF'
    );
END;


BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'invent_insert_ols',
        user_name       => 'PR_ADMIN',
        max_level       => 'S',
        min_level       => 'S'
    );

END;


-- imply policy to table
BEGIN
 SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
  policy_name    => 'invent_read_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'Book_Inventory',
  table_options  => 'read_control',
  predicate      => NULL);
END;

BEGIN
 SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
  policy_name    => 'invent_insert_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'Book_Inventory',
  table_options  => 'insert_control, delete_control',
  predicate      => NULL);
END;


-- BEGIN
--  SA_POLICY_ADMIN.DISABLE_TABLE_POLICY(
--   policy_name   => 'notif_ols',
--   schema_name   => 'lbac_admin',
--   table_name    => 'Notifications');
-- END;


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