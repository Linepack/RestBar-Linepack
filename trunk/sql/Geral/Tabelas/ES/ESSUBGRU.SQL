create table ESSUBGRU(
 cd_grupo       number(5),
 cd_sub_grupo   number(5),
 ds_sub_grupo   varchar2(30) not null
)
/

ALTER TABLE ESSUBGRU
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
 ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table ESSUBGRU
 add constraint FK_ESSUBGRU_ESGRUPOS_CD_GRUPO foreign key (cd_grupo)
     references esgrupos(cd_grupo)
/

create index FK_ESSUBGRU_ESGRUPOS_ix on ESSUBGRU(cd_grupo)
 tablespace indices_tablespace
/
 
alter table ESSUBGRU
 add constraint PK_ESSUBGRU primary key (cd_grupo, cd_sub_grupo)
/

comment on column essubgru.cd_grupo is 'Código do grupo, referente esgrupos.cd_grupo';
comment on column essubgru.cd_sub_grupo is 'Código do Sub-Grupo';
comment on column essubgru.ds_sub_grupo is 'Descrição do Sub-Grupo';

create public synonym ESSUBGRU for ESSUBGRU
/

grant all on ESSUBGRU to linepack_role
/