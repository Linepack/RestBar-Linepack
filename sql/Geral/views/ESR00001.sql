create or replace view ESR00001 AS
select a.cd_item,
       b.ds_item,
       b.cd_unimed,
       a.dt_saldo,
       a.qt_saldo,
       b.vl_item
  from essaldo a,
       esitemes b
 where a.cd_item = b.cd_item
   and qt_saldo > 0 
   and dt_saldo = (select max(a1.dt_saldo)
                     from essaldo a1
                    where a1.cd_fil = a.cd_fil
                      and a1.cd_dep = a.cd_dep
                      and a1.cd_item = a.cd_item)

