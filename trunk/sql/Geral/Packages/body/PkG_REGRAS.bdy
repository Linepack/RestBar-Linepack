CREATE OR REPLACE package BODY PkG_REGRAS IS

 PROCEDURE PRC_BAIXA_ESTOQUE_VENDA (P_CD_FIL      IN  NUMBER,
                                    P_NR_VENDA    IN  NUMBER,
                                    P_TP_OPERACAO IN  VARCHAR2, -- S = SAÍDA, E = ENTRADA
                                    P_ERRO        OUT VARCHAR2) IS
  cursor c1 is
    select a.cd_dep,
           a.cd_item,
           b.dt_venda,
           a.qt_item,
           a.st_cancelado
      from ftiteven a,
           ftmesven b
     where a.cd_fil   = b.cd_fil
       and a.nr_venda = b.nr_venda
       and b.cd_fil   = p_cd_fil
       and b.nr_venda = p_nr_venda;
   va_erro      varchar2(2000); 
   va_qt_saldo  essaldo.qt_saldo%type;  
 BEGIN  
   --Abre cursor com os itens da venda -- 
   for reg in c1 loop

     -- Verifica o saldo em estoque do produto --
     prc_consulta_essaldo(p_cd_fil, reg.cd_dep, reg.cd_item,reg.qt_item, va_qt_saldo, va_erro);
     if va_erro is not null then
        p_erro := va_erro;
        return;
     end if;   
     
     if va_qt_saldo is not null then
       
       if p_tp_operacao = 'S' then
       
           -- Movimenta saldo em estoque (SAÍDA)-- 
           begin  
             insert into esmovto(cd_fil,              cd_dep,
                                 cd_item,             dt_movto,
                                 tp_movto,            qt_movto)
                          values(p_cd_fil,            reg.cd_dep,
                                 reg.cd_item,         trunc(reg.dt_venda),
                                 'S',                 reg.qt_item);
           exception
             when others then
               P_erro := 'Erro inserindo em ESMOVTO'||chr(13)||sqlerrm;
               return;
           end;    
       
       else
         
         if reg.st_cancelado = 'S' then
            
           -- Movimenta saldo em estoque (ENTRADA)-- 
           begin  
             insert into esmovto(cd_fil,              cd_dep,
                                 cd_item,             dt_movto,
                                 tp_movto,            qt_movto)
                          values(p_cd_fil,            reg.cd_dep,
                                 reg.cd_item,         trunc(sysdate),
                                 'E',                 reg.qt_item);
           exception
             when others then
               P_erro := 'Erro inserindo em ESMOVTO'||chr(13)||sqlerrm;
               return;
           end;    

         end if; -- if reg.st_cancelado = 'S' then
       end if; -- if p_tp_operacao = 'I'                          
     end if;  -- if va_qt_saldo >= reg.qt_item then
   end loop; --for reg in c1 loop
 END PRC_BAIXA_ESTOQUE_VENDA;

 PROCEDURE PRC_CONSULTA_ESSALDO(P_CD_FIL     IN       NUMBER,
                                P_CD_DEP     IN       NUMBER,
                                P_CD_ITEM    IN       NUMBER,
                                P_QT_ITEM    IN       NUMBER,
                                P_QT_SALDO   OUT      NUMBER,
                                P_ERRO       OUT      VARCHAR2) IS
   va_qt_saldo             essaldo.qt_saldo%type;
   va_st_venda_saldo_zero  geparame.st_venda_saldo_zero%type;
 BEGIN
   -- Validações Básicas --
   if p_qt_item = 0 then
      p_erro := 'Quantidade não pode ser Zero';
      return;
   elsif p_qt_item < 0 then
      p_erro := 'Quantidade não pode ser Negativa';
      return;
   end if;
         
   -- Busca saldo mais recente em ESSALDO --
   begin  
    select qt_saldo
      into va_qt_saldo
      from essaldo a
     where cd_fil = p_cd_fil
       and cd_dep = p_cd_dep
       and cd_item = p_cd_item
       and dt_saldo = (select max(dt_saldo)
                         from essaldo b
                        where b.cd_fil = a.cd_fil
                          and b.cd_dep = a.cd_dep
                          and b.cd_item = a.cd_item);
   exception
    when no_data_found then
      -- Verifica se permite saldo inexistente -- 
      begin
        select st_venda_saldo_zero
          into va_st_venda_saldo_zero
          from geparame;
      exception
        when others then
           p_erro := 'Erro consultando GEPARAME'||chr(13)||sqlerrm;
      end;
      
      if va_st_venda_saldo_zero = 'N' then
         p_erro := 'Item não possui saldo em estoque!';
         return;
      else
         p_qt_saldo := null;
         return;
      end if; 
           
    when others then
      p_erro := 'Erro consutlando ESSALDO'||chr(13)||sqlerrm;
   end;
  
  if va_qt_saldo < p_qt_item then
    p_erro := 'Saldo disponível é de apenas '||ltrim(to_char(va_qt_saldo, '999G999G990D0000'));  
    return;
  end if;
  
  p_qt_saldo := va_qt_saldo;
  return;
   
 END PRC_CONSULTA_ESSALDO;
end PKG_REGRAS;
/
