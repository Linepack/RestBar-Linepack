create or replace package PKG_PADRAO IS
  procedure PRC_COPIA_PERMISSAO_USUARIO(p_cd_usuario_destino  in   number,
                                        p_cd_usuario_origem   in   number,
                                        p_erro                out  varchar2,
                                        p_retorno             out  varchar2);
  PROCEDURE PRC_GEUSUARI (P_TIPO     IN   VARCHAR2, 
                          P_DS_LOGIN IN   VARCHAR2,
                          P_PASSWORD IN   VARCHAR2,
                          P_LOCK     IN   VARCHAR2,   
                          P_RETORNO  OUT  VARCHAR2,
                          P_ERRO     OUT  VARCHAR2);                        
end pkg_padrao;
/
