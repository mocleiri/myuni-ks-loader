CREATE OR REPLACE VIEW
    CM.KRIM_ROLE_GRP_V
    (
        NMSPC_CD,
        ROLE_NM,
        ROLE_ID,
        GRP_NMSPC_CD,
        GRP_NM,
        ROLE_MBR_ID,
        ATTR_NM,
        ATTR_VAL
    ) AS
SELECT
    r.NMSPC_CD ,
    r.ROLE_NM ,
    r.role_id ,
    g.NMSPC_CD AS grp_nmspc_cd ,
    g.GRP_NM ,
    rm.ROLE_MBR_ID ,
    a.NM       AS attr_nm ,
    d.ATTR_VAL AS attr_val
FROM
    KRIM_ROLE_MBR_T rm
LEFT JOIN
    KRIM_ROLE_T r
ON
    r.ROLE_ID = rm.ROLE_ID
LEFT JOIN
    KRIM_GRP_T g
ON
    g.GRP_ID = rm.MBR_ID
LEFT OUTER JOIN
    KRIM_ROLE_MBR_ATTR_DATA_T d
ON
    d.role_mbr_id = rm.ROLE_MBR_ID
LEFT OUTER JOIN
    KRIM_ATTR_DEFN_T a
ON
    a.KIM_ATTR_DEFN_ID = d.KIM_ATTR_DEFN_ID
WHERE
    rm.MBR_TYP_CD = 'G'
ORDER BY
    nmspc_cd,
    role_nm,
    grp_nmspc_cd,
    grp_nm,
    role_mbr_id,
    attr_nm