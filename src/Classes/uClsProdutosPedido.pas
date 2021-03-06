unit uClsProdutosPedido;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal, Graphics, Variants, Jpeg,
     Windows, Classes, Controls, Forms;

  type
    TProdutosPedido = class
      private
        FID            : Integer;
        FNumPedido     : Integer;
        FCodProduto    : string;
        FQuantidade    : Double;
        FValorUnitario : Double;
        FValorTotal    : Double;
        QryAuxiliar    : TFDQuery;
      public
        //Get
        function GetID            : Integer;
        function GetNumPedido     : Integer;
        function GetCodProduto    : string;
        function GetQuantidade    : Double;
        function GetValorUnitario : Double;
        function GetValorTotal    : Double;
        //consultas
        procedure PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa, strValorPesquisa : String);
        procedure AbreTabela(strNomeTabela, strCodigo, strNomepesquisa : String);
        //Set
        procedure SetID(const Value: Integer);
        procedure SetNumPedido(const Value: Integer);
        procedure SetCodProduto(const Value: string);
        procedure SetQuantidade(const Value: Double);
        procedure SetValorUnitario(const Value: Double);
        procedure SetValorTotal(const Value: Double);
        procedure GravaDados(const Value: string; sEcluirID: string='');
        //Property
        property ID            : Integer read GetID            write SetID;
        property NumPedido     : Integer read GetNumPedido     write SetNumPedido;
        property CodProduto    : string  read GetCodProduto    write SetCodProduto;
        property Quantidade    : Double  read GetQuantidade    write SetQuantidade;
        property ValorUnitario : Double  read GetValorUnitario write SetValorUnitario;
        property ValorTotal    : Double  read GetValorTotal    write SetValorTotal;
      published
        constructor Create;
    end;

implementation

Uses uPesquisa;

{ TProdutosPedido }

constructor TProdutosPedido.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TProdutosPedido.GetID: Integer;
begin
  Result := FID;
end;

function TProdutosPedido.GetCodProduto: string;
begin
  Result := FCodProduto;
end;

function TProdutosPedido.GetNumPedido: Integer;
begin
  Result := FNumPedido;
end;

function TProdutosPedido.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

function TProdutosPedido.GetValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

function TProdutosPedido.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TProdutosPedido.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TProdutosPedido.SetNumPedido(const Value: Integer);
begin
  FNumPedido := Value;
end;

procedure TProdutosPedido.SetCodProduto(const Value: string);
begin
  FCodProduto := Value;
end;

procedure TProdutosPedido.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TProdutosPedido.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

procedure TProdutosPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TProdutosPedido.GravaDados(const Value: string; sEcluirID: string='');
begin
try
  if Value = 'Novo' then   //Inserir registro
    begin
      dm.DBConexao.StartTransaction;
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO tb_pedidos_produtos (NUMPEDIDO, CODPRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) ');
      QryAuxiliar.SQL.Add('                    VALUES (:NUMPEDIDO, :CODPRODUTO, :QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL) ');
      QryAuxiliar.ParamByName('NUMPEDIDO').AsInteger    := GetNumPedido;
      QryAuxiliar.ParamByName('CODPRODUTO').AsString    := GetCodProduto;
      QryAuxiliar.ParamByName('QUANTIDADE').AsFloat     := GetQuantidade;
      QryAuxiliar.ParamByName('VALOR_UNITARIO').AsFloat := GetValorUnitario;
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
         QryAuxiliar.SQL.Add('UPDATE tb_pedidos_produtos              ');
         QryAuxiliar.SQL.Add('SET CODPRODUTO     =:CODPRODUTO,        ');
         QryAuxiliar.SQL.Add('    QUANTIDADE     =:QUANTIDADE,        ');
         QryAuxiliar.SQL.Add('    VALOR_UNITARIO =:VALOR_UNITARIO     ');
         QryAuxiliar.SQL.Add('    VALOR_TOTAL    =:VALOR_TOTAL        ');
         QryAuxiliar.SQL.Add('WHERE NUMPEDIDO =:NUMPEDIDO AND CODPRODUTO =:CODPRODUTO ');
         QryAuxiliar.ParamByName('NUMPEDIDO').AsInteger    := GetNumPedido;
         QryAuxiliar.ParamByName('CODPRODUTO').AsString    := GetCodProduto;
         QryAuxiliar.ParamByName('QUANTIDADE').AsFloat     := GetQuantidade;
         QryAuxiliar.ParamByName('VALOR_UNITARIO').AsFloat := GetValorUnitario;
         QryAuxiliar.ParamByName('VALOR_TOTAL').AsFloat    := GetValorTotal;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end
   else
     if Value = 'Excluir' then   //Excluir Registro
       begin
         dm.DBConexao.StartTransaction;
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM tb_pedidos_produtos WHERE NUMPEDIDO=:NUMPEDIDO');
         QryAuxiliar.ParamByName('NUMPEDIDO').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end;
  except
    on E: Exception do
      begin
        dm.DBConexao.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Produtos do Pedido): '+E.Message);
      end;
  end;
end;

procedure TProdutosPedido.PesquisaTabela(strNomeTabela, strCodigo,
  strNomepesquisa, strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' LIKE '+ quotedstr('%'+ trim(strValorPesquisa)+'%'));
  QryAuxiliar.Open();
  FrmPesquisa.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TProdutosPedido.AbreTabela(strNomeTabela, strCodigo,
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

end.

