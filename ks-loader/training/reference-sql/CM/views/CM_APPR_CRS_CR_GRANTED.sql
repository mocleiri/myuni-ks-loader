CREATE OR REPLACE VIEW
    CM.CM_APPR_CRS_CR_GRANTED
    (
        CRS_PREFIX_NUM,
        CLU_ID,
        START_TERM,
        END_TERM,
        VERSION_NUM,
        CRS_STAT,
        CRS_CR_GRANTED
    ) AS
SELECT
    i.cd,
    c.id,
    SUBSTR(SUBSTR(c.exp_first_atp,INSTR(c.exp_first_atp,'.',-1)+1),1,4)|| DECODE(SUBSTR(SUBSTR
    (c.exp_first_atp,INSTR(c.exp_first_atp,'.',-1)+1),5), 'Spring','01', 'Summer1','05', 'Summer2',
    '07', 'Fall','08', 'Winter','12', SUBSTR(SUBSTR(c.exp_first_atp,INSTR(c.exp_first_atp,'.',-1)+1
    ),5)) EXP_FIRST_ATP,
    SUBSTR(SUBSTR(c.last_atp,INSTR(c.last_atp,'.',-1)+1),1,4)|| DECODE(SUBSTR(SUBSTR(c.last_atp,
    INSTR(c.last_atp,'.',-1)+1),5), 'Spring','01', 'Summer1','05', 'Summer2','07', 'Fall','08',
    'Winter','12', SUBSTR(SUBSTR(c.last_atp,INSTR(c.last_atp,'.',-1)+1),5)) LAST_ATP,
    c.seq_num,
    c.st,
    a.attr_value
FROM
    cm.kslu_clu_attr a
LEFT JOIN
    cm.kslu_clu c on a.owner = c.id
LEFT JOIN
    cm.kslu_clu_ident i on c.offic_clu_id = i.id
WHERE
    a.attr_name = 'creditGrantedFor'
