alter table geusuapl_nivel2
  add constraint FK_NIVEL2_GEBLKAPL_NM foreign key (cd_aplicacao, nm_bloco)
        references geblkapl(cd_aplicacao, nm_bloco)
/

create index FK_NIVEL2_GEBLKAPL_NM  on geusuapl_nivel2(cd_aplicacao, nm_bloco)
 tablespace indices_tablespace
/