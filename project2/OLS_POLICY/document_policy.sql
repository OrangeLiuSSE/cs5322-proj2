BEGIN
    SA_SYSDBA.CREATE_POLICY (
        policy_name   => 'doc_ols',
        column_name   => 'doc_ols_col',
        default_options   => 'read_control, write_control');
END;

    --  LevelDefine
BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'doc_ols',
        level_num      => 10,
        short_name     => 'WK',
        long_name      => 'WIKI'
    );

    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'doc_ols',
        level_num      => 20,
        short_name     => 'CONF',
        long_name      => 'CONFIDENTIAL'
    );
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'doc_ols',
        level_num      => 30,
        short_name     => 'S',
        long_name      => 'SECRET'
    );
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name    => 'doc_ols',
        level_num      => 40,
        short_name     => 'TS',
        long_name      => 'TOP_SECRET'
    );
END;

BEGIN
-- Compartment Define
    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'doc_ols',
        comp_num       => 15,
        short_name     => 'BK',
        long_name      => 'BOOK'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'doc_ols',
        comp_num       => 25,
        short_name     => 'TP',
        long_name      => 'TESTPAPER'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'doc_ols',
        comp_num       => 35,
        short_name     => 'SL',
        long_name      => 'SLIDES'
    );

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name    => 'doc_ols',
        comp_num       => 45,
        short_name     => 'MD',
        long_name      => 'MANAGEMENTDOC'
    );

END;

 -- Group Define
BEGIN
    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  1000,
        short_name      => 'SC',
        long_name       => 'SCHOOL'
    );

 -- SoC
    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  2000,
        short_name      => 'SOC',
        long_name       => 'COMPUTING',
        parent_name     => 'SC'
    );

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  2100,
        short_name      => 'SOC_GEN',
        long_name       => 'COMPUTING_GEN',
        parent_name     => 'SOC'
   );
   SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  2200,
        short_name      => 'SOC_CS',
        long_name       => 'COMPUTING_CS',
        parent_name     => 'SOC'
   );
   SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  2300,
        short_name      => 'SOC_IS',
        long_name       => 'COMPUTING_IS',
        parent_name     => 'SOC'
   );
   SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  2400,
        short_name      => 'SOC_AI',
        long_name       => 'COMPUTING_AI',
        parent_name     => 'SOC'
   );

   SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  2500,
        short_name      => 'SOC_ISE',
        long_name       => 'COMPUTING_INFOSEC',
        parent_name     => 'SOC'
   );

   -- ENGINEER

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  3000,
        short_name      => 'ENG',
        long_name       => 'ENGINEER',
        parent_name     => 'SC'
    );

    -- ISS

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  4000,
        short_name      => 'ISS',
        long_name       => 'SCHOOL_ISS',
        parent_name     => 'SC'
    );

    -- BUINESS

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'doc_ols',
        group_num       =>  5000,
        short_name      => 'BIZ',
        long_name       => 'SCHOOL_BIZ',
        parent_name     => 'SC'
    );
END;


GRANT EXECUTE ON lbac_admin.doc_ols_fc TO lbacsys;


-- set the guest label
BEGIN
    SA_USER_ADMIN.SET_LEVELS(
        policy_name => 'doc_ols',
        user_name => 'GUEST01',
        max_level => 'WK',
        min_level => 'WK'
        -- default_level => NULL,
        -- row_level => NULL
    );
END;
COMMIT;
-- set the student label

BEGIN
    SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_ols',
        user_name       => 'STD001',
        max_level       => 'S',
        min_level       => 'WK'
        -- default_level   => 'CONF',
        -- row_level       => 'CONF'
    );

    SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'doc_ols',
        user_name       => 'STD001',
        read_comps      => 'BK,SL',
        write_comps     => '',
        def_comps       => NULL,
        row_comps       => NULL
    );

     SA_USER_ADMIN.SET_GROUPS (
        policy_name    => 'doc_ols',
        user_name      => 'STD001', 
        read_groups    => 'SOC_CS',
        write_groups   => '',
        def_groups     => 'SOC_CS',
        row_groups     => 'SOC_CS'
    );
END;

--set the teacher label
BEGIN
    SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_ols',
        user_name       => 'teacher',
        max_level       => 'S',
        min_level       => 'WK'
        -- default_level   => 'CONF',
        -- row_level       => 'CONF'
    );

    SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'doc_ols',
        user_name       => 'teacher',
        read_comps      => 'TP,BK,SL',
        write_comps     => 'TP,SL',
        def_comps       => NULL,
        row_comps       => NULL
    );

     SA_USER_ADMIN.SET_GROUPS (
        policy_name    => 'doc_ols',
        user_name      => 'teacher', 
        read_groups    => 'SOC',
        write_groups   => '',
        def_groups     => 'SOC',
        row_groups     => 'SOC'
    );
END;


-- set the admin label
BEGIN
SA_USER_ADMIN.SET_LEVELS(
        policy_name     => 'doc_ols',
        user_name       => 'lbac_admin',
        max_level       => 'TS',
        min_level       => 'WK'
        -- default_level   => 'CONF',
        -- row_level       => 'CONF'
    );

    SA_USER_ADMIN.SET_COMPARTMENTS(
        policy_name     => 'doc_ols',
        user_name       => 'lbac_admin',
        read_comps      => 'BK,SL,MD,TP',
        write_comps     => 'BK,SL,MD,TP',
        def_comps       => 'BK,SL,MD,TP',
        row_comps       => 'BK,SL,MD,TP'
    );

     SA_USER_ADMIN.SET_GROUPS (
        policy_name    => 'doc_ols',
        user_name      => 'lbac_admin', 
        read_groups    => 'SC',
        write_groups   => 'SC',
        def_groups     => 'SC',
        row_groups     => 'SC'
    );
END;



-- imply policy to table
BEGIN
 SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
  policy_name    => 'doc_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'DOCUMENT',
  table_options  => 'read_control, write_control',
  label_function => 'doc_ols_fc(:new.type_id,:new.department_id)',
  predicate      => NULL);
END;

BEGIN
 SA_POLICY_ADMIN.DISABLE_TABLE_POLICY(
  policy_name   => 'doc_ols',
  schema_name   => 'lbac_admin',
  table_name    => 'DOCUMENT');
END;


BEGIN
 SA_POLICY_ADMIN.REMOVE_TABLE_POLICY(
  policy_name    => 'doc_ols',
  schema_name    => 'lbac_admin',
  table_name     => 'DOCUMENT',
  drop_column    => TRUE);
END;
/

-- check the level compartment group
SELECT * FROM ALL_SA_POLICIES;
SELECT * FROM ALL_SA_LEVELS;
SELECT * FROM ALL_SA_COMPARTMENTS;
SELECT * FROM ALL_SA_GROUPS;
SELECT * FROM ALL_SA_USER_LABELS;