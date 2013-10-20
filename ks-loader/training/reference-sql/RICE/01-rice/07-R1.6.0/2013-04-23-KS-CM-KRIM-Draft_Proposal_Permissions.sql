-- KSCM-2138 Give an admin the ability to cancel or submit a proposal that hasn't been submitted into the workflow yet.
-- This SQL needs to be run against rice.
-- Cancel document at Save route state.
-- Permission
INSERT INTO KRIM_PERM_T
 (ACTV_IND,
 NMSPC_CD,
 OBJ_ID,
 PERM_ID,
 PERM_TMPL_ID,
 VER_NBR,
 NM, 
 DESC_TXT)
VALUES
 ('Y',
 'KR-WKFLW',
 sys_guid(),
 KRIM_PERM_ID_S.NEXTVAL,
 (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KR-WKFLW' AND NM='Cancel Document'),
 1,
 'Cancel Saved Document',
 'Allow user to cancel or submit a saved document.')/

-- Permission Detail
INSERT INTO KRIM_PERM_ATTR_DATA_T
 (ATTR_DATA_ID,
 VER_NBR,
 OBJ_ID,
 KIM_ATTR_DEFN_ID,
 KIM_TYP_ID,
 PERM_ID,
 ATTR_VAL)
VALUES
 (KRIM_ATTR_DATA_ID_S.NEXTVAL,
 1,
 sys_guid(),
 (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
 (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),
 KRIM_PERM_ID_S.CURRVAL,
 'KualiStudentDocument')/
INSERT INTO KRIM_PERM_ATTR_DATA_T
 (ATTR_DATA_ID,
 VER_NBR,
 OBJ_ID,
 KIM_ATTR_DEFN_ID,
 KIM_TYP_ID,
 PERM_ID,
 ATTR_VAL)
VALUES
 (KRIM_ATTR_DATA_ID_S.NEXTVAL,
 1,
 sys_guid(),
 (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
 (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),
 KRIM_PERM_ID_S.CURRVAL,
 'S')/

-- Assign to KS Academic Affairs Curriculum Manager
INSERT INTO KRIM_ROLE_PERM_T
 (ACTV_IND,
 OBJ_ID,
 PERM_ID,
 ROLE_ID,
 ROLE_PERM_ID,
 VER_NBR)
VALUES
 ('Y',
 sys_guid(),
 KRIM_PERM_ID_S.CURRVAL,
 (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Academic Affairs Curriculum Manager' AND NMSPC_CD='UMD-KS-CM'),
 KRIM_ROLE_PERM_ID_S.NEXTVAL,
 1)/
 -- Assign to Initiator
INSERT INTO KRIM_ROLE_PERM_T
 (ACTV_IND,
 OBJ_ID,
 PERM_ID,
 ROLE_ID,
 ROLE_PERM_ID,
 VER_NBR)
VALUES
 ('Y',
 sys_guid(),
 KRIM_PERM_ID_S.CURRVAL,
 (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Initiator' AND NMSPC_CD='KR-WKFLW'),
 KRIM_ROLE_PERM_ID_S.NEXTVAL,
 1)/

-- Cancel document at Draft route state.
-- Permission
INSERT INTO KRIM_PERM_T
 (ACTV_IND,
 NMSPC_CD,
 OBJ_ID,
 PERM_ID,
 PERM_TMPL_ID,
 VER_NBR,
 NM, 
 DESC_TXT)
VALUES
 ('Y',
 'KR-WKFLW',
 sys_guid(),
 KRIM_PERM_ID_S.NEXTVAL,
 (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KR-WKFLW' AND NM='Cancel Document'),
 1,
 'Cancel Initiated Document',
 'Allow user to cancel or submit an initiated document.')/

-- Permission Detail
INSERT INTO KRIM_PERM_ATTR_DATA_T
 (ATTR_DATA_ID,
 VER_NBR,
 OBJ_ID,
 KIM_ATTR_DEFN_ID,
 KIM_TYP_ID,
 PERM_ID,
 ATTR_VAL)
VALUES
 (KRIM_ATTR_DATA_ID_S.NEXTVAL,
 1,
 sys_guid(),
 (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
 (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),
 KRIM_PERM_ID_S.CURRVAL,
 'KualiStudentDocument')/
INSERT INTO KRIM_PERM_ATTR_DATA_T
 (ATTR_DATA_ID,
 VER_NBR,
 OBJ_ID,
 KIM_ATTR_DEFN_ID,
 KIM_TYP_ID,
 PERM_ID,
 ATTR_VAL)
VALUES
 (KRIM_ATTR_DATA_ID_S.NEXTVAL,
 1,
 sys_guid(),
 (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
 (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),
 KRIM_PERM_ID_S.CURRVAL,
 'I')/

-- Assign to Academic Affairs Curriculum Manager
INSERT INTO KRIM_ROLE_PERM_T
 (ACTV_IND,
 OBJ_ID,
 PERM_ID,
 ROLE_ID,
 ROLE_PERM_ID,
 VER_NBR)
VALUES
 ('Y',
 sys_guid(),
 KRIM_PERM_ID_S.CURRVAL,
 (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Academic Affairs Curriculum Manager' AND NMSPC_CD='UMD-KS-CM'),
 KRIM_ROLE_PERM_ID_S.NEXTVAL,
 1)/
 -- Assign to Initiator
INSERT INTO KRIM_ROLE_PERM_T
 (ACTV_IND,
 OBJ_ID,
 PERM_ID,
 ROLE_ID,
 ROLE_PERM_ID,
 VER_NBR)
VALUES
 ('Y',
 sys_guid(),
 KRIM_PERM_ID_S.CURRVAL,
 (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Initiator' AND NMSPC_CD='KR-WKFLW'),
 KRIM_ROLE_PERM_ID_S.NEXTVAL,
 1)/

-- Give Academic Affairs Curriculum Manager ability to see draft proposals.
INSERT INTO KRIM_ROLE_PERM_T
 (ACTV_IND,
 OBJ_ID,
 PERM_ID,
 ROLE_ID,
 ROLE_PERM_ID,
 VER_NBR)
VALUES
 ('Y',
 sys_guid(),
 (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Open Document' AND NMSPC_CD='KS-LUM' AND ACTV_IND='Y'),
 (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Academic Affairs Curriculum Manager' AND NMSPC_CD='UMD-KS-CM'),
 KRIM_ROLE_PERM_ID_S.NEXTVAL,
 1)/