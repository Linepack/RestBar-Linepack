create table ESDEPITE(
 cd_fil     number(2),
 cd_dep     number(2),
 cd_item    number(5),
 qt_est_min number(14,4)
)
/

ALTER TABLE ESDEPITE
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
 ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table ESDEPITE
 add constraint FK_ESDEPITE_ESITEMES foreign key (cd_item)
  references esitemes(cd_item)
/

create index FK_ESDEPITE_ESITEMES_ix on esdepite(cd_item)
 tablespace indices_tablespace
/

alter table ESDEPITE
 add constraint FK_ESDEPITE_ESDEPOSI foreign key (cd_fil, cd_dep)
  references esdeposi(cd_fil,cd_dep)
/

create index FK_ESDEPITE_ESDEPOSI_ix on esdepite(cd_fil, cd_dep)
 tablespace indices_tablespace
/

alter table esdepite
 add constraint PK_ESDEPITE primary key (cd_fil, cd_dep ,cd_item)
/

comment on column esdepite.cd_item is 'Código do item referente ESITEMES.cd_item';
comment on column esdepite.cd_dep is 'Código do Depósito do Item';

create public synonym ESDEPITE for ESDEPITE
/

grant all on ESDEPITE to linepack_role
/

