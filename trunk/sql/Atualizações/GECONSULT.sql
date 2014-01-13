create table GECONSUL(
  sq_consulta           number(8),
  cd_pessoa_Medico      number(6) not null,
  cd_pessoa_paciente    number(6) not null,
  ds_identificacao      varchar2(2000),
  ds_queixa_principal   varchar2(2000),
  ds_historia_doenca_atual     varchar2(2000),
  ds_historia_doenca_progressa varchar2(2000),
  ds_historia_familiar         varchar2(2000),
  ds_historia_farmacologica    varchar2(2000),
  ds_exame_estado_mental       varchar2(2000),
  ds_hipotese_diagnostica      varchar2(2000),
  ds_conduta                   varchar2(2000),
  ds_exame_subjetivo           varchar2(2000),
  ds_exame_objetivo            varchar2(2000),
  ds_diagnostico               varchar2(2000)
);

alter table geconsul
  add (nm_usuinc varchar2(30) not null)
  add (dt_usuinc date not null)
  add (nm_usualt varchar2(30))
  add (dt_usualt date);
  

alter table geconsul
  add constraint pk_geconsul primary key (sq_consulta);
  
alter table geconsul
  add constraint fk_geconsul_gepessoa_medico foreign key(cd_pessoa_medico)
      references gepessoa(cd_pessoa);

create index fk_geconsul_gepessoa_medico_ix on geconsul(cd_pessoa_medico)
 tablespace indices_tablespace;
      
alter table geconsul
  add constraint fk_geconsul_gepessoa_paciente foreign key(cd_pessoa_paciente)
      references gepessoa(cd_pessoa);
      
create index fk_geconsul_gepessoa_pac_ix on geconsul(cd_pessoa_paciente)
 tablespace indices_tablespace;
 
create public synonym geconsul for geconsul;

grant all on geconsul to linepack_role;
