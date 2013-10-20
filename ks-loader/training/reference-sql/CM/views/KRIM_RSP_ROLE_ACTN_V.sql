CREATE OR REPLACE VIEW
    CM.KRIM_RSP_ROLE_ACTN_V
    (
        RSP_NMSPC_CD,
        RSP_ID,
        NMSPC_CD,
        ROLE_NM,
        ROLE_ID,
        MBR_ID,
        MBR_TYP_CD,
        ROLE_MBR_ID,
        ACTN_TYP_CD,
        ACTN_PLCY_CD,
        FRC_ACTN,
        PRIORITY_NBR
    ) AS
SELECT
    rsp.nmspc_cd AS rsp_nmspc_cd ,
    rsp.rsp_id ,
    r.NMSPC_CD ,
    r.ROLE_NM ,
    rr.ROLE_ID ,
    rm.MBR_ID ,
    rm.MBR_TYP_CD ,
    rm.ROLE_MBR_ID ,
    actn.ACTN_TYP_CD ,
    actn.ACTN_PLCY_CD ,
    actn.FRC_ACTN ,
    actn.PRIORITY_NBR
FROM
    krim_rsp_t rsp
LEFT JOIN
    krim_rsp_tmpl_t rspt
ON
    rsp.rsp_tmpl_id = rspt.rsp_tmpl_id
LEFT OUTER JOIN
    krim_role_rsp_t rr
ON
    rr.rsp_id = rsp.rsp_id
LEFT OUTER JOIN
    KRIM_ROLE_MBR_T rm
ON
    rm.ROLE_ID = rr.ROLE_ID
LEFT OUTER JOIN
    KRIM_ROLE_RSP_ACTN_T actn
ON
    actn.ROLE_RSP_ID = rr.ROLE_RSP_ID
AND (
        actn.ROLE_MBR_ID = rm.ROLE_MBR_ID
    OR  actn.ROLE_MBR_ID = '*')
LEFT OUTER JOIN
    krim_role_t r
ON
    rr.role_id = r.role_id
ORDER BY
    rsp_nmspc_cd ,
    rsp_id ,
    role_id ,
    role_mbr_id