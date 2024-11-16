BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'admin_part_read_ols',
        column_name   => 'admin_part_read_ols_col',
        default_options   => 'read_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'admin_part_read_ols',
        level_num      => 40,
        short_name     => 'TS',
        long_name      => 'TOP_SECRET'
    );
END;


BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'admin_part_write_ols',
        column_name   => 'admin_part_write_ols_col',
        default_options   => 'insert_control, update_control, delete_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'admin_part_read_ols',
        level_num      => 40,
        short_name     => 'TS',
        long_name      => 'TOP_SECRET'
    );
END;



-- set the admin label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'admin_part_read_ols',
        user_name       => 'lbac_admin',
        max_level       => 'TS',
        min_level       => 'TS'
    );
END;



BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'admin_part_read_ols',
        user_name       => 'HR_ADMIN',
        max_level       => 'TS',
        min_level       => 'TS'
    );
END;


BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'admin_part_write_ols',
        user_name       => 'HR_ADMIN',
        max_level       => 'TS',
        min_level       => 'TS'
    );

END;