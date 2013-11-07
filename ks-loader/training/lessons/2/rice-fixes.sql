-- A patch to fix rice document ingestion
-- This will fix the unique constraint violation caused due to the sequence begin lower than the value in the table
-- Caused by: java.sql.SQLException: ORA-00001: unique constraint (RICEMYUNI.KREW_RTE_NODE_CFG_PARM_TP1) violated


ALTER SEQUENCE KREW_RTE_NODE_CFG_PARM_S INCREMENT BY 2000;
/
SELECT KREW_RTE_NODE_CFG_PARM_S.NEXTVAL FROM dual;
/
ALTER SEQUENCE KREW_RTE_NODE_CFG_PARM_S INCREMENT BY 1;
/

ALTER SEQUENCE KREW_RTE_NODE_S INCREMENT BY 2000;
/
SELECT KREW_RTE_NODE_S.NEXTVAL FROM dual;
/
ALTER SEQUENCE KREW_RTE_NODE_S INCREMENT BY 1;
/



- 
-- Delete duplicate KIM types in rice data.  These are breaking the roles
-- Screen since there are two KIM 'College Type' records:  101, 10008
-- and two 'Department Type' records: 102, 10009
delete from KRIM_TYP_T where KIM_TYP_ID='10008'
/
delete from KRIM_TYP_T where KIM_TYP_ID='10009'
/

 