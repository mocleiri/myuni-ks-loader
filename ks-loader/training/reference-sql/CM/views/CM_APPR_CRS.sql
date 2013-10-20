CREATE OR REPLACE VIEW
    CM20.CM_APPR_CRS
    (
        CRS_PREFIX_NUM,
        CLU_ID,
        START_TERM,
        END_TERM,
        CRS_STAT,
        PILOT_CRS,
        VERSION_NUM,
        MOD_DATE,
        CRS_TITLE,
        TRANS_TITLE,
        CREDIT_OPTION,
        MIN_CREDITS,
        MAX_CREDITS,
        GRD_METHOD_REGULAR,
        GRD_METHOD_SATISFACTORY,
        REG_OPTION_PASSFAIL,
        REG_OPTION_AUDIT,
        CRS_DESC,
        ADDITIONAL_INFO,
        SEMESTER_TYPE,
        LECTURE_HRS_WEEK,
        DISC_HRS_WEEK,
        LAB_HOURS_WEEK,
        EXPER_LRNG_HRS_WEEK,
        CRS_CONTACT_HRS,
        ALLOWABLE_CREDITS_BY_CTC_HRS,
        REPEAT_IF_CONTENT_DIFFERS,
        REPEATABLE_MAX_CREDIT
    ) AS
