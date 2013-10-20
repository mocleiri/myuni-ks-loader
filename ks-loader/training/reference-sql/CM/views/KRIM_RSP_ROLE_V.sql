CREATE OR REPLACE VIEW
    CM.KRIM_RSP_ROLE_V
    (
        RSP_TMPL_NMSPC_CD,
        RSP_TMPL_NM,
        RSP_NMSPC_CD,
        RSP_NM,
        RSP_ID,
        ATTR_NM,
        ATTR_VAL,
        NMSPC_CD,
        ROLE_NM,
        ROLE_ID
    ) AS
SELECT
    rspt.nmspc_cd AS rsp_tmpl_nmspc_cd ,
    rspt.nm       AS rsp_tmpl_nm ,
    rsp.nmspc_cd  AS rsp_nmspc_cd ,
    rsp.nm        AS rsp_nm ,
    rsp.rsp_id ,
    a.nm AS attr_nm ,
    d.attr_val ,
    r.NMSPC_CD ,
    r.ROLE_NM ,
    rr.ROLE_ID
FROM
    krim_rsp_t rsp
LEFT JOIN
    krim_rsp_tmpl_t rspt
ON
    rsp.rsp_tmpl_id = rspt.rsp_tmpl_id
LEFT OUTER JOIN
    krim_rsp_attr_data_t d
ON
    rsp.rsp_id = d.rsp_id
LEFT OUTER JOIN
    krim_attr_defn_t a
ON
    d.kim_attr_defn_id = a.kim_attr_defn_id
LEFT OUTER JOIN
    krim_role_rsp_t rr
ON
    rr.rsp_id = rsp.rsp_id
LEFT OUTER JOIN
    krim_role_t r
ON
    rr.role_id = r.role_id
ORDER BY
    rsp_tmpl_nmspc_cd,
    rsp_tmpl_nm,
    rsp_nmspc_cd,
    rsp_nm,
    rsp_id,
    attr_nm,
    attr_val