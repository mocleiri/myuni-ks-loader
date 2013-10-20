-- deletes permissions 'Use Browse Catalog Screen',  'Scheduling Office Student Employee' 
-- ,and 'Pre-Production Test Users' from role 'Kuali Student CM User'
-- adds permission 'Use Browse Catalog Screen' for roles Scheduling Office Curriculum Manager 
-- and Academic Affairs Curriculum Manager

-- Delete from Kuali Student CM User
DELETE FROM krim_role_perm_t
WHERE 
 krim_role_perm_t.PERM_ID=(SELECT KRIM_PERM_T.PERM_ID FROM KRIM_PERM_T
        WHERE krim_perm_t.nm='Use Browse Catalog Screen') 
 AND  
 krim_role_perm_t.ROLE_ID=(SELECT KRIM_ROLE_T.ROLE_ID FROM KRIM_ROLE_T
        WHERE role_nm='Kuali Student CM User')
/

-- Delete from Scheduling Office Student Employee
DELETE FROM krim_role_perm_t
WHERE 
 krim_role_perm_t.PERM_ID=(SELECT KRIM_PERM_T.PERM_ID FROM KRIM_PERM_T
        WHERE krim_perm_t.nm='Use Browse Catalog Screen') 
 AND  
 krim_role_perm_t.ROLE_ID=(SELECT KRIM_ROLE_T.ROLE_ID FROM KRIM_ROLE_T
        WHERE role_nm='Scheduling Office Student Employee')
/
-- Delete from Pre-Production Test Users
DELETE FROM krim_role_perm_t
WHERE 
 krim_role_perm_t.PERM_ID=(SELECT KRIM_PERM_T.PERM_ID FROM KRIM_PERM_T
        WHERE krim_perm_t.nm='Use Browse Catalog Screen') 
 AND  
 krim_role_perm_t.ROLE_ID=(SELECT KRIM_ROLE_T.ROLE_ID FROM KRIM_ROLE_T
        WHERE role_nm='Pre-Production Test Users')
/

--- Assign to Scheduling Office Curriculum Manager
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR) VALUES ('Y',sys_guid(), (SELECT KRIM_PERM_T.PERM_ID FROM KRIM_PERM_T WHERE krim_perm_t.nm='Use Browse Catalog Screen'),
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Scheduling Office Curriculum Manager'),
KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/

--- Assign to Academic Affairs Curriculum Manager
INSERT INTO KRIM_ROLE_PERM_T (ACTV_IND,OBJ_ID,PERM_ID,ROLE_ID,ROLE_PERM_ID,VER_NBR) VALUES ('Y',sys_guid(), (SELECT KRIM_PERM_T.PERM_ID FROM KRIM_PERM_T WHERE krim_perm_t.nm='Use Browse Catalog Screen'),
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM='Academic Affairs Curriculum Manager'),
KRIM_ROLE_PERM_ID_S.NEXTVAL,1)
/