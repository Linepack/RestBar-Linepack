create sequence sq_ftmesven
 increment by 1
 start with 1
 nocache
/

create public synonym SQ_FTMESVEN for SQ_FTMESVEN
/

grant all on FTMESVEN to linepack_role
/