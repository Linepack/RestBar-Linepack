create sequence SQ_ENDERE
increment by 1
start with 1
nocache
/


create public synonym SQ_ENDERE for SQ_ENDERE
/


grant all on SQ_ENDERE to linepack_role
/