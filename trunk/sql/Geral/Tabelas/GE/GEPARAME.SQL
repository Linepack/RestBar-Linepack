-- Create table
create table GEPARAME
(
  NM_TITULO_JANELA           VARCHAR2(200) not null,
  NM_USUINC                  VARCHAR2(30) not null,
  DT_USUINC                  DATE not null,
  NM_CAMINHO_LOGO_MENU       VARCHAR2(1000),
  NM_CAMINHO_LOGO_ITEM_MENU  VARCHAR2(1000),
  NM_CAMINHO_LOGO_FAVORITO   VARCHAR2(1000),
  NM_CAMINHO_LOGO_ULT_ACESSO VARCHAR2(1000),
  NM_CAMINHO_LOGO_SISTEMA    VARCHAR2(1000),
  NM_USUALT                  VARCHAR2(30),
  DT_USUALT                  DATE,
  NM_CAMINHO_LOGO_RELATORIO  VARCHAR2(1000),
  NM_CAMINHO_FORMS           VARCHAR2(2000)
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
-- Add comments to the columns 
comment on column GEPARAME.NM_TITULO_JANELA
  is 'Título da janela principal';
comment on column GEPARAME.NM_USUINC
  is 'Nome do usuário de inclusão';
comment on column GEPARAME.DT_USUINC
  is 'Data de inclusão';

create public synonym geparame for geparame;

grant all on geparame to linepack_role;