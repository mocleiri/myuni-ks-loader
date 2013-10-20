update KSST_REQ_COM_TYPE
set TYPE_DESC = 'Students who have taken courses with comparable content may contact the department'
where TYPE_KEY = 'kuali.reqComponent.type.course.content.dept.contact';

update KSST_REQ_COM_TYPE_NL_TMPL
set TEMPLATE = 'Students who have taken courses with comparable content may contact the department'
where OWNER = 'kuali.reqComponent.type.course.content.dept.contact'
and TEMPLATE is not null;