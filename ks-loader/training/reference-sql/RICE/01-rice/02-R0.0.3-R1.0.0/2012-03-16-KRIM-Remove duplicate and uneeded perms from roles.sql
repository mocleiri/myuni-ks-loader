--Remove unneeded permissions (these should already have access to create a proposal as CM users
DELETE
FROM
    KRIM_ROLE_PERM_T
WHERE
    KRIM_ROLE_PERM_T.PERM_ID =
    (
        SELECT
            PERM_ID
        FROM
            KRIM_PERM_T
        WHERE
            NM='Create Course By Proposal'
        AND KRIM_PERM_T.NMSPC_CD='KS-SYS'
    )
AND KRIM_ROLE_PERM_T.ROLE_ID IN
    (
        SELECT
            ROLE_ID
        FROM
            KRIM_ROLE_T
        WHERE
            (
                KRIM_ROLE_T.ROLE_NM= 'Registrar Program Curriculum Manager'
            AND KRIM_ROLE_T.NMSPC_CD='UMD-KS-CM'
            )
         OR
            (
                KRIM_ROLE_T.ROLE_NM= 'Scheduling Office Curriculum Manager'
            AND KRIM_ROLE_T.NMSPC_CD='UMD-KS-CM'
            )
    )
/

DELETE FROM KRIM_ROLE_PERM_T A WHERE A.rowid > ANY ( SELECT B.rowid FROM KRIM_ROLE_PERM_T B WHERE A.ROLE_ID = B.ROLE_ID AND A.PERM_ID = B.PERM_ID AND A.ACTV_IND='Y' AND B.ACTV_IND='Y' ) 
/
