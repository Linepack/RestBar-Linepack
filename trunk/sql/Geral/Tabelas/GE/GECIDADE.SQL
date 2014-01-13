CREATE TABLE GECIDADE(
 NM_CIDADE    VARCHAR2(30),
 NR_IBGE      NUMBER(7),
 SG_ESTADO    CHAR(2) NOT NULL,
 CD_PAIS      NUMBER(2) NOT NULL
)
/


ALTER TABLE GECIDADE
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/


ALTER TABLE GECIDADE 
 ADD CONSTRAINT FK_GEESTADO_GECIDADE FOREIGN KEY (SG_ESTADO, CD_PAIS)
  REFERENCES GEESTADO(SG_ESTADO, CD_PAIS)
/

CREATE INDEX FK_GEESTADO_GECIDADE_IX ON GECIDADE(SG_ESTADO, CD_PAIS)
 TABLESPACE INDICES_TABLESPACE
/

ALTER TABLE GECIDADE
 ADD CONSTRAINT PK_GECIDADE PRIMARY KEY (NM_CIDADE, SG_ESTADO, CD_PAIS)
/

comment on column GECIDADE.NM_CIDADE IS 'Nome da Cidade';
comment on column GECIDADE.Nr_ibge is 'Numero do IBGE da Cidade';
comment on column gecidade.sg_estado is 'Sigla do Estado da Cidade';
Comment on column gecidade.cd_pais is 'Código do Pais';

create public synonym gecidade for gecidade
/

grant all on gecidade to linepack_role
/