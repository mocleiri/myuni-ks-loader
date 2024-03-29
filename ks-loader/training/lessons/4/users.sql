-- Users
--
-- Users consist of an entity and principal.  More information below.
-- This SQL was generate using p6spy to log SQL while creating the user in the UI
-- You can also create a user in the Rice UI by using the 'person' link on the admin tab 
-- (click create person button in upper right corner of screen)

-- Entity
--
-- An entity represents a person or system. Additionally, other "types" of entities can be defined in KIM.
-- Information like name, phone number, etc. is associated with an entity. While an entity will typically have
-- a single principal associated with it, it is possible for an entity to have more than one principal or even
-- no principals at all (in the case where the entity does not actually authenticate).
-- Entities have numerous attributes associated with them, including names, addresses,phone numbers...

-- Principal 
--
-- A principal represents an entity that can authenticate. In essence, you can think of a principal
-- as an "account" or as an entity's authentication credentials. A principal has an ID that is used
-- to uniquely identify it. It also has a name that represents the principal's username and is typically 
-- what is entered when authenticating. All principals are associated with one and only one entity.
--
-- See https://wiki.kuali.org/display/STUDENTDOC/%28CM+2.0%29+6.4.4.1+Principals
-- See http://site.kuali.org/rice/2.2.5/reference/html/TRG.html#d1360e10448


-- Cleanup so we can run script twice
delete from KRIM_ENTITY_PRIV_PREF_T where ENTITY_ID in ('MYUNI-JOE-ENTID','MYUNI-BILL-ENTID','MYUNI-JANE-ENTID','MYUNI-CINDY-ENTID')
/
delete from KRIM_ENTITY_T where ENTITY_ID in ('MYUNI-JOE-ENTID','MYUNI-BILL-ENTID','MYUNI-JANE-ENTID','MYUNI-CINDY-ENTID')
/
delete from KRIM_ENTITY_NM_T where ENTITY_ID in ('MYUNI-JOE-ENTID','MYUNI-BILL-ENTID','MYUNI-JANE-ENTID','MYUNI-CINDY-ENTID')
/
delete from KRIM_ENTITY_ENT_TYP_T where ENTITY_ID in ('MYUNI-JOE-ENTID','MYUNI-BILL-ENTID','MYUNI-JANE-ENTID','MYUNI-CINDY-ENTID')
/
delete from KRIM_PRNCPL_T where ENTITY_ID in ('MYUNI-JOE-ENTID','MYUNI-BILL-ENTID','MYUNI-JANE-ENTID','MYUNI-CINDY-ENTID')
/
delete from KRIM_ENTITY_AFLTN_T where ENTITY_ID in ('MYUNI-JOE-ENTID','MYUNI-BILL-ENTID','MYUNI-JANE-ENTID','MYUNI-CINDY-ENTID')
/
delete from KRIM_ENTITY_EMP_INFO_T where ENTITY_ID in ('MYUNI-JOE-ENTID','MYUNI-BILL-ENTID','MYUNI-JANE-ENTID','MYUNI-CINDY-ENTID')
/

