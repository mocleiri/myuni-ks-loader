CREATE OR REPLACE VIEW
    CM.KRIM_GRP_MBR_V
    (
        NMSPC_CD,
        GRP_NM,
        GRP_ID,
        PRNCPL_NM,
        PRNCPL_ID,
        MBR_GRP_NM,
        MBR_GRP_ID
    ) AS
SELECT
    g.NMSPC_CD ,
    g.grp_nm ,
    g.GRP_ID ,
    p.PRNCPL_NM ,
    p.PRNCPL_ID ,
    mg.GRP_NM AS mbr_grp_nm ,
    mg.GRP_ID AS mbr_grp_id
FROM
    KRIM_GRP_MBR_T gm
LEFT JOIN
    krim_grp_t g
ON
    g.GRP_ID = gm.GRP_ID
LEFT OUTER JOIN
    krim_grp_t mg
ON
    mg.GRP_ID = gm.MBR_ID
AND gm.MBR_TYP_CD = 'G'
LEFT OUTER JOIN
    krim_prncpl_t p
ON
    p.PRNCPL_ID = gm.MBR_ID
AND gm.MBR_TYP_CD = 'P'
LEFT OUTER JOIN
    krim_entity_nm_t en
ON
    en.ENTITY_ID = p.ENTITY_ID
AND en.DFLT_IND = 'Y'
AND en.ACTV_IND = 'Y'
ORDER BY
    nmspc_cd,
    grp_nm,
    prncpl_nm