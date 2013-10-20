CREATE OR REPLACE VIEW
    CM.KRIM_ROLE_V
    (
        NMSPC_CD,
        ROLE_NM,
        ROLE_ID,
        ROLE_TYP_NM,
        SRVC_NM,
        KIM_TYP_ID
    ) AS
SELECT
    r.NMSPC_CD ,
    r.ROLE_NM ,
    r.ROLE_ID ,
    t.nm AS role_typ_nm ,
    t.SRVC_NM ,
    t.KIM_TYP_ID
FROM
    KRIM_ROLE_T r ,
    KRIM_TYP_T t
WHERE
    t.KIM_TYP_ID = r.KIM_TYP_ID
AND r.ACTV_IND = 'Y'
ORDER BY
    nmspc_cd ,
    role_nm