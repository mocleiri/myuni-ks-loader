

-- Responsibility
--
-- A responsibility represents an action that a principal is requested to take. This is used
-- for defining workflow actions (such as approve, acknowledge, FYI) for which the principal
-- is responsible. Responsibilities form the basis of the workflow engine routing process.

-- A responsibility is very similar to a permission in a couple of ways. First, responsibilities
-- are always granted to a role, never assigned directly to a principal or group. Furthermore, similar
-- to permissions, a role has a responsibility template. The responsibility template specifies what additional
-- responsibility details need to be defined when the responsibility is created.


-- See https://wiki.kuali.org/display/STUDENTDOC/%28CM+2.0%29+6.4.4.3+Responsibilities
-- See http://site.kuali.org/rice/2.2.5/reference/html/TRG.html#d1360e10509
--
-- KIM responsibility routing (KEW) is an alternative to rules based routing.  It uses a custom routing node type of <role name="a_role"> in the workflow XML file.
-- Any node in the documentTypes.xml file that begins with <Role> is using KIM responsibility routing.
-- When the document moves between nodes, KEW looks for any responsibility that matches the document type
-- (or the name of a parent document type) and routing node.  If KEW finds a match anywhere in the hierarchy, it will then look up
--  any roles that have that responsibility, and will generate action requests to anyone assigned to those roles. 
-- 
--  You can see the responsibilites defined in CM by going to the responsibilities link on the Rice admin page. 
--
-- For a general overview of responsibilities see http://site.kuali.org/rice/2.2.5/reference/html/UG.html#d11290e4711
-- For responsibility based routing see: http://site.kuali.org/rice/2.0.0-b1/reference/html-multi/TRG/ch03s08.html
-- You can route through workflow using KIM responsibilities
-- All responsibilities use the review template (according to the rice guide)
-- The review template specifies two details: document type, routing node. 


