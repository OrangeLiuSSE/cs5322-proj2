BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'doc_type_read_ols',
        column_name   => 'doc_type_read_ols_col',
        default_options   => 'read_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'doc_type_read_ols',
        level_num      => 10,
        short_name     => 'C',
        long_name      => 'CONFIDENTIAL'
    );
END;


BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'doc_type_write_ols',
        column_name   => 'doc_type_write_ols_col',
        default_options   => 'insert_control, update_control, delete_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'admin_part_read_ols',
        level_num      => 20,
        short_name     => 'S',
        long_name      => 'SECRET'
    );
END;



-- set the student teacher admin label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_type_read_ols',
        user_name       => 'STD001',
        max_level       => 'C',
        min_level       => 'C'
    );
END;

BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_type_read_ols',
        user_name       => 'TEACHER01',
        max_level       => 'C',
        min_level       => 'C'
    );
END;

BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_type_read_ols',
        user_name       => 'lbac_admin',
        max_level       => 'C',
        min_level       => 'C'
    );
END;



BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_type_read_ols',
        user_name       => 'BR_ADMIN',
        max_level       => 'C',
        min_level       => 'C'
    );
END;


BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_type_write_ols',
        user_name       => 'BR_ADMIN',
        max_level       => 'S',
        min_level       => 'S'
    );

END;