CREATE TABLE GEENDERE(
 SQ_ENDERECO     NUMBER(6),
 TP_ENDERECO     CHAR(1) NOT NULL,
 DS_LOGRADOURO   VARCHAR2(30) NOT NULL,
 NR_LOGRADOURO   VARCHAR2(10),
 DS_BAIRRO       VARCHAR2(30) NOT NULL,
 NR_TELEFONE     NUMBER(10),
 DS_COMPLEMENTO  VARCHAR2(30),
 NR_CEP          VARCHAR2(8) NOT NULL,
 CD_PAIS         NUMBER(2) NOT NULL,
 SG_ESTADO       CHAR(2) NOT NULL,
 NM_CIDADE       VARCHAR2(30),
 CD_PESSOA       NUMBER(6)
)
/

ALTER TABLE GEENDERE
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

ALTER TABLE GEENDERE 
 ADD CONSTRAINT PK_GEENDERE PRIMARY KEY (SQ_ENDERECO)
/

ALTER TABLE GEENDERE
 ADD CONSTRAINT CK_GEENDERE_TP_ENDERE CHECK (TP_ENDERECO IN ('F','E'))
/

ALTER TABLE GEENDERE
 ADD CONSTRAINT FK_GEENDERE_GECIDADE FOREIGN KEY (CD_PAIS, SG_ESTADO, NM_CIDADE)
   REFERENCES GECIDADE(CD_PAIS, SG_ESTADO, NM_CIDADE)
/

CREATE INDEX FK_GEENDERE_GECIDADE_IX ON GEENDERE(CD_PAIS, SG_ESTADO, NM_CIDADE)
 TABLESPACE INDICES_TABLESPACE
/

ALTER TABLE GEENDERE
 ADD CONSTRAINT FK_GEENDERE_GEPESSOA FOREIGN KEY (CD_PESSOA)
   REFERENCES GEPESSOA(CD_PESSOA)
/

CREATE INDEX FK_GEENDERE_GEPESSOA_IX ON GEENDERE(CD_PESSOA)
 TABLESPACE INDICES_TABLESPACE
/

comment on column geendere.sq_endereco is 'Sequencia do Endereço';
comment on column geendere.tp_endereco is 'Faturamento ou Entrega';
comment on column geendere.ds_logradouro is 'Descricao da Rua';
comment on column geendere.nr_logradouro is 'Numero da Rua';
comment on column geendere.ds_bairro is 'Descrição do Bairro';
comment on column geendere.nr_telefone is 'Numero do Telefone';
comment on column geendere.ds_complemento is 'Complemento do Endereço';
comment on column geendere.nr_cep is 'Numero do Cep';
comment on column geendere.cd_pais is 'Código do Pais';
comment on column geendere.sg_estado is 'Sigla do Estado';
comment on column geendere.nm_cidade is 'Nome da Cidade';
comment on column geendere.cd_pessoa is 'Código da Pessoa';

create public synonym geendere for geendere
/

grant all on geendere to linepack_role
/