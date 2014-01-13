alter table GEUSUAPL
 drop constraint CK_GEUSUAPL_ST_INCLUSAO
/

alter table GEUSUAPL
 add constraint CK_GEUSUAPL_ST_INCLUSAO check (st_inclusao in ('S','N','F'))
/

alter table GEUSUAPL
 drop constraint CK_GEUSUAPL_ST_alteracao
/

alter table GEUSUAPL
 add constraint CK_GEUSUAPL_ST_ALTERACAO check (st_alteracao in ('S','N','F'))
/

alter table GEUSUAPL
 drop constraint CK_GEUSUAPL_ST_EXCLUSAO
/

alter table GEUSUAPL
 add constraint CK_GEUSUAPL_ST_EXCLUSAO check (st_exclusao in ('S','N','F'))
/