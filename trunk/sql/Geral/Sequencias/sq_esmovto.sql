create sequence SQ_ESMOVTO
 increment by 1
 start with 1
 nocache
/

CREATE public synonym SQ_ESMOVTO for SQ_ESMOVTO
/

grant all on sq_esmovto to linepack_role
/