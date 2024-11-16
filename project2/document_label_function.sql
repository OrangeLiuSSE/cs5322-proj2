CREATE OR REPLACE FUNCTION doc_ols_fc (
    p_type IN NUMBER,   -- 文档类型
    p_dept IN NUMBER    -- 部门ID
) Return LBACSYS.LBAC_LABEL IS
    v_label VARCHAR2(100);  -- 存储生成的标签
BEGIN
    -- 根据文档类型和部门生成标签
    IF p_type = 1 THEN
        v_label := 'WK';
    ELSIF p_type = 2 THEN
        v_label := 'CONF:BK';
    ELSIF p_type = 3 THEN
        CASE p_dept
            WHEN 1000 THEN v_label := 'S:TP:SC';
            WHEN 2000 THEN v_label := 'S:TP:SOC';
            WHEN 2100 THEN v_label := 'S:TP:SOC_GEN';
            WHEN 2200 THEN v_label := 'S:TP:SOC_CS';
            WHEN 2300 THEN v_label := 'S:TP:SOC_IS';
            WHEN 2400 THEN v_label := 'S:TP:SOC_AI';
            WHEN 2500 THEN v_label := 'S:TP:SOC_ISE';
            WHEN 3000 THEN v_label := 'S:TP:ENG';
            WHEN 4000 THEN v_label := 'S:TP:ISS';
            WHEN 5000 THEN v_label := 'S:TP:BIZ';
            ELSE
                v_label := 'S:TP:SC';
        END CASE;
    ELSIF p_type = 4 THEN
        CASE p_dept
            WHEN 1000 THEN v_label := 'S:SL:SC';
            WHEN 2000 THEN v_label := 'S:SL:SOC';
            WHEN 2100 THEN v_label := 'S:SL:SOC_GEN';
            WHEN 2200 THEN v_label := 'S:SL:SOC_CS';
            WHEN 2300 THEN v_label := 'S:SL:SOC_IS';
            WHEN 2400 THEN v_label := 'S:SL:SOC_AI';
            WHEN 2500 THEN v_label := 'S:SL:SOC_ISE';
            WHEN 3000 THEN v_label := 'S:SL:ENG';
            WHEN 4000 THEN v_label := 'S:SL:ISS';
            WHEN 5000 THEN v_label := 'S:SL:BIZ';
            ELSE
                v_label := 'S:SL:SC';
        END CASE;
    ELSIF p_type = 5 THEN
        v_label := 'TS:MD';
    ELSE
        v_label := 'WK';
    END IF;

    RETURN TO_LBAC_DATA_LABEL('doc_ols',v_label);
END doc_ols_fc;

COMMIT;