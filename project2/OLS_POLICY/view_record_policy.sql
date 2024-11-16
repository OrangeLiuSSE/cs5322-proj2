BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'view_record_read_ols',
        column_name   => 'view_record_read_ols_col',
        default_options   => 'read_control');
END;


BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'view_record_read_ols',
        level_num      => 30,
        short_name     => 'S',
        long_name      => 'SECRET'
    );
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'view_record_read_ols',
        level_num      => 40,
        short_name     => 'TS',
        long_name      => 'TOP_SECRET'
    );
END;


BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'view_record_read_ols',
        comp_num       => 15,
        short_name     => 'BK',
        long_name      => 'BOOK'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'view_record_read_ols',
        comp_num       => 25,
        short_name     => 'TP',
        long_name      => 'TESTPAPER'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'view_record_read_ols',
        comp_num       => 35,
        short_name     => 'SL',
        long_name      => 'SLIDES'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'view_record_read_ols',
        comp_num       => 45,
        short_name     => 'MD',
        long_name      => 'MANAGEMENTDOC'
    );
END;



BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'view_record_write_ols',
        column_name   => 'view_record_write_ols_col',
        default_options   => 'update_control, insert_control, delete_control');
END;


BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'view_record_write_ols',
        level_num      => 40,
        short_name     => 'TS',
        long_name      => 'TOP_SECRET'
    );
END;


-- set the teacher lable
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'view_record_read_ols',
        user_name       => 'TEACHER01',
        max_level       => 'S',
        min_level       => 'S'
    );

SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'view_record_read_ols',
        user_name       => 'TEACHER01',
        read_comps      => 'TP,SL',
        write_comps     => '',
        def_comps       => NULL,
        row_comps       => NULL
    );
END;


-- set the admin label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'view_record_read_ols',
        user_name       => 'lbac_admin',
        max_level       => 'TS',
        min_level       => 'S'
    );

SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'view_record_read_ols',
        user_name       => 'lbac_admin',
        read_comps      => 'BK,SL,TP,MD'
    );

SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'view_record_write_ols',
        user_name       => 'BK_ADMIN',
        max_level       => 'TS',
        min_level       => 'TS'
    );
END;

