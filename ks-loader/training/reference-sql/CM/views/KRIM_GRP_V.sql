CREATE OR REPLACE VIEW
    CM.KRIM_GRP_V
    (
        NMSPC_CD,
        GRP_NM,
        GRP_ID,
        GRP_TYP_NM,
        ATTR_NM,
        ATTR_VAL
    ) AS
SELECT
    g.NMSPC_CD ,
    g.grp_nm ,
    g.GRP_ID ,
    t.NM       AS grp_typ_nm ,
    a.NM       AS attr_nm ,
    d.ATTR_VAL AS attr_val
FROM
    krim_grp_t g
LEFT OUTER JOIN
    KRIM_GRP_ATTR_DATA_T d
ON
    d.grp_id = g.GRP_ID
LEFT OUTER JOIN
    KRIM_ATTR_DEFN_T a
ON
    a.KIM_ATTR_DEFN_ID = d.KIM_ATTR_DEFN_ID
LEFT OUTER JOIN
    KRIM_TYP_T t
ON
    g.KIM_TYP_ID = t.KIM_TYP_ID