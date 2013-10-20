CREATE OR REPLACE VIEW
    CM.KRIM_RSP_ATTR_V
    (
        RESPONSIBILITY_TYPE_NAME,
        RSP_TEMPLATE_NAME,
        RSP_NAMESPACE_CODE,
        RSP_NAME,
        RSP_ID,
        ATTRIBUTE_NAME,
        ATTRIBUTE_VALUE
    ) AS
SELECT
    krim_typ_t.NM                 AS responsibility_type_name ,
    KRIM_rsp_TMPL_T.NM            AS rsp_TEMPLATE_NAME ,
    KRIM_rsp_T.nmspc_cd           AS rsp_namespace_code ,
    KRIM_rsp_T.NM                 AS rsp_NAME ,
    krim_rsp_t.RSP_ID             AS rsp_id ,
    KRIM_ATTR_DEFN_T.NM           AS attribute_name ,
    KRIM_rsp_ATTR_DATA_T.ATTR_VAL AS attribute_value
FROM
    KRIM_rsp_T KRIM_rsp_T
INNER JOIN
    KRIM_rsp_ATTR_DATA_T KRIM_rsp_ATTR_DATA_T
ON
    KRIM_rsp_T.rsp_ID = KRIM_rsp_ATTR_DATA_T.rsp_id
INNER JOIN
    KRIM_ATTR_DEFN_T KRIM_ATTR_DEFN_T
ON
    KRIM_rsp_ATTR_DATA_T.KIM_ATTR_DEFN_ID = KRIM_ATTR_DEFN_T.KIM_ATTR_DEFN_ID
INNER JOIN
    KRIM_rsp_TMPL_T KRIM_rsp_TMPL_T
ON
    KRIM_rsp_T.rsp_TMPL_ID = KRIM_rsp_TMPL_T.rsp_TMPL_ID
INNER JOIN
    KRIM_TYP_T KRIM_TYP_T
ON
    KRIM_rsp_TMPL_T.KIM_TYP_ID = KRIM_TYP_T.KIM_TYP_ID
ORDER BY
    rsp_TEMPLATE_NAME,
    rsp_NAME,
    attribute_name