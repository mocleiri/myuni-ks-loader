CREATE INDEX KSLU_CLU_I7 ON KSLU_CLU
(LUTYPE_ID,ST, OFFIC_CLU_ID, RT_DESCR_ID, CURR_VER_START, CURR_VER_END 
)
/

CREATE INDEX KSLU_CLU_I8 ON KSLU_CLU
(VER_IND_ID, CURR_VER_START, CURR_VER_END 
)
/

CREATE INDEX KSLU_CLU_IDENT_I1 ON KSLU_CLU_IDENT
(CD ASC)
/