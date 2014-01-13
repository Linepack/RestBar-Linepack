create sequence SQ_GECONPAG
 increment by 1
 start with 1
 nocache
/

create public synonym SQ_GECONPAG for SQ_GECONPAG
/

grant all on SQ_GECONPAG to linepack_role
/