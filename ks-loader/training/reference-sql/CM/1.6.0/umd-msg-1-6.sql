-- KSCM-1286 Update window title text
update
 KSMG_MESSAGE
set
 MSG_VALUE='Testudo Curriculum Management'
where
 msg_id='applicationName' and
 grp_name='common' and
 locale='en'
/