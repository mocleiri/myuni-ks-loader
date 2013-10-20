CREATE OR REPLACE VIEW
    CM.KRIM_ROLE_PERM_V
    (
        NMSPC_CD,
        ROLE_NM,
        ROLE_ID,
        TMPL_NMSPC_CD,
        TMPL_NM,
        PERM_TMPL_ID,
        PERM_NMPSC_CD,
        PERM_NM,
        PERM_ID,
        ATTR_NM,
        ATTR_VAL
    ) AS
SELECT
    r.NMSPC_CD ,
    r.ROLE_NM ,
    r.role_id ,
    pt.NMSPC_CD AS tmpl_nmspc_cd ,
    pt.NM       AS tmpl_nm ,
    pt.PERM_TMPL_ID ,
    p.NMSPC_CD AS perm_nmpsc_cd ,
    p.NM       AS perm_nm ,
    p.PERM_ID ,
    a.NM        AS attr_nm ,
    ad.ATTR_VAL AS attr_val
FROM
    KRIM_PERM_T p
LEFT JOIN
    KRIM_PERM_TMPL_T pt
ON
    p.PERM_TMPL_ID = pt.PERM_TMPL_ID
LEFT OUTER JOIN
    KRIM_PERM_ATTR_DATA_T ad
ON
    p.PERM_ID = ad.perm_id
LEFT OUTER JOIN
    KRIM_ATTR_DEFN_T a
ON
    ad.KIM_ATTR_DEFN_ID = a.KIM_ATTR_DEFN_ID
LEFT OUTER JOIN
    KRIM_ROLE_PERM_T rp
ON
    rp.PERM_ID = p.PERM_ID
LEFT OUTER JOIN
    KRIM_ROLE_T r
ON
    rp.ROLE_ID = r.ROLE_ID
ORDER BY
    NMSPC_CD,
    role_nm,
    tmpl_nmspc_cd,
    tmpl_nm,
    perm_id,
    attr_nm