CREATE VIEW
    CM.CM_APPR_CRS_RULES
    (
        CRS_PREFIX_NUM,
        CLU_ID,
        START_TERM,
        END_TERM,
        VERSION_NUMBER,
        CRS_STAT,
        RULE_NAT_LANG,
        SATISFACTORY_PROGRESS,
        PROGRAM_ENTRANCE,
        ANTI_REQ,
        COMPLETION,
        RESTRICTION,
        STUDENT_ELIGIBILITY_PREREQ,
        COREQ,
        RECOMMENDED_PREPARATION,
        STUDENT_ELIGIBILITY,
        PREREQ
    ) AS
SELECT
    u.CRS,
    c.id,
    u.TRM,
    u.TRM_END,
    c.VER_NBR,
    c.ST,
    u.CRS_REQS,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID ='kuali.statement.type.program.satisfactoryProgress')
    satisfactoryProgress,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.program.entrance') programentrance,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.course.academicReadiness.antireq') antireq,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.program.completion') completion,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.course.credit.restriction') restriction,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID =
            'kuali.statement.type.course.academicReadiness.studentEligibilityPrereq')
    studentEligibilityPrereq,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.course.academicReadiness.coreq') coreq,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.course.recommendedPreparation')
    recommendedPreparation,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.course.academicReadiness.studentEligibility')
    studentEligibility,
    (
        SELECT
            COUNT ( * )
        FROM
            cm.KSST_REF_STMT_REL r,
            cm.KSST_STMT s
        WHERE
            r.REF_OBJ_ID = c.id
        AND s.ID = r.STMT_ID
        AND s.STMT_TYPE_ID = 'kuali.statement.type.course.academicReadiness.prereq') prereq
FROM
	-- on developer instances the schema.table is CM.UMDCM_CRS
	-- for DEV, QA and PROD the schema.table is SISCM.UMDCM_CRS
    -- SISCM.UMDCM_CRS u,
    CM.UMDCM_CRS u, 
    CM.KSLU_CLU c
WHERE
    c.id = u.CRS_ID
    