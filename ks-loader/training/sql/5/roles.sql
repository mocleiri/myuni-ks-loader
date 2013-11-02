-- Roles
--
-- You grant permissions and responsibilities to roles. Roles have a membership consisting of principals, groups,
-- and/or other roles. As a member of a role, the associated principal has all permissions and responsibilities that
-- have been granted to that role.  You can specify a qualification to any membership assignment on the role,
-- which is extra information about that particular member of the role. For example, a person may have the role of "Dean"
-- but that can be further qualified by the school they are the dean of, such as "Computer Science." You can pass
-- qualifications as part of authorization checks to restrict the subset of roles to check.

-- See https://wiki.kuali.org/display/STUDENTDOC/%28CM+2.0%29+6.4.4.2+Roles
-- See http://site.kuali.org/rice/2.2.5/reference/html/UG.html#d11290e4711
 
--
-- Start by deleting the roles if they already exist (so we can run the script more than once)
--
DELETE FROM KRIM_ROLE_T WHERE NMSPC_CD like 'MYUNI%'
/
DELETE FROM KRIM_ROLE_MBR_T where ROLE_MBR_ID like 'MYUNI%'
/


-- Create our 4 roles

INSERT INTO KRIM_ROLE_T (ACTV_IND,KIM_TYP_ID,NMSPC_CD,OBJ_ID,ROLE_ID,ROLE_NM,VER_NBR) VALUES ('Y','102','MYUNI-KS-CM','MYUNI_WF_DEPT_CURRIC_MGR',KRIM_ROLE_ID_S.NEXTVAL,'Department Curriculum Manager',1)
/
INSERT INTO KRIM_ROLE_T (ACTV_IND,KIM_TYP_ID,NMSPC_CD,OBJ_ID,ROLE_ID,ROLE_NM,VER_NBR) VALUES ('Y','102','MYUNI-KS-CM','MYUNI_WF_DEPT_CHAIR',KRIM_ROLE_ID_S.NEXTVAL,'Department Chair',1)
/
INSERT INTO KRIM_ROLE_T (ACTV_IND,KIM_TYP_ID,NMSPC_CD,OBJ_ID,ROLE_ID,ROLE_NM,VER_NBR) VALUES ('Y','101','MYUNI-KS-CM','MYUNI_WF_COLL_CURRIC_MGR',KRIM_ROLE_ID_S.NEXTVAL,'College Curriculum Manager',1)
/
INSERT INTO KRIM_ROLE_T (ACTV_IND,KIM_TYP_ID,NMSPC_CD,OBJ_ID,ROLE_ID,ROLE_NM,VER_NBR) VALUES ('Y','1','MYUNI-KS-CM','MYUNI_WF_SCHED_OFF_CRS_REV',KRIM_ROLE_ID_S.NEXTVAL,'Scheduling Office Course Reviewer',1)
/
 

-- Add our users to roles

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-JOE-ROL-MEM-ID',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Department Curriculum Manager'),'MYUNI-JOE-PRINCP-ID','P','1','MYUNI-JOE-8-489c-8ac8-7ab309e8d494','','') 
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-BILL-ROL-MEM-ID',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Department Chair'),'MYUNI-BILL-PRINCP-ID','P','1','MYUNI-BILL-8-489c-8ac8-7ab309e8d494','','') 
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-JANE-ROL-MEM-ID',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='College Curriculum Manager'),'MYUNI-JANE-PRINCP-ID','P','1','MYUNI-JANE-8-489c-8ac8-7ab309e8d494','','') 
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-CINDY-ROL-MEM-ID',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Scheduling Office Course Reviewer'),'MYUNI-CINDY-PRINCP-ID','P','1','MYUNI-CINDY-8-489c-8ac8-7ab309e8d494','','') 
/

-- Add our users to the KS-SYS Kuali Student CM User role so they can use the application

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-JOE-ROL-MEM-ID2',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Kuali Student CM User'),'MYUNI-JOE-PRINCP-ID','P','1','MYUNI-JOE-2-489c-8ac8-7ab309e8d494','','') 
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-BILL-ROL-MEM-ID2',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Kuali Student CM User'),'MYUNI-BILL-PRINCP-ID','P','1','MYUNI-BILL-2-489c-8ac8-7ab309e8d494','','') 
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-JANE-ROL-MEM-ID2',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Kuali Student CM User'),'MYUNI-JANE-PRINCP-ID','P','1','MYUNI-JANE-2-489c-8ac8-7ab309e8d494','','') 
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,VER_NBR,OBJ_ID,ACTV_FRM_DT,ACTV_TO_DT) VALUES ('MYUNI-CINDY-ROL-MEM-ID2',(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Kuali Student CM User'),'MYUNI-CINDY-PRINCP-ID','P','1','MYUNI-CINDY-2-489c-8ac8-7ab309e8d494','','') 







