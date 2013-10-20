--                                                  --
-- Edit kuali.proposal.type.course.create Documents --
--                                                  --

-- KSCM-1367
-- Add Edit Document where Doctype = kuali.proposal.type.course.create and Route status = R permission.
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to edit Create Course Proposals with a Route Status of Enroute.','Edit Create Course Route Status R','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,
  (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Edit Document'),1)
/

-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.course.create',
 (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
 (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/

-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'R',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/

-- Assign to Scheduling Office Course Reviewer role
-- Doctype = kuali.proposal.type.course.create and Route status = R permission.
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Scheduling Office Course Reviewer'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
