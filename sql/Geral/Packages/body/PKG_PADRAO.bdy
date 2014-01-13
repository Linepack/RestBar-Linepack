CREATE OR REPLACE PACKAGE BODY "PKG_PADRAO" is
 procedure PRC_COPIA_PERMISSAO_USUARIO(p_cd_usuario_destino   in   number,
                                       p_cd_usuario_origem    in   number,
                                       p_erro                 out  varchar2,
                                       p_retorno              out  varchar2) IS
   cursor cur_geusuapl is
     select cd_aplicacao,
            st_ativo,
            st_inclusao,
            st_alteracao,
            st_exclusao
       from geusuapl
      where cd_usuario = p_cd_usuario_origem;
   
   cursor cur_geusuapl_nivel2(p_cd_aplicacao  in  varchar2) is
     select nm_bloco,
            st_inclusao,
            st_alteracao,
            st_exclusao
       from geusuapl_nivel2
      where cd_usuario   = p_cd_usuario_origem
        and cd_aplicacao = p_cd_aplicacao;
        
   cursor cur_geusuapl_nivel3(p_cd_aplicacao  in  varchar2,
                              p_nm_bloco      in  varchar2) is
     select nm_item,
            st_inclusao,
            st_alteracao,
            st_obrigatorio,
            st_visivel
       from geusuapl_nivel3
      where cd_usuario   = p_cd_usuario_origem
        and cd_aplicacao = p_cd_aplicacao
        and nm_bloco     = p_nm_bloco;
        
 begin
 
     -- Primeiro deleta o que est� existente (itens)-- 
     begin
      delete 
        from geusuapl_nivel3
       where cd_usuario   = p_cd_usuario_destino;
     exception
       when others then
         p_erro := ('Erro deletando de GEUSUAPL_NIVEL3'||CHR(13)||sqlerrm);
         return;
     end;
     
     -- segundo deleta o que est� existente (blocos)-- 
     begin
      delete 
        from geusuapl_nivel2
       where cd_usuario   = p_cd_usuario_destino;
     exception
       when others then
         p_erro := ('Erro deletando de GEUSUAPL_NIVEL2'||CHR(13)||sqlerrm);
         return;
     end;
     
     -- terceiro deleta o que est� existente (aplicacao)-- 
     begin
      delete 
        from geusuapl
       where cd_usuario   = p_cd_usuario_destino;
     exception
       when others then
         p_erro := ('Erro deletando de GEUSUAPL'||CHR(13)||sqlerrm);
         return;
     end;

 
   -- Carrega as aplica��es do usu�rio destino --
   for reg in cur_geusuapl loop
          
     -- Depois insere a linha --
     begin
       insert into geusuapl(cd_usuario,                 cd_aplicacao,
                            st_ativo,                   st_inclusao,
                            st_alteracao,               st_exclusao,
                            nm_usuinc,                  dt_usuinc)
                     values(p_cd_usuario_destino,       reg.cd_aplicacao,
                            reg.st_ativo,               reg.st_inclusao,
                            reg.st_alteracao,           reg.st_exclusao,
                            user,                       sysdate);
     exception
       when others then
         p_erro:=('Erro inserindo em GEUSUAPL'||chr(13)||sqlerrm);       
         return;
     end;
     
     -- carregas os blocos da aplica��o --
     for reg1 in cur_geusuapl_nivel2(reg.cd_aplicacao) loop
        
        -- insere o registro --
        begin       
          insert into geusuapl_nivel2(cd_usuario,           cd_aplicacao,
                                      nm_bloco,             st_inclusao,
                                      st_alteracao,         st_exclusao,
                                      nm_usuinc,            dt_usuinc)
                               values(p_cd_usuario_destino, reg.cd_aplicacao,
                                      reg1.nm_bloco,        reg1.st_inclusao,
                                      reg1.st_alteracao,    reg1.st_exclusao,
                                      user,                 sysdate);
        exception
          when others then
            p_erro := ('Erro inserindo em GEUSUAPL_NIVEL2'||chr(13)||sqlerrm);       
            return;
        end;
        
        for reg2 in cur_geusuapl_nivel3(reg.cd_aplicacao, reg1.nm_bloco) loop        
          
          -- Insere o registro --
          begin
            insert into geusuapl_nivel3(cd_usuario,           cd_aplicacao,
                                        nm_bloco,             nm_item,
                                        st_inclusao,          st_alteracao,
                                        st_obrigatorio,       st_visivel,
                                        nm_usuinc,            dt_usuinc)
                                 values(p_cd_usuario_destino, reg.cd_aplicacao,
                                        reg1.nm_bloco,        reg2.nm_item,
                                        reg2.st_inclusao,     reg2.st_alteracao,
                                        reg2.st_obrigatorio,  reg2.st_visivel,
                                        user,                 sysdate);
          exception
           when others then
             p_erro := ('Erro inserindo em GEUSUAPL_NIVEL3'||chr(13)||sqlerrm);       
             return;
          end;
            
        end loop; -- for reg2 in cur_geusuapl_nivel3                        
     end loop; --for reg1 in cur_geusuapl_nivel2
   end loop; -- for reg in cur_geusuapl
   
   if p_erro is null then
      p_retorno := 'Permiss�es copiadas com sucesso';
      return;
   end if;   
 end prc_copia_permissao_usuario;
 
 PROCEDURE PRC_GEUSUARI (P_TIPO     IN   VARCHAR2, -- C = CRIAR, L = LOCK , P = PASSWORD
                         P_DS_LOGIN IN   VARCHAR2,
                         P_PASSWORD IN   VARCHAR2,
                         P_LOCK     IN   VARCHAR2, -- L = LOCK, U = UNLOCK  
                         P_RETORNO  OUT  VARCHAR2,
                         P_ERRO     OUT  VARCHAR2) IS

  BEGIN
   if p_tipo = 'C' then
    
     -- Cria o usu�rio --
     begin
      execute immediate 'create user '||p_ds_login||'
                          identified by '||nvl(p_password,'mudar')||'
                            password expire
                             DEFAULT tablespace DADOS_TABLESPACE';
     exception
      when others then
        p_ERRO := ('Erro criando usu�rio'||chr(13)||sqlerrm);  
        return;
     end;

     -- Grant m�nimo -- 
     begin
      execute immediate 'grant connect, resource, create session, dba, linepack_role to '||p_ds_login;
     exception
      when others then
        p_ERRO := ('Erro em grant para o usu�rio'||chr(13)||sqlerrm);  
        return; 
     end;
      
     p_retorno := 'Usu�rio criado com Sucesso';
     return;
     
   elsif p_tipo = 'L' then
      
     -- Lock/unlock o usu�rio --
     if p_lock = 'L' then   
      begin 
       execute immediate 'alter user '||p_ds_login||'
                             account lock';
      exception
        when others then
          p_ERRO := ('Erro fazendo lock do usu�rio'||chr(13)||sqlerrm);
          return;
      end;
     else 
      begin 
       execute immediate 'alter user '||p_ds_login||'
                             account unlock';
      exception
        when others then
          p_ERRO := ('Erro fazendo unlock do usu�rio'||chr(13)||sqlerrm);
          return;
      end;
     end if;
     
     p_retorno := 'Usu�rio alterado com Sucesso';
     return;
   
   else  

     -- Muda password do usu�rio --
     begin
      execute immediate 'alter user '||p_ds_login||' identified by '||p_password;
     exception
      when others then
        p_ERRO := ('Erro alterando password do usu�rio'||chr(13)||sqlerrm);
        return; 
     end;   
     
     p_retorno := 'Password alterado com Sucesso';
     return;
   end if;
  END prc_geusuari;
  
end PKG_PADRAO;
/
