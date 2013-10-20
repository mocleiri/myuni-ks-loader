CREATE OR REPLACE VIEW
    CM.CM_APPR_CRS_XLIST
    (
        CRS_PREFIX_NUM,
        CLU_ID,
        START_TERM,
        END_TERM,
        VERSION_NUM,
        CRS_STAT,
        XLIST_CRS
    ) AS
SELECT
    i2.cd CRS_PREFIX_NUM,
    c1.id CLU_ID,
    SUBSTR(SUBSTR(c1.exp_first_atp,INSTR(c1.exp_first_atp,'.',-1)+1),1,4) || DECODE(SUBSTR(SUBSTR(c1.exp_first_atp,INSTR(c1.exp_first_atp,'.',-1)+1),5), 'Spring','01', 'Summer1','05','Summer2','07', 'Fall','08', 'Winter','12', SUBSTR(SUBSTR(c1.exp_first_atp,INSTR(c1.exp_first_atp,'.',-1)+1),5)) START_TERM,
    SUBSTR(SUBSTR(c1.last_atp,INSTR(c1.last_atp,'.',-1)+1),1,4)|| DECODE(SUBSTR(SUBSTR(c1.last_atp,INSTR(c1.last_atp,'.',-1)+1),5), 'Spring','01', 'Summer1','05', 'Summer2','07', 'Fall','08','Winter','12', SUBSTR(SUBSTR(c1.last_atp,INSTR(c1.last_atp,'.',-1)+1),5)) END_TERM,
    c1.seq_num VERSION_NUM,
    c1.st CRS_STAT,
    i3.cd XLIST_CRS
FROM  cm.kslu_clu_ident i 
left join cm.kslu_clu_jn_clu_ident j on i.id = j.alt_clu_id
left join cm.kslu_clu c1 on j.clu_id = c1.id
left join cm.kslu_clu_ident i2 on c1.offic_clu_id = i2.id
left join cm.kslu_clu_ident_attr a on i.id = a.owner
left join cm.kslu_clu c2 on a.attr_value = c2.id
left join cm.kslu_clu_ident i3 on c2.offic_clu_id = i3.id
where i.TYPE = 'kuali.lu.type.CreditCourse.identifier.crosslisting'
ORDER BY i2.cd
/