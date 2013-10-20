CREATE OR REPLACE VIEW
    CM.KRIM_ROLE_ROLE_V
    (
        NMSPC_CD,
        ROLE_NM,
        ROLE_ID,
        MBR_ROLE_NMSPC_CD,
        MBR_ROLE_NM,
        MBR_ROLE_ID,
        ROLE_MBR_ID,
        ATTR_NM,
        ATTR_VAL
    ) AS
SELECT
    r.NMSPC_CD ,
    r.ROLE_NM ,
    r.role_id ,
    mr.NMSPC_CD AS mbr_role_nmspc_cd ,
    mr.role_NM  AS mbr_role_nm ,
    mr.role_id  AS mbr_role_id ,
    rm.role_mbr_id ,
    a.NM       AS attr_nm ,
    d.ATTR_VAL AS attr_val
FROM
    KRIM_ROLE_MBR_T rm
LEFT JOIN
    KRIM_ROLE_T r
ON
    r.ROLE_ID = rm.ROLE_ID
LEFT JOIN
    KRIM_role_T mr
ON
    mr.role_ID = rm.MBR_ID
LEFT OUTER JOIN
    KRIM_ROLE_MBR_ATTR_DATA_T d
ON
    d.role_mbr_id = rm.ROLE_MBR_ID
LEFT OUTER JOIN
    KRIM_ATTR_DEFN_T a
ON
    a.KIM_ATTR_DEFN_ID = d.KIM_ATTR_DEFN_ID
WHERE
    rm.MBR_TYP_CD = 'R'
ORDER BY
    nmspc_cd,
    role_nm,
    mbr_role_nmspc_cd,
    mbr_role_nm,
    role_mbr_id,
    attr_nm