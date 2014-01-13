create table ESDEPOSI(
 cd_fil   number(2),
 cd_dep   number(2),
 ds_dep   varchar2(30) not null
)
/

ALTER TABLE ESDEPOSI
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
 ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table ESDEPOSI
 add constraint FK_ESDEPOSI_GEFILIAL foreign key (cd_fil) 
  references GEFILIAL (cd_fil)
/

create index FK_ESDEPOSI_GEFILIAL_ix on ESDEPOSI(cd_fil)
 tablespace indices_tablespace
/

alter table ESDEPOSI
 add constraint PK_ESDEPOSI primary key (cd_fil, cd_dep)
/

comment on column ESDEPOSI.cd_fil is 'Código da filial referente GEFILIAL.cd_fil';
comment on column ESDEPOSI.cd_dep is 'Código do Depósito';
comment on column ESDEPOSI.ds_dep is 'Descrição do Depósito';

create public synonym ESDEPOSI for ESDEPOSI
/

grant all on ESDEPOSI to linepack_role
/


