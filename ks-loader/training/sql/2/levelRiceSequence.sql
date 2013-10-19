-- A patch to fix rice document ingestion
-- This will fix the unique constraint violation caused due to the sequence begin lower than the value in the table
-- Caused by: java.sql.SQLException: ORA-00001: unique constraint (RICEMYUNI.KREW_RTE_NODE_CFG_PARM_TP1) violated


ALTER SEQUENCE KREW_RTE_NODE_CFG_PARM_S INCREMENT BY 2000;
SELECT KREW_RTE_NODE_CFG_PARM_S.NEXTVAL FROM dual;
ALTER SEQUENCE KREW_RTE_NODE_CFG_PARM_S INCREMENT BY 1;