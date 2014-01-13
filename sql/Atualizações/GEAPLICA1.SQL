alter table geaplica
 drop constraint CK_GEAPLICA_ST_INCLUSAO
/

alter table geaplica
 add constraint CK_GEAPLICA_ST_INCLUSAO check (st_inclusao in ('S','N','F'))
/

alter table geaplica
 drop constraint CK_GEAPLICA_ST_alteracao
/

alter table geaplica
 add constraint CK_GEAPLICA_ST_ALTERACAO check (st_alteracao in ('S','N','F'))
/

alter table geaplica
 drop constraint CK_GEAPLICA_ST_EXCLUSAO
/

alter table geaplica
 add constraint CK_GEAPLICA_ST_EXCLUSAO check (st_exclusao in ('S','N','F'))
/