-- KRIM_ROLE_RSP_ACTN_T
--
-- ACTN_TYP_CD (Indicates the type of action request that KEW should generate.)
-- A = Approve
-- K = Acknowlege
-- F = Fyi
--
-- ACTN_PLCY_CD (Signifies how the generated request will work in KEW in terms of when the responsibility is satisfied 
--              (whether one person needs to approve the document or all persons). “ALL” value is only allowed at the role
--               member level for role members of type ‘group’.
-- F = First
-- A = All
--
-- KIM_ATTR_DEFN_ID
-- 13 = documentTypeName
-- 16 = routeNodeName
-- 41 = actionDetailsAtRoleMemberLevel --> Responsibilities also have a Responsibility Detail value for the key “actionDetailsAtRoleMemberLevel”.
--                         This value is either ‘true’ or ‘false’ to indicate whether the Action Detail elements are stored at the
--                             role member level or role level.  A value of ‘true’ indicates that each member of the role will have its
--                       own Action Detail data element while a value of ‘false’ will require that the role have an Action Detail 
--                         element that then applies to all role members. See table for more info at
--                       https://wiki.kuali.org/display/STUDENTDOC/%28CM+2.0%29+6.4.4.3+Responsibilities
--   
-- 40 = required --> Responsibilities have a Responsibility Detail value for the key “required”. If the value is set to “true” and no principals
--                   are returned from the calculation of this Responsibility, the document will go into exception status.  If the value is set to
--                   “false” and no principals are returned then the document will continue on the original route path.  See
--             https://wiki.kuali.org/display/STUDENTDOC/%28CM+2.0%29+6.4.4.3+Responsibilities
-- KIM_TYP_ID
-- 7 = Document Type, Routing Node & Action Information  | Service = reviewResponsibilityTypeService




-- Cleanup
DELETE FROM KRIM_ROLE_RSP_T WHERE OBJ_ID like 'MYUNI_WF%'
/ 
DELETE FROM KRIM_RSP_ATTR_DATA_T WHERE OBJ_ID like 'MYUNI_WF%'
/
DELETE FROM KRIM_ROLE_RSP_ACTN_T WHERE OBJ_ID like 'MYUNI_WF%'
/
DELETE FROM KRIM_RSP_T WHERE NMSPC_CD like 'MYUNI-KS%'
/
 
 
-- Create responsibilities and link to document type and route node.
--


-- Responsibility for Department Pre Review
--
-- Node: Department Pre Review 
--
--
--   <role name="Department Pre Review">
--			<activationType>P</activationType>
--			<qualifierResolverClass>org.kuali.student.lum.workflow.qualifierresolver.OrganizationQualifierResolver</qualifierResolverClass>
--			<organizationTypeCode>kuali.org.Department</organizationTypeCode>
--			<organizationIdQualifierKey>department</organizationIdQualifierKey>
--    </role>
--  

--
--  Create responsibility
--
INSERT INTO KRIM_RSP_T (RSP_ID,NMSPC_CD,NM,ACTV_IND,RSP_TMPL_ID,VER_NBR,DESC_TXT,OBJ_ID) 
  VALUES (KRIM_RSP_ID_S.NEXTVAL,'MYUNI-KS-CM','DeptPreReview','Y','1',1,'Responsibility for Department Pre Review','MYUNI_WF_RSP_DEPT_PRE_REV')
/
--
-- Define responsiblity details (4 attributes)
--
 
-- First attribute is 13 = documentTypeName (matches against the parent doc type defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'CluCreditCourseParentDocument','13','7','MYUNI_WF_RSP_DEPT_PRE_REV_ATTR01',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Second attribute is 16 = routeNodeName (matches against the route node name defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'Department Pre Review','16','7','MYUNI_WF_RSP_DEPT_PRE_REV_ATTR02',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Third attribute is 41 = actionDetailsAtRoleMemberLevel (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','41','7','MYUNI_WF_RSP_DEPT_PRE_REV_ATTR03',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Forth attribute is 40 = required (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','40','7','MYUNI_WF_RSP_DEPT_PRE_REV_ATTR04',KRIM_RSP_ID_S.CURRVAL,1)  
/
--
-- Assign role(s) to responsibilities (Department Curriculum Manager)
--

-- Link Role: Department Curriculum Manager to Responsibility: Responsibility for Department Pre Review
INSERT INTO KRIM_ROLE_RSP_T (ACTV_IND,OBJ_ID,RSP_ID,ROLE_ID,ROLE_RSP_ID,VER_NBR) 
  VALUES ('Y','MYUNI_WF_RSP_DEPT_PRE_REV_ROL01', KRIM_RSP_ID_S.CURRVAL, (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Department Curriculum Manager'),KRIM_ROLE_RSP_ID_S.NEXTVAL,1)
/
-- Tell KEW to generate an action request where A=Approve is required, and action policy F=first
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,OBJ_ID,VER_NBR,ACTN_TYP_CD,ACTN_PLCY_CD,ROLE_MBR_ID,ROLE_RSP_ID,FRC_ACTN) 
  VALUES (KRIM_ROLE_RSP_ACTN_ID_S.NEXTVAL,'MYUNI_WF_RSP_DEPT_PRE_REV_ACT01',1,'A','F','*',KRIM_ROLE_RSP_ID_S.CURRVAL,'Y')  
/



 
-- Responsibility for Department Chair Review
--
-- Node: Department Chair Review 
--
--		<role name="Department Chair Review">
--			<activationType>P</activationType>
--			<qualifierResolverClass>org.kuali.student.lum.workflow.qualifierresolver.OrganizationQualifierResolver</qualifierResolverClass>
--			<organizationTypeCode>kuali.org.Department</organizationTypeCode>
--			<organizationIdQualifierKey>department</organizationIdQualifierKey>
--		</role>
--  

--
--  Create responsibility
--
INSERT INTO KRIM_RSP_T (RSP_ID,NMSPC_CD,NM,ACTV_IND,RSP_TMPL_ID,VER_NBR,DESC_TXT,OBJ_ID) 
  VALUES (KRIM_RSP_ID_S.NEXTVAL,'MYUNI-KS-CM','DeptChairReview','Y','1',1,'Responsibility for Department Chair Review','MYUNI_WF_RSP_DEPT_CHAIR_REV')
/
--
-- Define responsibility details (4 attributes)
--

-- First attribute is 13 = documentTypeName (matches against the parent doc type defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'CluCreditCourseParentDocument','13','7','MYUNI_WF_RSP_DEPT_CHAIR_REV_ATTR01',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Second attribute is 16 = routeNodeName (matches against the route node name defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'Department Chair Review','16','7','MYUNI_WF_RSP_DEPT_CHAIR_REV_ATTR02',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Third attribute is 41 = actionDetailsAtRoleMemberLevel (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','41','7','MYUNI_WF_RSP_DEPT_CHAIR_REV_ATTR03',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Forth attribute is 40 = required (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','40','7','MYUNI_WF_RSP_DEPT_CHAIR_REV_ATTR04',KRIM_RSP_ID_S.CURRVAL,1)  
/
--
-- Assign role(s) to responsibilities 
--

-- Link Role: Department Chair to Responsibility: Responsibility for Department Chair Review
INSERT INTO KRIM_ROLE_RSP_T (ACTV_IND,OBJ_ID,RSP_ID,ROLE_ID,ROLE_RSP_ID,VER_NBR) 
  VALUES ('Y','MYUNI_WF_RSP_DEPT_CHAIR_REV_ROL01', KRIM_RSP_ID_S.CURRVAL, (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Department Chair'),KRIM_ROLE_RSP_ID_S.NEXTVAL,1)
/

-- Tell KEW to generate an action request where A=Approve is required, and action policy F=first
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,OBJ_ID,VER_NBR,ACTN_TYP_CD,ACTN_PLCY_CD,ROLE_MBR_ID,ROLE_RSP_ID,FRC_ACTN) 
  VALUES (KRIM_ROLE_RSP_ACTN_ID_S.NEXTVAL,'MYUNI_WF_RSP_DEPT_CHAIR_REV_ACT01',1,'A','F','*',KRIM_ROLE_RSP_ID_S.CURRVAL,'Y')  
/
 
 

   
-- Responsibility for College Review
--
-- Node: College Review 
--
--
--    <role name="College Review">
--			<activationType>P</activationType>
--			<qualifierResolverClass>org.kuali.student.lum.workflow.qualifierresolver.ParentOrganizationQualifierResolver</qualifierResolverClass>
--			<relatedOrganizationType>kuali.org.College</relatedOrganizationType>
--			<organizationRelationType>kuali.org.CurriculumParent</organizationRelationType>
--			<organizationIdQualifierKey>college</organizationIdQualifierKey>
--    </role>
--  

--
--  Create responsibility
-- 
INSERT INTO KRIM_RSP_T (RSP_ID,NMSPC_CD,NM,ACTV_IND,RSP_TMPL_ID,VER_NBR,DESC_TXT,OBJ_ID) 
  VALUES (KRIM_RSP_ID_S.NEXTVAL,'MYUNI-KS-CM','CollegeReview','Y','1',1,'Responsibility for College Review','MYUNI_WF_RSP_COLLEGE_REV')
/
--
-- Define responsibility details (4 attributes)
--

-- First attribute is 13 = documentTypeName (matches against the parent doc type defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'CluCreditCourseParentDocument','13','7','MYUNI_WF_RSP_COLLEGE_REV_ATTR01',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Second attribute is 16 = routeNodeName (matches against the route node name defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'College Review','16','7','MYUNI_WF_RSP_COLLEGE_REV_ATTR02',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Third attribute is 41 = actionDetailsAtRoleMemberLevel (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','41','7','MYUNI_WF_RSP_COLLEGE_REV_ATTR03',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Forth attribute is 40 = required (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','40','7','MYUNI_WF_RSP_COLLEGE_REV_ATTR04',KRIM_RSP_ID_S.CURRVAL,1)  
/
--
-- Assign role(s) to responsibilities 
--

-- Link Role: College Curriculum Manager to Responsibility: Responsibility for College Review
INSERT INTO KRIM_ROLE_RSP_T (ACTV_IND,OBJ_ID,RSP_ID,ROLE_ID,ROLE_RSP_ID,VER_NBR) 
  VALUES ('Y','MYUNI_WF_RSP_COLLEGE_REV_ROL01', KRIM_RSP_ID_S.CURRVAL, (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='College Curriculum Manager'),KRIM_ROLE_RSP_ID_S.NEXTVAL,1)
/

-- Tell KEW to generate an action request where A=Approve is required, and action policy F=first
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,OBJ_ID,VER_NBR,ACTN_TYP_CD,ACTN_PLCY_CD,ROLE_MBR_ID,ROLE_RSP_ID,FRC_ACTN) 
  VALUES (KRIM_ROLE_RSP_ACTN_ID_S.NEXTVAL,'MYUNI_WF_RSP_COLLEGE_REV_ACT01',1,'A','F','*',KRIM_ROLE_RSP_ID_S.CURRVAL,'Y')  
/
 


 


-- Responsibility for Scheduling Office Review
--
-- Node: Scheduling Office Processing 
--
--
--    <role name="Scheduling Office Processing">
--      <activationType>P</activationType>
--    </role>
--  

--
--  Create responsibility
-- 
INSERT INTO KRIM_RSP_T (RSP_ID,NMSPC_CD,NM,ACTV_IND,RSP_TMPL_ID,VER_NBR,DESC_TXT,OBJ_ID) 
  VALUES (KRIM_RSP_ID_S.NEXTVAL,'MYUNI-KS-CM','SchOffProcessing','Y','1',1,'Responsibility for Scheduling Office Processing','MYUNI_WF_RSP_SCHED_OFF_REV')
/
--
-- Define responsiblity details (4 attributes)
--

-- First attribute is 13 = documentTypeName (matches against the parent doc type defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'CluCreditCourseParentDocument','13','7','MYUNI_WF_RSP_SCHED_OFF_REV_ATTR01',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Second attribute is 16 = routeNodeName (matches against the route node name defined in myuniDocumentType.xml)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'College Review','16','7','MYUNI_WF_RSP_SCHED_OFF_REV_ATTR02',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Third attribute is 41 = actionDetailsAtRoleMemberLevel (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','41','7','MYUNI_WF_RSP_SCHED_OFF_REV_ATTR03',KRIM_RSP_ID_S.CURRVAL,1)
/
-- Forth attribute is 40 = required (see description above)
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,ATTR_VAL,KIM_ATTR_DEFN_ID,KIM_TYP_ID,OBJ_ID,RSP_ID,VER_NBR) 
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,'false','40','7','MYUNI_WF_RSP_SCHED_OFF_REV_ATTR04',KRIM_RSP_ID_S.CURRVAL,1)  
/
--
-- Assign role(s) to responsibilities 
--
 
-- Link Role: Scheduling Office Course Reviewer to Responsiblity: Responsibility for Scheduling Office Review
INSERT INTO KRIM_ROLE_RSP_T (ACTV_IND,OBJ_ID,RSP_ID,ROLE_ID,ROLE_RSP_ID,VER_NBR) 
  VALUES ('Y','MYUNI_WF_RSP_SCHED_OFF_REV_ROL01', KRIM_RSP_ID_S.CURRVAL, (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Scheduling Office Course Reviewer'),KRIM_ROLE_RSP_ID_S.NEXTVAL,1)
/

-- Tell KEW to generate an action request where A=Approve is required, and action policy F=first
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,OBJ_ID,VER_NBR,ACTN_TYP_CD,ACTN_PLCY_CD,ROLE_MBR_ID,ROLE_RSP_ID,FRC_ACTN) 
  VALUES (KRIM_ROLE_RSP_ACTN_ID_S.NEXTVAL,'MYUNI_WF_RSP_SCHED_OFF_REV_ACT01',1,'A','F','*',KRIM_ROLE_RSP_ID_S.CURRVAL,'Y')  
/
 


