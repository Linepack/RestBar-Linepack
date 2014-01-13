create table ESGRUPOS(
 CD_GRUPO   NUMBER(5),
 DS_GRUPO   VARCHAR2(30) NOT NULL
)
/

ALTER TABLE ESGRUPOS
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
 ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table ESGRUPOS
 add constraint PK_ESGRUPOS primary key (cd_grupo)
/

comment on column ESGRUPOS.cd_grupo is 'Código do Grupo';
comment on column ESGRUPOS.ds_grupo is 'Descrição do Grupo';

create public synonym ESGRUPOS for ESGRUPO
/

grant all on ESGRUPOS to linepack_role
/


