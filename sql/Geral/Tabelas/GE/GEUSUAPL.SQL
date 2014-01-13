-- Create table
create table GEUSUAPL
(
  CD_APLICACAO VARCHAR2(8) not null,
  CD_USUARIO   NUMBER(6) not null,
  ST_ATIVO     VARCHAR2(1) not null,
  ST_INCLUSAO  VARCHAR2(1) not null,
  ST_ALTERACAO VARCHAR2(1) not null,
  ST_EXCLUSAO  VARCHAR2(1) not null,
  ST_FAVORITO  VARCHAR2(1) ,
  NM_USUINC    VARCHAR2(30) not null,
  DT_USUINC    DATE not null,
  NM_USUALT    VARCHAR2(30),
  DT_USUALT    DATE
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table GEUSUAPL
  add constraint PK_GEUSUAPL primary key (CD_APLICACAO, CD_USUARIO)
  using index 
  tablespace INDICES_TABLESPACE
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
alter table GEUSUAPL
  add constraint FK_GEUSUAPL_GEAPLICA foreign key (CD_APLICACAO)
  references GEAPLICA (CD_APLICACAO);
alter table GEUSUAPL
  add constraint FK_GEUSUAPL_GEUSUARI foreign key (CD_USUARIO)
  references GEUSUARI (CD_USUARIO);
-- Create/Recreate check constraints 
alter table GEUSUAPL
  add constraint AVCON_1227013825_ST_AL_000
  check (ST_ALTERACAO IN ('S', 'N'));
alter table GEUSUAPL
  add constraint AVCON_1227013825_ST_AT_001
  check (ST_ATIVO IN ('S', 'N'));
alter table GEUSUAPL
  add constraint AVCON_1227013825_ST_EX_000
  check (ST_EXCLUSAO IN ('S', 'N'));
alter table GEUSUAPL
  add constraint AVCON_1227013825_ST_FA_000
  check (ST_FAVORITO IN ('S', 'N'));
alter table GEUSUAPL
  add constraint AVCON_1227013825_ST_IN_000
  check (ST_INCLUSAO IN ('S', 'N'));
-- Create/Recreate indexes 
create index FK_GEUSUAPL_GEAPLICA_IX on GEUSUAPL (CD_APLICACAO)
  tablespace INDICES_TABLESPACE
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
create index FK_GEUSUAPL_GEUSUARI on GEUSUAPL (CD_USUARIO)
  tablespace INDICES_TABLESPACE
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


create public synonym geusuapl for geusuapl;

grant all on geusuapl to linepack_role;