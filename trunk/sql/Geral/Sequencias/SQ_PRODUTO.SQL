create sequence SQ_PRODUTO
increment by 1
start with 1
nocache
/


create public synonym SQ_PRODUTO for SQ_PRODUTO
/


grant all on SQ_PRODUTO to linepack_role
/