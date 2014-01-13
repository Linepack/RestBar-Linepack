create sequence SQ_PESSOA
increment by 1
start with 1
nocache
/


create public synonym SQ_PESSOA for SQ_PESSOA
/


grant all on SQ_PESSOA to linepack_role
/
