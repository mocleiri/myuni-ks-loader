CREATE OR REPLACE VIEW
    CM.CM_APPR_CRS_FORMERLY
    (
        CRS_PREFIX_NUM,
        CLU_ID,
        START_TERM,
        END_TERM,
        VERSION_NUM,
        CRS_STAT,
        FORMER_CRS
    ) AS 
SELECT
    i.cd crs_prefix_num,
    c.id clu_id,
    SUBSTR(SUBSTR(c.exp_first_atp, INSTR(c.exp_first_atp, '.', -1) + 1), 1, 4) || 
        DECODE(SUBSTR(SUBSTR(c.exp_first_atp, INSTR(c.exp_first_atp, '.', -1) + 1), 5), 'Spring','01', 'Summer1','05', 'Summer2','07', 'Fall','08', 'Winter','12', SUBSTR(SUBSTR(c.exp_first_atp, INSTR(c.exp_first_atp, '.', -1) + 1), 5)) start_term,
    SUBSTR(SUBSTR(c.last_atp, INSTR(c.last_atp, '.', -1) + 1), 1, 4) || 
        DECODE(SUBSTR(SUBSTR(c.last_atp, INSTR(c.last_atp, '.', -1) + 1), 5), 'Spring','01', 'Summer1','05', 'Summer2','07', 'Fall','08', 'Winter','12', SUBSTR(SUBSTR(c.last_atp, INSTR(c.last_atp, '.', -1) + 1), 5)) end_term,
    c.seq_num version_num,
    c.st crs_stat,
    a.attr_value former_crs
FROM
    cm.kslu_clu_attr a
LEFT JOIN
    cm.kslu_clu c on a.owner = c.id
LEFT JOIN
    cm.kslu_clu_ident i on c.offic_clu_id = i.id
WHERE
    a.attr_name = 'formerly'
