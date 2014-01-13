
/*NÃO ESQUECER DE PERMITIR A APLICAÇÃO PARA O USUÁRIO*/

insert into geaplica(cd_aplicacao,
                    nm_aplicacao,
                    st_bloqueado,
                    st_inclusao,
                    st_alteracao,
                    st_exclusao,
                    ds_help,
                    nm_usuinc,
                    dt_usuinc,
                    nm_usualt,
                    dt_usualt,
                    st_aplicacao,
                    cd_modulo) 
             values('FTF00004',
                    'Resumo de Vendas', 
                    'N', 
                    'S',
                    'S',
                    'S',
                    null,
                    user,
                    sysdate,
                    null, 
                    null,
                    'A',
                    'FT');
                    
insert into geblkapl(cd_aplicacao,
                    nm_bloco,
                    ds_bloco,
                    st_inclusao,
                    st_alteracao,
                    st_exclusao,
                    nm_usuinc,
                    dt_usuinc,
                    nm_usualt,
                    dt_usualt)
             values('FTF00004', 
                    'BLK01',
                    'MESTRE DA VENDA',
                    'N',
                    'S',
                    'N',
                    USER,
                    SYSDATE,
                    NULL,
                    NULL);
                    
insert into geiteblk values
                    ('FTF00004','BLK01',
                    'CD_FIL','CÓDIGO DA FILIAL',
                    'N','N',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);

insert into geiteblk values
                    ('FTF00004','BLK01',
                    'VA_NM_FANTASIA_FIL','NOME FANTASIA DA FILIAL',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                                      
                    
insert into geiteblk values
                    ('FTF00004','BLK01',
                    'DT_VENDA','DATA DA VENDA',
                    'N','N',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                                 
insert into geiteblk values
                    ('FTF00004','BLK01',
                    'CD_PESSOA_CLIENTE','CÓDIGO DO CLIENTE',
                    'N','N',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                            

insert into geiteblk values
                    ('FTF00004','BLK01',
                    'VA_NM_FANTASIA_CLI','NOME FANTASIA DO CLIENTE',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);
                    
insert into geiteblk values
                    ('FTF00004','BLK01',
                    'ST_VENDA','SITUAÇÃO DA VENDAS (ABERTO, PAGO OU CANCELADO',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);
                    
