--
--  RUN THE ORG DATA LOADER BEFORE DEFINING THE SUBJECT CODES, SINCE WE ARE GOING TO JOIN SUBHECT CODE TO ORG ID 145
--  FROM THE EXCEL SPREADSHEET TO LOADER IS USING.
--

--
-- Setup subject codes (areas)
-- For MyUni, we'll erase all the codes and just add a single for astrology (ASTR)
--
--
-- Delete the subject code join table (that table joining subject codes to orgs)
-- Note that a subject code can map to muliple orgs, allowing you to select one of
-- several orgs in the curriculum oversight drop-down (todo: can you choose 2 oversight orgs at the same time?)
delete from KSSC_SUBJ_CD_JN_ORG
/
-- Delete subject codes
delete from KSSC_SUBJ_CD
/
-- Add our astrology subject code
insert into KSSC_SUBJ_CD (ID, CREATEID, CREATETIME, UPDATEID, UPDATETIME, VER_NBR, NAME, STATE, CD, TYPE, OBJ_ID)
values ('1000', 'myuni', TIMESTAMP '2011-04-08 00:00:00', 'myuni', TIMESTAMP '2011-04-12 00:00:00', 2, 'Astrology', 'Actual', 
'ASTR', 'ks.core.subjectcode.usage.all', '3a512547-5442-4c3b-9965-6f3a0b60866c');
/
-- Join our subject code to our org we loaded in with Norm's loader tool
insert into KSSC_SUBJ_CD_JN_ORG (ID, ORG_ID, SUBJ_CD_ID, VER_NBR, EFF_DT, EXPIR_DT, OBJ_ID) values 
('111111-f0bd-4e66-a629-85e3708b82f1', '145', '1000', 1, TIMESTAMP '2011-04-01 00:00:00', null, '4444444-347A-7BAC-9A75-764F74DAF6B7');