SELECT
    ident.cd crs_prefix_num ,
    clu.id,
    SUBSTR(start_atp.name,1,4)|| DECODE(SUBSTR(start_atp.name,5), 'Spring','01', 'Summer1','05',
    'Summer2','07', 'Fall','08', 'Winter','12', SUBSTR(start_atp.name,5)) start_term ,
    SUBSTR(end_atp.name,1,4)|| DECODE(SUBSTR(end_atp.name,5), 'Spring','01', 'Summer1','05',
    'Summer2','07', 'Fall','08', 'Winter','12', SUBSTR(end_atp.name,5)) end_term ,
    clu.st                                                              crs_stat ,
    cd.value                                                            pilot_crs ,
    clu.seq_num                                                         version_num ,
    CAST(clu.updatetime AS DATE)                                        mod_date ,
    ident.lng_name                                                      crs_title ,
    ident.shrt_name                                                     trans_title ,
    DECODE(SUBSTR(credit_rescomp.rvg_type,INSTR(credit_rescomp.rvg_type,'.',-1)+1), 'range','variable',
    SUBSTR(credit_rescomp.rvg_type,INSTR(credit_rescomp.rvg_type,'.',-1)+1)) credit_option,
    (
        SELECT
            --MIN ( TO_NUMBER ( rv.value ) )
            MIN ( TO_NUMBER ( rv.result_value ) )
        FROM
            --kslr_result_value rv
            ksen_lrc_result_value rv,
            ksen_lrc_rvg_result_value rvg
        WHERE
            --rv.rslt_comp_id = credit_rescomp.id ) min_credits ,
            rvg.rvg_id = credit_rescomp.id AND
            rvg.result_value_id = rv.id
    ) min_credits,
    (
        SELECT
            --MAX ( TO_NUMBER ( rv.value ) )
            MAX ( TO_NUMBER ( rv.result_value ) )
        FROM
            --kslr_result_value rv
            ksen_lrc_result_value rv,
            ksen_lrc_rvg_result_value rvg
        WHERE
            --rv.rslt_comp_id = credit_rescomp.id ) max_credits ,
            rvg.rvg_id = credit_rescomp.id AND
            rvg.result_value_id = rv.id
    ) max_credits,
    (
        SELECT
            grading_rescomp.name
        FROM
            kslu_clu_rslt grading_cr ,
            kslu_clures_jn_resopt grading_rjro ,
            kslu_rslt_opt grading_resopt ,
            ksen_lrc_rvg grading_rescomp
        WHERE
            grading_cr.type_key_id = 'kuali.resultType.gradeCourseResult'
        AND grading_rjro.clu_res_id = grading_cr.id
        AND grading_rjro.res_opt_id = grading_resopt.id
        AND grading_rescomp.id = grading_resopt.res_comp_id
        AND grading_rescomp.id IN ( 'kuali.resultComponent.grade.letter' )
        AND grading_cr.clu_id = clu.id ) grd_method_regular,
    (
        SELECT
            grading_rescomp.name
        FROM
            kslu_clu_rslt grading_cr ,
            kslu_clures_jn_resopt grading_rjro ,
            kslu_rslt_opt grading_resopt ,
            ksen_lrc_rvg grading_rescomp
        WHERE
            grading_cr.type_key_id = 'kuali.resultType.gradeCourseResult'
        AND grading_rjro.clu_res_id = grading_cr.id
        AND grading_rjro.res_opt_id = grading_resopt.id
        AND grading_rescomp.id = grading_resopt.res_comp_id
        AND grading_rescomp.id IN ( 'kuali.resultComponent.grade.satisfactory' )
        AND grading_cr.CLU_id = clu.id ) grd_method_satisfactory ,
    (
        SELECT
            grading_rescomp.name
        FROM
            kslu_clu_rslt grading_cr ,
            kslu_clures_jn_resopt grading_rjro ,
            kslu_rslt_opt grading_resopt ,
            ksen_lrc_rvg grading_rescomp
        WHERE
            grading_cr.type_key_id = 'kuali.resultType.gradeCourseResult'
        AND grading_rjro.clu_res_id = grading_cr.id
        AND grading_rjro.res_opt_id = grading_resopt.id
        AND grading_rescomp.id = grading_resopt.res_comp_id
        AND grading_rescomp.id IN ( 'kuali.resultComponent.grade.passFail' )
        AND grading_cr.clu_id = clu.id ) reg_option_passfail ,
    (
        SELECT
            grading_rescomp.name
        FROM
            kslu_clu_rslt grading_cr ,
            kslu_clures_jn_resopt grading_rjro ,
            kslu_rslt_opt grading_resopt ,
            ksen_lrc_rvg grading_rescomp
        WHERE
            grading_cr.type_key_id ='kuali.resultType.gradeCourseResult'
        AND grading_rjro.clu_res_id = grading_cr.id
        AND grading_rjro.res_opt_id = grading_resopt.id
        AND grading_rescomp.id = grading_resopt.res_comp_id
        AND grading_rescomp.id IN ('kuali.resultComponent.grade.audit' )
        AND grading_cr.clu_id = clu.id ) reg_option_audit ,
    desc_txt.plain                       crs_desc ,
    (
        SELECT
            a.attr_value
        FROM
            kslu_clu_attr a
        WHERE
            owner = clu.id
        AND attr_name = 'additionalCourseInformation' ) additional_info ,
    (
        SELECT
            SUBSTR(a.attr_value,INSTR(a.attr_value,'.',-1)+1)
        FROM
            kslu_clu_attr a
        WHERE
            owner = clu.id
        AND attr_name = 'semesterType' ) semester_type ,
    (
        SELECT
            activity_clu.clu_intsty_qty
        FROM
            kslu_cluclu_reltn format_rel ,
            kslu_cluclu_reltn activity_rel ,
            kslu_clu activity_clu
        WHERE
            format_rel.lu_reltn_type_id = 'luLuRelationType.hasCourseFormat'
        AND activity_rel.lu_reltn_type_id = 'luLuRelationType.contains'
        AND activity_rel.clu_id = format_rel.related_clu_id
        AND format_rel.clu_id = clu.id
        AND activity_clu.lutype_id = 'kuali.lu.type.activity.LectureORSeminar'
        AND activity_clu.id = activity_rel.related_clu_id ) lecture_hrs_week ,
    (
        SELECT
            activity_clu.clu_intsty_qty
        FROM
            kslu_cluclu_reltn format_rel ,
            kslu_cluclu_reltn activity_rel ,
            kslu_clu activity_clu
        WHERE
            format_rel.lu_reltn_type_id = 'luLuRelationType.hasCourseFormat'
        AND activity_rel.lu_reltn_type_id ='luLuRelationType.contains'
        AND activity_rel.clu_id = format_rel.related_clu_id
        AND format_rel.clu_id = clu.id
        AND activity_clu.lutype_id = 'kuali.lu.type.activity.Discussion'
        AND activity_clu.id = activity_rel.related_clu_id ) disc_hrs_week ,
    (
        SELECT
            activity_clu.clu_intsty_qty
        FROM
            kslu_cluclu_reltn format_rel ,
            kslu_cluclu_reltn activity_rel ,
            KSLU_CLU activity_clu
        WHERE
            format_rel.lu_reltn_type_id = 'luLuRelationType.hasCourseFormat'
        AND activity_rel.lu_reltn_type_id = 'luLuRelationType.contains'
        AND activity_rel.clu_id = format_rel.related_clu_id
        AND format_rel.clu_id = clu.id
        AND activity_clu.lutype_id = 'kuali.lu.type.activity.Lab'
        AND activity_clu.id = activity_rel.related_clu_id ) lab_hours_week,
    (
        SELECT
            activity_clu.clu_intsty_qty
        FROM
            kslu_cluclu_reltn format_rel ,
            kslu_cluclu_reltn activity_rel ,
            kslu_clu activity_clu
        WHERE
            format_rel.lu_reltn_type_id = 'luLuRelationType.hasCourseFormat'
        AND activity_rel.lu_reltn_type_id = 'luLuRelationType.contains'
        AND activity_rel.clu_id = format_rel.related_clu_id
        AND format_rel.clu_id = clu.id
        AND activity_clu.lutype_id = 'kuali.lu.type.activity.ExperientialLearningOROther'
        AND activity_clu.id = activity_rel.related_clu_id ) exper_lrng_hrs_week ,
    (
        SELECT
            a.attr_value
        FROM
            kslu_clu_attr a
        WHERE
            owner = clu.id
        AND attr_name = 'activityTotalContactHours' ) crs_contact_hrs ,
    (
        SELECT
            a.attr_value
        FROM
            kslu_clu_attr a
        WHERE
            owner = clu.id
        AND attr_name = 'activityTotalCredits' ) allowable_credits ,
    (
        SELECT
            a.attr_value
        FROM
            KSLU_CLU_ATTR a
        WHERE
            owner = clu.id
        AND attr_name = 'repeatableIfContentDiffers' ) repeatable_for_credit ,
    (
        SELECT
            a.attr_value
        FROM
            KSLU_CLU_ATTR a
        WHERE
            owner = clu.id
        AND attr_name = 'repeatableNumCredits' ) repeatable_max_credit
FROM
    kslu_clu clu ,
    kslu_clu_ident ident ,
    kslu_lu_code cd ,
    kslu_clu_rslt credit_cr ,
    kslu_clures_jn_resopt credit_rjro ,
    kslu_rslt_opt credit_resopt ,
    ksen_lrc_rvg credit_rescomp ,
    kslu_rich_text_t desc_txt ,
    ksen_atp start_atp ,
    ksen_atp end_atp
WHERE
    clu.offic_clu_id = ident.id
AND cd.clu_id(+) = clu.id
AND cd.type(+) = 'kuali.lu.code.pilotCourse'
AND credit_cr.clu_id = clu.id
AND credit_cr.type_key_id = 'kuali.resultType.creditCourseResult'
AND credit_rjro.clu_res_id = credit_cr.id
AND credit_rjro.res_opt_id = credit_resopt.id
AND credit_rescomp.id = credit_resopt.res_comp_id
AND desc_txt.id = clu.rt_descr_id
AND start_atp.id = clu.exp_first_atp
AND end_atp.id(+) = clu.last_atp