-- Create user 'joe'
INSERT INTO KRIM_ENTITY_T (ENTITY_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JOE-ENTID','Y','1','MYUNI-JOE-UUID-5fd9a4ba7dee') 
/
INSERT INTO KRIM_ENTITY_PRIV_PREF_T (ENTITY_ID,SUPPRESS_NM_IND,SUPPRESS_EMAIL_IND,SUPPRESS_ADDR_IND,SUPPRESS_PHONE_IND,SUPPRESS_PRSNL_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JOE-ENTID','N','N','N','N','N','1','MYUNI-JOE-UUID-e6c126df9e4b') 
/
INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID,ENTITY_ID,NM_TYP_CD,FIRST_NM,MIDDLE_NM,LAST_NM,PREFIX_NM,TITLE_NM,SUFFIX_NM,NOTE_MSG,NM_CHNG_DT,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JOE-ENTNAMEID','MYUNI-JOE-ENTID','OTH','joe','','Fake','','','','','','Y','Y','1','MYUNI-JOE-UUID-614c72f76b92') 
/
INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID,ENT_TYP_CD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JOE-ENTID','PERSON','Y','1','MYUNI-JOE-UUID-cc3da6738bd3') 
/
INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID,PRNCPL_NM,ENTITY_ID,PRNCPL_PSWD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JOE-PRINCP-ID','joe','MYUNI-JOE-ENTID','','Y','1','MYUNI-JOE-UUID-0bff54fdb92b') 
/
INSERT INTO KRIM_ENTITY_AFLTN_T (ENTITY_AFLTN_ID,ENTITY_ID,AFLTN_TYP_CD,CAMPUS_CD,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JOE-ENT-AFF-ID','MYUNI-JOE-ENTID','FCLTY','AL','Y','Y','1','MYUNI-JOE-UUID-b4ff-f7bb82486dfd') 
/
INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID,ENTITY_ID,ENTITY_AFLTN_ID,EMP_STAT_CD,EMP_TYP_CD,PRMRY_DEPT_CD,BASE_SLRY_AMT,PRMRY_IND,ACTV_IND,VER_NBR,OBJ_ID,EMP_ID,EMP_REC_ID) VALUES ('MYUNI-JOE-ENT-EMP-ID','MYUNI-JOE-ENTID','MYUNI-JOE-ENT-AFF-ID','A','P','','50000.00','Y','Y','1','MYUNI-JOE-UUID-ad16c5deb8e7','9990000001','1') 
/

-- Create user 'bill'
INSERT INTO KRIM_ENTITY_T (ENTITY_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-BILL-ENTID','Y','1','MYUNI-BILL-UUID-5fd9a4ba7dee') 
/
INSERT INTO KRIM_ENTITY_PRIV_PREF_T (ENTITY_ID,SUPPRESS_NM_IND,SUPPRESS_EMAIL_IND,SUPPRESS_ADDR_IND,SUPPRESS_PHONE_IND,SUPPRESS_PRSNL_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-BILL-ENTID','N','N','N','N','N','1','MYUNI-BILL-UUID-e6c126df9e4b') 
/
INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID,ENTITY_ID,NM_TYP_CD,FIRST_NM,MIDDLE_NM,LAST_NM,PREFIX_NM,TITLE_NM,SUFFIX_NM,NOTE_MSG,NM_CHNG_DT,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-BILL-ENTNAMEID','MYUNI-BILL-ENTID','OTH','bill','','Fake','','','','','','Y','Y','1','MYUNI-BILL-UUID-614c72f76b92') 
/
INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID,ENT_TYP_CD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-BILL-ENTID','PERSON','Y','1','MYUNI-BILL-UUID-cc3da6738bd3') 
/
INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID,PRNCPL_NM,ENTITY_ID,PRNCPL_PSWD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-BILL-PRINCP-ID','bill','MYUNI-BILL-ENTID','','Y','1','MYUNI-BILL-UUID-0bff54fdb92b') 
/
INSERT INTO KRIM_ENTITY_AFLTN_T (ENTITY_AFLTN_ID,ENTITY_ID,AFLTN_TYP_CD,CAMPUS_CD,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-BILL-ENT-AFF-ID','MYUNI-BILL-ENTID','FCLTY','AL','Y','Y','1','MYUNI-BILL-UUID-b4ff-f7bb82486dfd') 
/
INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID,ENTITY_ID,ENTITY_AFLTN_ID,EMP_STAT_CD,EMP_TYP_CD,PRMRY_DEPT_CD,BASE_SLRY_AMT,PRMRY_IND,ACTV_IND,VER_NBR,OBJ_ID,EMP_ID,EMP_REC_ID) VALUES ('MYUNI-BILL-ENT-EMP-ID','MYUNI-BILL-ENTID','MYUNI-BILL-ENT-AFF-ID','A','P','','50000.00','Y','Y','1','MYUNI-BILL-UUID-ad16c5deb8e7','9990000001','1') 
/

-- Create user 'jane'
INSERT INTO KRIM_ENTITY_T (ENTITY_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JANE-ENTID','Y','1','MYUNI-JANE-UUID-5fd9a4ba7dee') 
/
INSERT INTO KRIM_ENTITY_PRIV_PREF_T (ENTITY_ID,SUPPRESS_NM_IND,SUPPRESS_EMAIL_IND,SUPPRESS_ADDR_IND,SUPPRESS_PHONE_IND,SUPPRESS_PRSNL_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JANE-ENTID','N','N','N','N','N','1','MYUNI-JANE-UUID-e6c126df9e4b') 
/
INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID,ENTITY_ID,NM_TYP_CD,FIRST_NM,MIDDLE_NM,LAST_NM,PREFIX_NM,TITLE_NM,SUFFIX_NM,NOTE_MSG,NM_CHNG_DT,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JANE-ENTNAMEID','MYUNI-JANE-ENTID','OTH','jane','','Fake','','','','','','Y','Y','1','MYUNI-JANE-UUID-614c72f76b92') 
/
INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID,ENT_TYP_CD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JANE-ENTID','PERSON','Y','1','MYUNI-JANE-UUID-cc3da6738bd3') 
/
INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID,PRNCPL_NM,ENTITY_ID,PRNCPL_PSWD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JANE-PRINCP-ID','jane','MYUNI-JANE-ENTID','','Y','1','MYUNI-JANE-UUID-0bff54fdb92b') 
/
INSERT INTO KRIM_ENTITY_AFLTN_T (ENTITY_AFLTN_ID,ENTITY_ID,AFLTN_TYP_CD,CAMPUS_CD,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-JANE-ENT-AFF-ID','MYUNI-JANE-ENTID','FCLTY','AL','Y','Y','1','MYUNI-JANE-UUID-b4ff-f7bb82486dfd') 
/
INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID,ENTITY_ID,ENTITY_AFLTN_ID,EMP_STAT_CD,EMP_TYP_CD,PRMRY_DEPT_CD,BASE_SLRY_AMT,PRMRY_IND,ACTV_IND,VER_NBR,OBJ_ID,EMP_ID,EMP_REC_ID) VALUES ('MYUNI-JANE-ENT-EMP-ID','MYUNI-JANE-ENTID','MYUNI-JANE-ENT-AFF-ID','A','P','','50000.00','Y','Y','1','MYUNI-JANE-UUID-ad16c5deb8e7','9990000001','1') 
/

-- Create user 'cindy'
INSERT INTO KRIM_ENTITY_T (ENTITY_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-CINDY-ENTID','Y','1','MYUNI-CINDY-UUID-5fd9a4ba7dee') 
/
INSERT INTO KRIM_ENTITY_PRIV_PREF_T (ENTITY_ID,SUPPRESS_NM_IND,SUPPRESS_EMAIL_IND,SUPPRESS_ADDR_IND,SUPPRESS_PHONE_IND,SUPPRESS_PRSNL_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-CINDY-ENTID','N','N','N','N','N','1','MYUNI-CINDY-UUID-e6c126df9e4b') 
/
INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID,ENTITY_ID,NM_TYP_CD,FIRST_NM,MIDDLE_NM,LAST_NM,PREFIX_NM,TITLE_NM,SUFFIX_NM,NOTE_MSG,NM_CHNG_DT,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-CINDY-ENTNAMEID','MYUNI-CINDY-ENTID','OTH','cindy','','Fake','','','','','','Y','Y','1','MYUNI-CINDY-UUID-614c72f76b92') 
/
INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID,ENT_TYP_CD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-CINDY-ENTID','PERSON','Y','1','MYUNI-CINDY-UUID-cc3da6738bd3') 
/
INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID,PRNCPL_NM,ENTITY_ID,PRNCPL_PSWD,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-CINDY-PRINCP-ID','cindy','MYUNI-CINDY-ENTID','','Y','1','MYUNI-CINDY-UUID-0bff54fdb92b') 
/
INSERT INTO KRIM_ENTITY_AFLTN_T (ENTITY_AFLTN_ID,ENTITY_ID,AFLTN_TYP_CD,CAMPUS_CD,DFLT_IND,ACTV_IND,VER_NBR,OBJ_ID) VALUES ('MYUNI-CINDY-ENT-AFF-ID','MYUNI-CINDY-ENTID','FCLTY','AL','Y','Y','1','MYUNI-CINDY-UUID-b4ff-f7bb82486dfd') 
/
INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID,ENTITY_ID,ENTITY_AFLTN_ID,EMP_STAT_CD,EMP_TYP_CD,PRMRY_DEPT_CD,BASE_SLRY_AMT,PRMRY_IND,ACTV_IND,VER_NBR,OBJ_ID,EMP_ID,EMP_REC_ID) VALUES ('MYUNI-CINDY-ENT-EMP-ID','MYUNI-CINDY-ENTID','MYUNI-CINDY-ENT-AFF-ID','A','P','','50000.00','Y','Y','1','MYUNI-CINDY-UUID-ad16c5deb8e7','9990000001','1') 
/

 