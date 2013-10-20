-- Technically this is a fix which is needed for Rice 2.x
-- We are applying it now while deploying UMDCM 1.6 to get it out of the way.
-- Sets default permission for use screen so it works w.o overriding rice config.
-- Without this permission set, and without the config KS will crash when attempting to load the main screen.
-- Also set default perms for default, field permission type and doc type and route note.
update KRIM_TYP_T set SRVC_NM='defaultPermissionTypeService' where NM='KS Use Screen' and NMSPC_CD='KS-SYS'
/
update KRIM_TYP_T set SRVC_NM='defaultPermissionTypeService' where NM='Default' and NMSPC_CD='KUALI'
/
update KRIM_TYP_T set SRVC_NM='defaultPermissionTypeService' where NM='Field Permission Type' and NMSPC_CD='KS-SYS'
/
update KRIM_TYP_T set SRVC_NM='defaultPermissionTypeService' where NM='Document Type and Route Node' and NMSPC_CD='KS-SYS'
/
