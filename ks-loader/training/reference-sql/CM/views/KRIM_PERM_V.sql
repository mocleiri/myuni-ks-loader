CREATE OR REPLACE VIEW
    CM.KRIM_PERM_V
    (
        TMPL_NMSPC_CD,
        TMPL_NM,
        PERM_TMPL_ID,
        PERM_NMSPC_CD,
        PERM_NM,
        PERM_ID,
        PERM_TYP_NM,
        SRVC_NM
    ) AS
SELECT
    t.nmspc_cd AS tmpl_nmspc_cd ,
    t.NM       AS tmpl_nm ,
    t.PERM_TMPL_ID ,
    p.nmspc_cd AS perm_nmspc_cd ,
    p.NM       AS perm_nm ,
    p.PERM_ID ,
    typ.NM AS perm_typ_nm ,
    typ.SRVC_NM
FROM
    KRIM_PERM_T p
INNER JOIN
    KRIM_PERM_TMPL_T t
ON
    p.PERM_TMPL_ID = t.PERM_TMPL_ID
LEFT OUTER JOIN
    KRIM_TYP_T typ
ON
    t.KIM_TYP_ID = typ.KIM_TYP_ID