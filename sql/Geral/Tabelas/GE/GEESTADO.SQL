CREATE TABLE GEESTADO(
 SG_ESTADO    CHAR(2),
 NM_ESTADO    VARCHAR2(30) NOT NULL,
 NR_IBGE      NUMBER(2),
 CD_PAIS      NUMBER(2)
)
/

ALTER TABLE GEESTADO
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

ALTER TABLE GEESTADO 
 ADD CONSTRAINT FK_GEESTADO_GEPAIS FOREIGN KEY (CD_PAIS)
  REFERENCES GEPAIS(CD_PAIS)
/

CREATE INDEX FK_GEESTADO_GEPAIS_IX ON GEESTADO(CD_PAIS)
 TABLESPACE INDICES_TABLESPACE
/

ALTER TABLE GEESTADO
 ADD CONSTRAINT PK_GEESTADO PRIMARY KEY (CD_PAIS, SG_ESTADO)
/

comment on column geestado.sg_estado is 'Sigla do Estado';
comment on column geestado.nm_estado is 'Nome do Estado';
comment on column geestado.nr_ibge is 'Numero do IBGE do Estado';
comment on column geestado.cd_pais is 'Código do Pais do Estado';

create public synonym geestado for geestado
/

grant all on geestado to linepack_role
/


