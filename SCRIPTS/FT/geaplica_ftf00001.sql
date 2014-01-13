
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
             values('FTF00001',
                    'Venda nominal', 
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
             values('FTF00001', 
                    'BLK01',
                    'MESTRE DA VENDA',
                    'S',
                    'S',
                    'S',
                    USER,
                    SYSDATE,
                    NULL,
                    NULL);
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'CD_FIL','CÓDIGO DA FILIAL',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);

insert into geiteblk values
                    ('FTF00001','BLK01',
                    'VA_NM_FANTASIA_FIL','NOME FANTASIA DA FILIAL',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'NR_VENDA','NÚMERO DA VENDA',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'DT_VENDA','DATA DA VENDA',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                                 
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'CD_PESSOA_CLIENTE','CÓDIGO DO CLIENTE',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                            

insert into geiteblk values
                    ('FTF00001','BLK01',
                    'VA_NM_FANTASIA_CLI','NOME FANTASIA DO CLIENTE',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'CD_PESSOA_VENDEDOR','CÓDIGO DO VENDEDOR',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);    
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'VA_NM_FANTASIA_VEN','NOME FANTASIA DO VENDEDOR',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                                    

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
             values('FTF00001', 
                    'BLK02',
                    'ITEM DA VENDA',
                    'S',
                    'S',
                    'S',
                    USER,
                    SYSDATE,
                    NULL,
                    NULL);
                    
                   
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'SQ_ITEM','SEQUENCIA DO ITEM NA VENDA',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                     
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'CD_ITEM','CÓDIGO DO ITEM',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                         
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VA_DS_ITEM','DESCRIÇÃO DO ITEM',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);  
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'CD_UNIMED','CÓDIGO DA UNIDADE DE MEDIDA',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                                                                
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'QT_ITEM','QUANTIDADE DE VENDA DO ITEM',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                         
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VL_ITEM','VALOR UNITÁRIO DO ITEM',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                         
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VA_VL_TOTAL','Quantidade do item vezes o valor unitário',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);

insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VA_VL_TOTAL_GERAL','SOMA DO VALOR FINAL DE CADA ITEM',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                                                                                  
