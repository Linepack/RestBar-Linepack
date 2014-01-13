CREATE TABLE GEPAIS(
 CD_PAIS    NUMBER(2),
 NM_PAIS    VARCHAR2(20) NOT NULL
)
/

ALTER TABLE GEPAIS
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

ALTER TABLE GEPAIS 
 ADD CONSTRAINT PK_GEPAIS PRIMARY KEY (CD_PAIS)
/

comment on column gepais.cd_pais is 'Código do País';
comment on column gepais.nm_pais is 'Nome do País';

create public synonym gepais for gepais
/

grant all on gepais to linepack_role
/