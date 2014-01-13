alter table geparame
 add(cd_tp_pessoa_cliente  number(4))
 add(cd_tp_pessoa_vendedor number(4))
/

alter table geparame
 add (cd_condicao_padrao number(4))
/

alter table geparame
 add (constraint FK_GEPARAME_GETIPOPE_CLI foreign key (cd_tp_pessoa_cliente) references getipope(cd_tp_pessoa))
 add (constraint FK_GEPARAME_GETIPOPE_VEN foreign key (cd_tp_pessoa_vendedor) references getipope(cd_tp_pessoa))
 add (constraint FK_GEPARAME_GECONPAG foreign key (cd_condicao_padrao) references geconpag(cd_condicao))
/

create index FK_GEPARAME_GETIPOPE_CLI_ix on geparame(cd_tp_pessoa_cliente)
 tablespace indices_tablespace
/
 
create index FK_GEPARAME_GETIPOPE_VEN_ix on geparame(cd_tp_pessoa_vendedor)
 tablespace indices_tablespace
/

create index FK_GEPARAME_GECONPAG_ix on geparame(cd_condicao_padrao)
 tablespace indices_tablespace
/