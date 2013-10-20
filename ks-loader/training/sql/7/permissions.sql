-- Permissions
--
-- Permissions represent fine grained actions that can be mapped to functionality within a given system. 
-- Permissions are scoped to Namespace which roughly correlate to modules or sections of functionality within a given system.

-- A developer would code authorization checks in their application against these permissions.
-- Some examples would be: "canSave", "canView", "canEdit", etc.
-- Permissions are aggregated by Roles.

-- Permissions can be maintained at runtime through a user interface that is capable of workflow; 
-- however, developers still need to code authorization checks against them in their code, once they are set up in the system.



-- Assign Create Course By Proposal permission to the Registrar Program Curriculum Manager role
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL, sys_guid(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Registrar Program Curriculum Manager'), (select perm_id from krim_perm_t where nm = 'Create Course By Proposal'), 'Y')
/
-- Assign KS Admin Screens permission to the Registrar Program Curriculum Manager role
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL, sys_guid(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Registrar Program Curriculum Manager'), (select perm_id from krim_perm_t where nm = 'Use Curriculum Review'), 'Y')
/  