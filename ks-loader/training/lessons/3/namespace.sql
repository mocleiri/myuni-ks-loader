-- Create a namespace to make it easier to upgrade, delete roles, etc
-- Also, in general, always delete before inserting.  This allows you to run the script multiple times.  Will calls this "self healing" SQL.
DELETE FROM KRIM_ROLE_PERM_T WHERE OBJ_ID like 'MYUNI%'
/
DELETE FROM KRCR_NMSPC_T WHERE NMSPC_CD = 'MYUNI-KS-CM'
/
DELETE FROM KRIM_PERM_T WHERE NMSPC_CD = 'MYUNI-KS-CM'
/
DELETE FROM KRIM_PERM_ATTR_DATA_T WHERE OBJ_ID like 'MYUNI%'
/



INSERT INTO KRCR_NMSPC_T (NMSPC_CD, OBJ_ID, VER_NBR, NM, ACTV_IND, APPL_ID)
  VALUES ('MYUNI-KS-CM', '67015bfe-e1f9-4f49-9d63-ded69033b3df', 1, 'MyUni Curriculum Management System', 'Y', 'STUDENT')
/
  

--
-- Grant super user permissions on your new namespace to anyone in role 'Kuali Student CM Admin'
-- These allow the super users to assign roles, grant permissions, grant responsibilities, and populate groups
-- Note that the 'admin' user is already in the  'Kuali Student CM Admin' role

INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM)
  VALUES ('Y','MYUNI-KS-CM','MYUNI-7a29-4c24-ab38-083dd4a61f02',KRIM_PERM_ID_S.NEXTVAL,'35',1, 'Assign Role')
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (VER_NBR,OBJ_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_DATA_ID,PERM_ID,ATTR_VAL)
  VALUES (1,'MYUNI-1e9e-4cc7-b2f9-8c24ec034678','20','4',KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_PERM_ID_S.CURRVAL,'MYUNI-KS*')
/

INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-5612-4b15-8f97-dbff19408815',KRIM_PERM_ID_S.CURRVAL,'63',KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-889-111',KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM Admin'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
  
INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM)
  VALUES ('Y','MYUNI-KS-CM','MYUNI-5dd1-4f36-96f9-0f4f10821092',KRIM_PERM_ID_S.NEXTVAL,'36',1, 'Grant Permission')
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (VER_NBR,OBJ_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_DATA_ID,PERM_ID,ATTR_VAL)
  VALUES (1,'MYUNI-7826-46dc-874a-ec1c031a199b','20','4',KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_PERM_ID_S.CURRVAL,'MYUNI-KS*')
/

INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-bb67-4423-81f1-87cb65d2a9b5',KRIM_PERM_ID_S.CURRVAL,'63',KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-889-112',KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM Admin'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM)
  VALUES ('Y','MYUNI-KS-CM','MYUNI-9eb2-4d64-a0dd-4e8164d844de',KRIM_PERM_ID_S.NEXTVAL,'37',1, 'Grant Responsibility')
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (VER_NBR,OBJ_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_DATA_ID,PERM_ID,ATTR_VAL)
  VALUES (1,'MYUNI-8499-410d-b1f6-2c4fdd20c869','20','4',KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_PERM_ID_S.CURRVAL,'MYUNI-KS*')
/

INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-03fa-49aa-9b9d-83090441aba1',KRIM_PERM_ID_S.CURRVAL,'63',KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-889-113',KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM Admin'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
  
INSERT INTO KRIM_PERM_T (ACTV_IND,NMSPC_CD,OBJ_ID,PERM_ID,PERM_TMPL_ID,VER_NBR,NM)
  VALUES ('Y','MYUNI-KS-CM','MYUNI-c193-4e82-9c96-ae4fc80eb134',KRIM_PERM_ID_S.NEXTVAL,'38',1, 'Populate Group')
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (VER_NBR,OBJ_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_DATA_ID,PERM_ID,ATTR_VAL)
   VALUES (1,'MYUNI-a783-4d5d-b4ac-df44afbdda8a','20','4',KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_PERM_ID_S.CURRVAL,'MYUNI-KS*')
/

INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-3095-4dee-8449-93479a984a76',KRIM_PERM_ID_S.CURRVAL,'63',KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR)
  VALUES ('Y','MYUNI-889-114',KRIM_PERM_ID_S.CURRVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Kuali Student CM Admin'),KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

 



