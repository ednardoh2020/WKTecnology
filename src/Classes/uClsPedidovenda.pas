unit uClsPedidovenda;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal, Graphics, Variants, Jpeg,
     Windows, Classes, Controls, Forms;

  type
    TPedidovenda = class
      private
        FNumpedido   : Integer;
        FDataemissao : TDate;
        FCodCliente  : Integer;
        FValorTotal  : Double;
        QryAuxiliar  : TFDQuery;
      public
        //Get
        function GetNumpedido   : Integer;
        function GetDataemissao : TDate;
        function GetCodCliente  : Integer;
        function GetValorTotal  : Double;
        //consultas
        function RetornaNumPedido : string;
        procedure PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa, strValorPesquisa : String);
        procedure AbreTabela(strNomeTabela, strCodigo, strNomepesquisa : String);
        //Set
        procedure SetNumpedido(const Value: Integer);
        procedure SetDataemissao(const Value: TDate);
        procedure SetCodCliente(const Value: Integer);
        procedure SetValorTotal(const Value: Double);
        procedure GravaDados(const Value: string; sEcluirID: string='');
        //Property
        property Numpedido   : Integer read GetNumpedido   write SetNumpedido;
        property Dataemissao : TDate   read GetDataemissao write SetDataemissao;
        property CodCliente  : Integer read GetCodCliente  write SetCodCliente;
        property ValorTotal  : Double  read GetValorTotal  write SetValorTotal;
      published
        constructor Create;
    end;

implementation

Uses uPesquisa;

{ TPedidovenda }

constructor TPedidovenda.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TPedidovenda.GetNumpedido: Integer;
begin
  Result := FNumpedido;
end;

function TPedidovenda.GetDataemissao: TDate;
begin
  Result := FDataemissao;
end;

function TPedidovenda.GetCodCliente: Integer;
begin
   Result := FCodCliente;
end;

function TPedidovenda.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TPedidovenda.SetNumpedido(const Value: Integer);
begin
  FNumpedido := Value;
end;

procedure TPedidovenda.SetDataemissao(const Value: TDate);
begin
  FDataemissao := Value;
end;

procedure TPedidovenda.SetCodCliente(const Value: Integer);
begin
  FCodCliente :=Value;
end;

procedure TPedidovenda.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TPedidovenda.GravaDados(const Value: string; sEcluirID: string='');
begin
try
  if Value = 'Novo' then   //Inserir registro
    begin
      dm.DBConexao.StartTransaction;
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO tb_pedidovenda (DATAEMISSAO, CODCLIENTE, VALOR_TOTAL)    ');
      QryAuxiliar.SQL.Add('                    VALUES (:DATAEMISSAO, :CODCLIENTE, :VALOR_TOTAL) ');
      QryAuxiliar.ParamByName('DATAEMISSAO').AsDate     := GetDataemissao;
      QryAuxiliar.ParamByName('CODCLIENTE').AsInteger   := GetCodCliente;
      QryAuxiliar.ParamByName('VALOR_TOTAL').AsFloat    := GetValorTotal;
      QryAuxiliar.ExecSQL();
      dm.DBConexao.Commit;
    end
   else
     if Value = 'Editar' then  //Editar Registro
       begin
         dm.DBConexao.StartTransaction;
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE tb_pedidovenda    ');
         QryAuxiliar.SQL.Add('SET DATAEMISSAO    =:DATAEMISSAO, ');
         QryAuxiliar.SQL.Add('    CODCLIENTE     =:CODCLIENTE,  ');
         QryAuxiliar.SQL.Add('    VALOR_TOTAL    =:VALOR_TOTAL  ');
         QryAuxiliar.SQL.Add('WHERE NUMPEDIDO    =:NUMPEDIDO    ');
         QryAuxiliar.ParamByName('NUMPEDIDO').AsInteger := GetNumpedido;
         QryAuxiliar.ParamByName('DATAEMISSAO').AsDate  := GetDataemissao;
         QryAuxiliar.ParamByName('VALOR_TOTAL').AsFloat := GetValorTotal;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end
   else
     if Value = 'Excluir' then   //Excluir Registro
       begin
         dm.DBConexao.StartTransaction;
         //primeiro apaga os produtos
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM tb_pedidos_produtos WHERE NUMPEDIDO=:NUMPEDIDO');
         QryAuxiliar.ParamByName('NUMPEDIDO').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();

         //depois apaga o cabe?alho
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM tb_pedidovenda WHERE NUMPEDIDO=:NUMPEDIDO');
         QryAuxiliar.ParamByName('NUMPEDIDO').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end;
  except
    on E: Exception do
      begin
        dm.DBConexao.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Pedido de Venda): '+E.Message);
      end;
  end;
end;

procedure TPedidovenda.PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa,
  strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' LIKE '+ quotedstr('%'+ trim(strValorPesquisa)+'%'));
  QryAuxiliar.Open();
  FrmPesquisa.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TPedidovenda.AbreTabela(strNomeTabela, strCodigo,
  strNomepesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + strNomeTabela);
  QryAuxiliar.SQL.Add('Order by '+strCodigo);
  QryAuxiliar.Open;
  FrmPesquisa.dsPesquisa.DataSet := QryAuxiliar;
end;

function TPedidovenda.RetornaNumPedido: string;
begin
  Result :='';
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT MAX(NUMPEDIDO) AS NUMPEDIDO ');
  QryAuxiliar.SQL.Add('FROM tb_pedidovenda');
  QryAuxiliar.Open;
  Result := QryAuxiliar.FieldByName('NUMPEDIDO').AsString;
end;


end.
