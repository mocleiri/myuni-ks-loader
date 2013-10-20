-- KSCM-983 KSLAB-2578 Retire Clu Admin Dialog Widget Permissions
-- Permission
INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM, DESC_TXT)
  VALUES ('Y','KS-SYS',sys_guid(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Use Screen'),1,'Retire Clu Admin Dialog','Allows admins to have the choice of Admin retire or Retire by Proposal')
/
-- Permission Detail
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'cluRetireItem',(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='screenComponent' AND NMSPC_CD='KS-SYS'),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Default'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KS CM Admin Role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(),KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM Admin'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

-- KSCM-1744 KSLAB-2583 "Retire Course By Proposal" screen authorization
--- Permission
INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM, DESC_TXT)
  VALUES ('Y','KS-SYS',sys_guid(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KR-SYS' AND NM='Initiate Document'),1, 'Retire Course By Proposal', 'Allow user to retire course by proposal')
/
-- Permission Detail
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, VER_NBR,OBJ_ID,KIM_ATTR_DEFN_ID,KIM_TYP_ID,PERM_ID,ATTR_VAL)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 1,sys_guid(),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type (Permission)' AND NMSPC_CD='KR-SYS'),KRIM_PERM_ID_S.CURRVAL,'kuali.proposal.type.course.retire')
/
--- Assign to KS CM User Role  -- Admin Should inherit these rights.
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

-- KSCM-1680 "Retire Course By Proposal" screen authorization when the doc is "enRoute"
--- Permission
INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM, DESC_TXT)
  VALUES ('Y','KS-SYS',sys_guid(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1, 'Open Course Retirement Route Status R', 'Allows users to open Course Retirement Proposals with a Route Status of Enroute')
/
-- Permission Detail
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, VER_NBR,OBJ_ID,KIM_ATTR_DEFN_ID,KIM_TYP_ID,PERM_ID,ATTR_VAL)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 1,sys_guid(),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type and Route Node' AND NMSPC_CD='KS-SYS'),KRIM_PERM_ID_S.CURRVAL,'kuali.proposal.type.course.retire')
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, VER_NBR,OBJ_ID,KIM_ATTR_DEFN_ID,KIM_TYP_ID,PERM_ID,ATTR_VAL)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 1,sys_guid(),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type and Route Node' AND NMSPC_CD='KS-SYS'),KRIM_PERM_ID_S.CURRVAL,'R')
/
--- Assign to KS CM User Role  -- Admin Should inherit these rights.
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='College Curriculum Manager'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Department Chair'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='College Dean'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Academic Affairs Curriculum Manager'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM Admin'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Provost Representative'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Scheduling Office Curriculum Manager'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/