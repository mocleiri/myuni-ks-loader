--                                                  --
-- Open kuali.proposal.type.course.create Documents --
--                                                  --
-- Add Open Document where Doctype = kuali.proposal.type.course.create and Route status = F permission. 
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to open Create Course Proposals with a Route Status of Disapproved.','Open Create Course Route Status D','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1)
/
-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.course.create',
	(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
	(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'D',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KSCM user role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

--                                                        --
-- Open kuali.proposal.type.course.create.admin Documents --
--                                                        --
-- Add Open Document where Doctype = kuali.proposal.type.course.create.admin and Route status = F permission. 
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to open Create Course Admin Proposals with a Route Status of Disapproved.','Open Create Course Admin Route Status D','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1)
/
-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.course.create.admin',
	(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
	(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'D',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KSCM user role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/


--                                                        --
-- Open kuali.proposal.type.course.modify Documents --
--                                                        --
-- Add Open Document where Doctype = kuali.proposal.type.course.modify and Route status = F permission. 
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to open Course Modification Proposals with a Route Status of Disapproved.','Open Course Modification Route Status D','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1)
/
-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.course.modify',
	(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
	(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'D',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KSCM user role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

--                                                        --
-- Open kuali.proposal.type.course.modify.admin Documents --
--                                                        --
-- Add Open Document where Doctype = kuali.proposal.type.course.modify.admin and Route status = F permission. 
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to open Course Modification Admin Proposals with a Route Status of Disapproved.','Open Course Modification Admin Route Status D','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1)
/
-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.course.modify.admin',
	(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
	(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'D',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KSCM user role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

--                                                           --
-- Open kuali.proposal.type.majorDiscipline.create Documents --
--                                                           --
-- Add Open Document where Doctype = kuali.proposal.type.majorDiscipline.create and Route status = F permission. 
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to open Program Creation Proposals with a Route Status of Disapproved.','Open Program Creation Route Status D','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1)
/
-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.majorDiscipline.create',
	(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
	(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'D',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KSCM user role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

--                                                           --
-- Open kuali.proposal.type.majorDiscipline.modify Documents --
--                                                           --
-- Add Open Document where Doctype = kuali.proposal.type.majorDiscipline.modify and Route status = F permission. 
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to open Program Modification Proposals with a Route Status of Disapproved.','Open Program Modification Route Status D','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1)
/
-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.majorDiscipline.modify',
	(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
	(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'D',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KSCM user role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

--                                                           --
-- Open kuali.proposal.type.course.retire Documents --
--                                                           --
-- Add Open Document where Doctype = kuali.proposal.type.course.retire and Route status = F permission. 
INSERT INTO KRIM_PERM_T (ACTV_IND,DESC_TXT,NM,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','Allows users to open Course Retirement Proposals with a Route Status of Disapproved.','Open Course Retirement Route Status D','KS-SYS',SYS_GUID(),KRIM_PERM_ID_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD='KS-SYS' AND NM='Open Document'),1)
/
-- Permission Detail - Document Type Name
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'kuali.proposal.type.course.retire',
	(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='documentTypeName' AND NMSPC_CD='KR-WKFLW'),
	(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Permission Detail - Route Status
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,PERM_ID,VER_NBR)
   VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, 'D',
     (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM='routeStatusCode' AND NMSPC_CD='KR-WKFLW'),
     (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM='Document Type & Routing Node or State' AND NMSPC_CD='KR-SYS'),sys_guid(),KRIM_PERM_ID_S.CURRVAL,1)
/
-- Assign to KSCM user role
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y',sys_guid(), KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM User'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

