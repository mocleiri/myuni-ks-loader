CREATE OR REPLACE VIEW
    CM.KRIM_PERM_ATTR_V
    (
        TMPL_NMSPC_CD,
        TMPL_NM,
        PERM_TMPL_ID,
        PERM_NMSPC_CD,
        PERM_NM,
        PERM_ID,
        ATTR_NM,
        ATTR_VAL
    ) AS
SELECT
    t.nmspc_cd AS tmpl_nmspc_cd ,
    t.NM       AS tmpl_nm ,
    t.PERM_TMPL_ID ,
    p.nmspc_cd AS perm_nmspc_cd ,
    p.NM       AS perm_nm ,
    p.PERM_ID ,
    a.NM        AS attr_nm ,
    ad.ATTR_VAL AS attr_val
FROM
    KRIM_PERM_T p
LEFT JOIN
    KRIM_PERM_TMPL_T t
ON
    p.PERM_TMPL_ID = t.PERM_TMPL_ID
LEFT OUTER JOIN
    KRIM_PERM_ATTR_DATA_T ad
ON
    p.PERM_ID = ad.perm_id
LEFT OUTER JOIN
    KRIM_ATTR_DEFN_T a
ON
    ad.KIM_ATTR_DEFN_ID = a.KIM_ATTR_DEFN_ID
ORDER BY
    tmpl_nmspc_cd,
    tmpl_nm,
    perm_nmspc_cd,
    perm_id,
    attr_nm