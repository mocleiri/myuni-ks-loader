CREATE OR REPLACE VIEW
    CM.KRIM_ROLE_PRNCPL_V
    (
        NMSPC_CD,
        ROLE_NM,
        ROLE_ID,
        PRNCPL_NM,
        PRNCPL_ID,
        FIRST_NM,
        LAST_NM,
        ROLE_MBR_ID,
        ATTR_NM,
        ATTR_VAL
    ) AS
SELECT
    r.NMSPC_CD ,
    r.ROLE_NM ,
    r.ROLE_ID ,
    p.PRNCPL_NM ,
    p.PRNCPL_ID ,
    en.FIRST_NM ,
    en.LAST_NM ,
    rm.ROLE_MBR_ID ,
    ad.NM         AS attr_nm ,
    rmad.ATTR_VAL AS attr_val
FROM
    KRIM_ROLE_T r
LEFT OUTER JOIN
    KRIM_ROLE_MBR_T rm
ON
    r.ROLE_ID = rm.ROLE_ID
LEFT OUTER JOIN
    KRIM_ROLE_MBR_ATTR_DATA_T rmad
ON
    rm.ROLE_MBR_ID = rmad.role_mbr_id
LEFT OUTER JOIN
    KRIM_ATTR_DEFN_T ad
ON
    rmad.KIM_ATTR_DEFN_ID = ad.KIM_ATTR_DEFN_ID
LEFT OUTER JOIN
    KRIM_PRNCPL_T p
ON
    rm.MBR_ID = p.PRNCPL_ID
AND rm.mbr_typ_cd = 'P'
LEFT OUTER JOIN
    KRIM_ENTITY_NM_T en
ON
    p.ENTITY_ID = en.ENTITY_ID
WHERE
    (
        en.DFLT_IND = 'Y')
ORDER BY
    nmspc_cd,
    role_nm,
    prncpl_nm,
    rm.ROLE_MBR_ID,
    attr_nm