CREATE OR REPLACE VIEW
    CM.KRIM_PRNCPL_V
    (
        PRNCPL_ID,
        PRNCPL_NM,
        FIRST_NM,
        LAST_NM,
        AFLTN_TYP_CD,
        CAMPUS_CD,
        EMP_STAT_CD,
        EMP_TYP_CD
    ) AS
SELECT
    p.PRNCPL_ID ,
    p.PRNCPL_NM ,
    en.FIRST_NM ,
    en.LAST_NM ,
    ea.AFLTN_TYP_CD ,
    ea.CAMPUS_CD ,
    eei.EMP_STAT_CD ,
    eei.EMP_TYP_CD
FROM
    krim_prncpl_t p
LEFT OUTER JOIN
    krim_entity_emp_info_t eei
ON
    eei.ENTITY_ID = p.ENTITY_ID
LEFT OUTER JOIN
    krim_entity_afltn_t ea
ON
    ea.ENTITY_ID = p.ENTITY_ID
LEFT OUTER JOIN
    krim_entity_nm_t en
ON
    p.ENTITY_ID = en.ENTITY_ID
AND 'Y' = en.DFLT_IND