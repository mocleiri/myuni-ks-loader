CREATE OR REPLACE VIEW
    CM.CM_APPR_CRS_LRNG_OUTCOMES
    (
        CRS_PREFIX_NUM,
        CLU_ID,
        START_TERM,
        END_TERM,
        VERSION_NUM,
        CRS_STAT,
        LO_CATEGORY,
        LO_CATEGORY_TYPE,
        LO_TEXT,
        LO_SEQ_NUM,
        PARENT_LO_ID,
        CHILD_LO_ID
    ) AS
SELECT
    ident.cd crs_prefix_num,
    clu.id clu_id,
    SUBSTR(SUBSTR(clu.exp_first_atp, INSTR(clu.exp_first_atp, '.', -1) +1), 1, 4) || 
        DECODE(SUBSTR(SUBSTR(clu.exp_first_atp, INSTR(clu.exp_first_atp, '.', -1) +1), 5), 'Spring', '01', 'Summer1','05', 'Summer2','07', 'Fall','08', 'Winter','12', SUBSTR(SUBSTR(clu.exp_first_atp, INSTR(clu.exp_first_atp, '.', -1) +1), 5)) start_term,
    SUBSTR(SUBSTR(clu.last_atp, INSTR(clu.last_atp, '.', -1) +1), 1, 4) || 
        DECODE(SUBSTR(SUBSTR(clu.last_atp, INSTR(clu.last_atp, '.', -1) +1), 5), 'Spring','01', 'Summer1','05', 'Summer2','07', 'Fall','08', 'Winter','12', SUBSTR(SUBSTR(clu.last_atp, INSTR(clu.last_atp, '.', -1) +1), 5)) end_term,
    clu.seq_num version_num,
    clu.st crs_stat,
    cat.name lo_category,
    SUBSTR(cat.lo_category_type_id, INSTR(cat.lo_category_type_id, '.', -1) +1) lo_category_type, 
    lo_rich_text.plain lo_text,
    lo_attr.attr_value lo_seq_num,
    lo.id parent_lo_id,
    lo_reltn.related_lo_id child_lo_id
FROM cm.kslu_clu clu
LEFT JOIN cm.kslu_clu_ident ident on clu.offic_clu_id = ident.id
LEFT JOIN cm.kslu_clu_lo_reltn clu_lo_reltn on clu.id = clu_lo_reltn.clu_id
LEFT JOIN cm.kslo_lo lo on clu_lo_reltn.lo_id = lo.id
LEFT OUTER JOIN cm.kslo_attr lo_attr on (lo.id = lo_attr.owner)
LEFT OUTER JOIN cm.kslo_lo_reltn lo_reltn on lo.id = lo_reltn.lo_id
LEFT JOIN cm.kslo_rich_text_t lo_rich_text on lo.rt_descr_id = lo_rich_text.id
LEFT OUTER JOIN cm.kslo_lo_jn_locategory lo_jn_cat on lo.id = lo_jn_cat.lo_id
LEFT OUTER JOIN cm.kslo_lo_category cat on lo_jn_cat.locategory_id = cat.id
WHERE clu.lutype_id = 'kuali.lu.type.CreditCourse'
    AND lo_attr.attr_name = 'sequence'
ORDER BY
    crs_prefix_num,
    start_term,
    lo_seq_num ASC
/