create table gepagcon(
  cd_condicao   number(4),
  nr_parc       number(3),
  nr_dias       number(3) not null, 
  pc_composicao number(5,2) not null,
  nm_usuinc     varchar2(30) not null,
  dt_usuinc     date not null,
  nm_usualt     varchar2(30),
  dt_usualt     date   
)
/

alter table gepagcon
 add (constraint FK_GEPAGCON_GECONPAG foreign key (cd_condicao) references geconpag(cd_condicao))
 add (constraInt pk_GEPAGCON primary key (cd_condicao, nr_parc))
/

create index FK_GEPAGCON_GECONPAG_ix on gepagcon(cd_condicao)
  tablespace indices_tablespace
/

create public synonym gepagcon for gepagcon
/

grant all on gepagcon to linepack_role
/