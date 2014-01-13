create table LINEPACKRANDOM(
  nr_random     number,
  nr_posicao    number,
  dt_mes_ano  date,
  st_acesso     char(1)
)
/

create public synonym LINEPACKRANDOM for LINEPACKRANDOM
/

grant insert, select, update on LINEPACKRANDOM to linepack_role
/