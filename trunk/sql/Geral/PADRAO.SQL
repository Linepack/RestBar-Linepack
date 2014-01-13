create tablespace DADOS_TABLESPACE datafile 'C:\Users\LEANDRO\Desktop\Outros\Particulares\LINEPACK\Tablespaces\DADOS_TABLESPACE.DBF'
size                                  10M
autoextend off 
extent management local uniform size  64K;

create tablespace INDICES_TABLESPACE datafile 'C:\Users\LEANDRO\Desktop\Outros\Particulares\LINEPACK\Tablespaces\INDICES_TABLESPACE.DBF'
size                                  10M
autoextend off 
extent management local uniform size  64K;
	
create user linepack
  identified by linepack 
  default tablespace dados_tablespace
  temporary tablespace temp;

create role linepack_role;

grant dba to linepack;
grant linepack_role to linepack;

--Conectar como SYSDBA
conn sys /as sysdba


grant select on dba_col_comments to linepack_role;
grant SELECT ON V_$SESSION to linepack_role;
grant alter tablespace to linepack_role;
grant create user to linepack_role;
grant alter user to linepack_role;
grant create user to linepack;
grant alter user to linepack;

Incluir registro nas tabelas, GEFILIAL, GEPAIS, GECIDADE, GEESTADO, GEUSUARI, 
GEUSUAPL, GEUSUAPL_NIVEL2, GEUSUAPL_NIVEL3, GEAPLICA,GEBLKAPL, GEITEBLK, 
GEPARAME


-- Não esquecer de zerar as sequencias, criar os sinonimos publicos e dar grant de tudo para linepack_role.
