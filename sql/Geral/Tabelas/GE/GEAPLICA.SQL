create table GEAPLICA
(
  CD_APLICACAO VARCHAR2(8) not null,
  NM_APLICACAO VARCHAR2(80) not null,
  ST_BLOQUEADO VARCHAR2(1) ,
  ST_INCLUSAO  VARCHAR2(1) not null,
  ST_ALTERACAO VARCHAR2(1) not null,
  ST_EXCLUSAO  VARCHAR2(1) not null,
  DS_HELP      VARCHAR2(4000),
  NM_USUINC    VARCHAR2(30) not null,
  DT_USUINC    DATE not null,
  NM_USUALT    VARCHAR2(30),
  DT_USUALT    DATE,
  ST_APLICACAO CHAR(1) default 'N' not null,
  CD_MODULO    VARCHAR2(2)
)
tablespace DADOS_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

comment on column geaplica.cd_aplicacao is 'Código da Aplicação';
comment on column geaplica.nm_aplicacao is 'Nome da Aplicação';
comment on column geaplica.st_aplicacao is 'Situação da Aplicação';

-- Create/Recreate primary, unique and foreign key constraints 
alter table GEAPLICA
  add constraint PK_GEAPLICA primary key (CD_APLICACAO)
  using index 
  tablespace DADOS_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

-- Create/Recreate check constraints 
alter table GEAPLICA
  add constraint CK_GEAPLICA_ST_ALTERACAO
  check (ST_ALTERACAO IN ('S', 'N'));
alter table GEAPLICA
  add constraint CK_GEAPLICA_ST_BLOQUADO
  check (ST_BLOQUEADO IN ('S', 'N'));
alter table GEAPLICA
  add constraint CK_GEAPLICA_ST_EXCLUSAO
  check (ST_EXCLUSAO IN ('S', 'N'));
alter table GEAPLICA
  add constraint CK_GEAPLICA_ST_INCLUSAO
  check (ST_INCLUSAO IN ('S', 'N'));


create public synonym geaplica for geaplica;

grant all on geaplica to linepack_role;