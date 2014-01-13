alter table geusuapl_nivel3
 rename column st_exclusao to st_obrigatorio
/

alter table geusuapl_nivel3
 add constraint CK_NIVEL3_ST_OBRIGATORIO check (st_obrigatorio in ('S','N'))
/

update geusuapl_nivel3
   set st_obrigatorio = 'S'
/

commit
/
