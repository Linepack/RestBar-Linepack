alter table geusuapl_nivel3
  add constraint FK_NIVEL3_GEITEAPL_NM foreign key (cd_aplicacao, nm_bloco, nm_item)
        references geiteblk(cd_aplicacao, nm_bloco, nm_item)
/

create index FK_NIVEL2_GEITEBLK_NM  on geusuapl_nivel3(cd_aplicacao, nm_bloco, nm_item)
 tablespace indices_tablespace
/