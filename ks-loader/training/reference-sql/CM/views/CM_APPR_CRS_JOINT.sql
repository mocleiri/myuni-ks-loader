-- when running this script from DbViz, you have to change the ; statement delimiter or it won't run correctly
DECLARE
    cnt NUMBER;
    v_sql1 VARCHAR2 (4000);
    v_sql2 VARCHAR2 (4000);
BEGIN
    v_sql1 := '';
    SELECT
        COUNT (*)
    INTO
        cnt
    FROM
        all_views
    WHERE
        owner = 'CM'
    AND view_name = 'CM_APPR_CRS_JOINT';
    
    IF cnt > 0 THEN
        v_sql1 := 'drop view CM.CM_APPR_CRS_JOINT cascade constraints';
        EXECUTE IMMEDIATE v_sql1;
    END IF;
    
    v_sql2 := 'CREATE OR REPLACE VIEW
    CM.CM_APPR_CRS_JOINT_OFFER(
        CRS_PREFIX_NUM, 
        CLU_ID, 
        START_TERM, 
        END_TERM, 
        VERSION_NUM, 
        CRS_STAT,
        JOINT_OFFER_CRS, 
        JOINT_OFFER_CRS_START_TERM
    ) AS SELECT
        i1.cd crs_prefix_num, 
        c1.id clu_id, 
        SUBSTR(SUBSTR(c1.exp_first_atp, INSTR(c1.exp_first_atp, ''.'', -1) + 1), 1, 4) || 
            DECODE(SUBSTR(SUBSTR(c1.exp_first_atp, INSTR(c1.exp_first_atp, ''.'', -1) + 1), 5), ''Spring'', ''01'', ''Summer1'', ''05'', ''Summer2'', ''07'', ''Fall'', ''08'',''Winter'', ''12'', SUBSTR(SUBSTR(c1.exp_first_atp, INSTR(c1.exp_first_atp, ''.'', -1) + 1), 5)) start_term, 
        SUBSTR(SUBSTR(c1.last_atp, INSTR(c1.last_atp, ''.'', -1) + 1), 1, 4) || 
            DECODE(SUBSTR(SUBSTR(c1.last_atp, INSTR(c1.last_atp, ''.'', -1) + 1), 5), ''Spring'', ''01'', ''Summer1'', ''05'', ''Summer2'', ''07'', ''Fall'', ''08'',''Winter'', ''12'', SUBSTR(SUBSTR(c1.last_atp, INSTR(c1.last_atp, ''.'', -1) + 1), 5)) end_term, 
        c1.seq_num version_num, 
        c1.st crs_stat, 
        i2.cd joint_offer_crs, 
        SUBSTR(SUBSTR(c2.exp_first_atp, INSTR(c2.exp_first_atp, ''.'', -1) + 1), 1, 4) || 
            DECODE(SUBSTR(SUBSTR(c2.exp_first_atp, INSTR(c2.exp_first_atp, ''.'', -1) + 1), 5), ''Spring'', ''01'', ''Summer1'', ''05'', ''Summer2'', ''07'', ''Fall'', ''08'',''Winter'', ''12'', SUBSTR(SUBSTR(c2.exp_first_atp, INSTR(c2.exp_first_atp, ''.'', -1) + 1), 5)) joint_offer_crs_start_term
    FROM 
        cm.kslu_clu c1
    JOIN
        cm.kslu_clu_ident i1 on c1.offic_clu_id = i1.id
    JOIN
        cm.kslu_cluclu_reltn r on c1.id = r.clu_id
    JOIN
        cm.kslu_clu c2 on r.related_clu_id = c2.id
    JOIN
        cm.kslu_clu_ident i2 on c2.offic_clu_id = i2.id
    WHERE
        c1.LUTYPE_ID = ''kuali.lu.type.CreditCourse''
    ORDER BY 
        crs_prefix_num'
    ;
    
    EXECUTE IMMEDIATE v_sql2;
END;