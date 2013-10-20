--
-- *** These permissions need to be run against RICE schema, not CM schema ***
--
-- Add permission for all CM Users to use Dependency Analysis screen
-- Add in self-healing SQL 
-- delete perm 'Use Dependency Analysis Screen' only from role ks-user in ks-sys space
delete from krim_role_perm_t where 
(perm_id= (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use Dependency Analysis Screen' AND NMSPC_CD='KS-SYS')) 
AND (role_id = (SELECT role_id FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User' AND NMSPC_CD='KS-SYS'))
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND, OBJ_ID, PERM_ID, ROLE_ID, ROLE_PERM_ID, VER_NBR) VALUES (
        'Y', sys_guid(), 
        (SELECT KRIM_PERM_T.PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD='KS-SYS' AND krim_perm_t.nm='Use Dependency Analysis Screen'),
        (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD='KS-SYS' AND ROLE_NM='Kuali Student CM User'),
        KRIM_ROLE_PERM_ID_S.NEXTVAL, 1)
/
-- KSCM-2059 Use Edit CluSet screen
-- These permissions need to be run against RICE schema, not CM schema
--  * Name Space KS-SYS or UMD-KS-CM where appropriate added

-- Cleanup on KS-SYS 
-- First delete the cluSetEdit permission, if it exists.
-- delete permission from ALL roles, where it exists
delete from krim_role_perm_t where perm_id=
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='KS-SYS')
/
-- delete from permission detail table.
delete from krim_perm_attr_data_t where (perm_id= (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='KS-SYS'))
 AND ATTR_VAL='editCourseSets'
/
-- delete edit clu set permission FROM KS-SYS namespace (cleanup KS-SYS, should have never been in there)
delete from krim_perm_t where nm='Use CluSet Edit link' AND NMSPC_CD='KS-SYS'
/

-- Cleanup on UMD-KS-CM
-- First delete the cluSetEdit permission, if it exists.
-- delete permission from ALL roles, where it exists
delete from krim_role_perm_t where perm_id=
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='UMD-KS-CM')
/
-- delete from permission detail table.
delete from krim_perm_attr_data_t where (perm_id= (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='UMD-KS-CM'))
 AND ATTR_VAL='editCourseSets'
/
-- delete edit clu set permission FROM KS-SYS namespace (cleanup UMD-KS-CM)
delete from krim_perm_t where nm='Use CluSet Edit link' AND NMSPC_CD='UMD-KS-CM'
/

-- Create cluset Edit Permission, in UMD-KS-CM namespace
INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM, DESC_TXT)
VALUES ('Y','UMD-KS-CM',sys_guid(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Use Screen'),1,'Use CluSet Edit link','Allows users to load the edit cluset page, (and see the edit cluset link in Dependency Analysis)')
/
-- Create Permission Detail (not directly in a namespace)
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'editCourseSets',(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='screenComponent' AND NMSPC_CD='KS-SYS'),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Default'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign Edit CluSet to KS CM Admin Role (UMD-KS-CM namespace Perm assigned to a KS-SYS role)
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
VALUES ('Y',sys_guid(),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='UMD-KS-CM'),
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM Admin' AND NMSPC_CD='KS-SYS'),
KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
-- Assign Edit CluSet to UMD-CM Admin Role (UMD-KS-CM namespace)
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
VALUES ('Y',sys_guid(),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='UMD-KS-CM'),
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='UMD-CM Admin' AND NMSPC_CD='UMD-KS-CM'),
KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

-- Assign to SOCM - "Scheduling Office Curriculum Manager" (UMD-KS-CM namespace)
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
VALUES ('Y',sys_guid(),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='UMD-KS-CM'),
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Scheduling Office Curriculum Manager' AND NMSPC_CD='UMD-KS-CM'),
KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
-- Assign to AACM - "Academic Affairs Curriculum Manager" (UMD-KS-CM namespace)
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
VALUES ('Y',sys_guid(),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use CluSet Edit link' AND NMSPC_CD='UMD-KS-CM'),
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Academic Affairs Curriculum Manager' AND NMSPC_CD='UMD-KS-CM'),
KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
-- Add in self-healing SQL for giving 'Kuali Student CM User'  use view course set mgmt screen
-- delete Use View Course Set Management Screens only from from ks-user in ks-sys space
delete from krim_role_perm_t where 
(perm_id= (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM='Use View Course Set Management Screens' AND NMSPC_CD='KS-SYS')) 
AND (role_id = (SELECT role_id FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User' AND NMSPC_CD='KS-SYS'))
/
-- Assign use cluset view to KS CM User Role (KS-SYS namespace)
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR) VALUES ('Y',sys_guid(), 
(SELECT KRIM_PERM_T.PERM_ID FROM KRIM_PERM_T WHERE krim_perm_t.nm='Use View Course Set Management Screens' AND NMSPC_CD='KS-SYS'),
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User' AND NMSPC_CD='KS-SYS'),
KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
