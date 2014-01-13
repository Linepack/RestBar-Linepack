create table geiteage(
   sq_agenda       number(6),
   sq_item_agenda  number(5),
   cd_pessoa_func  number(6) not null,
   dt_contato      date not null,
   tp_contato      char(1) not null,
   ds_contato	   long not null,
   dt_prox_contato date not null,
   dt_usuinc	  date not null,
   nm_usuinc	  varchar2(30) not null,
   dt_usualt	  date,
   nm_usualt	  varchar2(30));

alter table geiteage
  add constraint fk_geiteage_geagenda foreign key (sq_agenda)
      references geagenda (sq_agenda);

create index fk_geiteage_geagenda_ix on geiteage(sq_agenda)
  tablespace indices_tablespace;

alter table geiteage
  add constraint pk_geiteage primary key (sq_agenda, sq_item_agenda);

alter table geiteage
  add constraint fk_geiteage_gepessoa foreign key (cd_pessoa_func)
      references gepessoa (cd_pessoa);

create index fk_geiteage_gepessoa_ix on geiteage(cd_pessoa_func)
  tablespace indices_tablespace;

alter table geiteage 
  add constraint ck_geiteage_tp_contato check (tp_contato in ('C','E','R','P'));

/*
 C = CONTATO
 E = EVENTO
 R = RECEBIMENTO
 P = PAGAMENTO
*/

create public synonym geiteage for geiteage;

grant all on geiteage to linepack_role;

