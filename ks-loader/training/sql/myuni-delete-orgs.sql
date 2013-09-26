
-- Delete reference orgs.  The reason we are leaving 4, 141, and UW000 is 
-- because there's a foreign key constraint preventing us from deleting orgs that
-- reference those ids.  These ids are the root of the hierarchy.
-- Current best practice is to reuse them and just change the description etc for
-- your university
delete from KSOR_ORG where id not in ('4','141','UW000')
/
-- Rebrand curriculum hierarchy as mentioned in comment above
update KSOR_ORG set LNG_DESCR='My University Root Node', SHRT_DESCR='MYUCURROOT',LONG_NAME='My University Root Node'  where id='141'
/
-- Clean out relations
delete from KSOR_ORG_ORG_RELTN
/
-- I don't think the person to org mapping are used in CM?
delete from KSOR_ORG_POS_RESTR
/
delete from KSOR_ORG_PERS_RELTN
/
delete from KSOR_ORG_JN_ORG_PERS_REL_TYPE
/

 
 