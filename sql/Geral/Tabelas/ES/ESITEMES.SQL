create table esitemes(
 cd_item      number(5),
 ds_item      varchar2(100) not null,
 st_item      char(1) not null,
 cd_barra     number(30),
 cd_grupo     number(5),
 cd_sub_grupo number(5),
 cd_tipo      number(2) not null,
 cd_unimed    varchar2(3) not null,
 vl_item      number(14,4),
 ob_item      varchar2(2000)
)
/

ALTER TABLE ESITEMES
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
 ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table esitemes
 add constraint FK_ESITEMES_ESUNIMED foreign key (cd_unimed)
  references ESUNIMED(cd_unimed)
/

create index FK_ESITEMES_ESUNIMED_ix on esitemes(cd_unimed)
 tablespace indices_tablespace
/

alter table esitemes
 add constraint FK_ESITEMES_ESTIPITE foreign key (cd_tipo)
  references ESTIPITE(cd_tipo)
/

create index FK_ESITEMES_ESTIPITE_ix on esitemes(cd_tipo)
 tablespace indices_tablespace
/

alter table esitemes 
 add constraint FK_ESITEMES_ESSUBGRU foreign key (cd_grupo, cd_sub_grupo)
  references ESSUBGRU(cd_grupo, cd_sub_grupo)
/

create index FK_ESITEMES_ESSUBGRU_ix on esitemes(cd_grupo, cd_sub_grupo)
 tablespace indices_tablespace
/

alter table esitemes
 add constraint CK_ESITEMES_ST_ITEM check (st_item in ('A','I'))
/

alter table esitemes 
 add constraint PK_ESITEMES primary key (cd_item)
/

comment on column esitemes.cd_item is 'Código do item';
comment on column esitemes.ds_item is 'Descrição do item';
comment on column esitemes.st_item is 'Ativo ou Inativo';
comment on column esitemes.cd_barra is 'Código de barras referenciado ao produto';
comment on column esitemes.cd_grupo is 'Código do grupo';
comment on column esitemes.cd_sub_grupo is 'Código do Sub-Grupo';
comment on column esitemes.cd_tipo is 'Código do Tipo do Item';
comment on column esitemes.cd_unimed is 'Código da Unidade de Medida';
comment on column esitemes.vl_item is 'Valor do item';
comment on column esitemes.ob_item is 'Observação do item';


create public synonym ESITEMES for ESITEMES
/

grant all on ESITEMES to linepack_role
/













