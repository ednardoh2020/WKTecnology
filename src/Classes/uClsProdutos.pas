unit uClsProdutos;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal, Graphics, Variants, Jpeg,
     Windows, Classes, Controls, Forms;

  type
    TProdutos = class
      private
        FCodigo     : Integer;
        FDescricao  : string;
        FPrecovenda : Double;
        QryAuxiliar : TFDQuery;
      public
        //Get
        function GetCodigo     : Integer;
        function GetDescricao  : string;
        function GetPrecovenda : Double;
        //consultas
        procedure PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa, strValorPesquisa : String);
        procedure PesquisaProduto(strNomeTabela, strCodigo, strNomepesquisa,strValorPesquisa: String);
        procedure AbreTabela(strNomeTabela, strCodigo, strNomepesquisa : String);
        //Set
        procedure SetCodigo(const Value: Integer);
        procedure SetDescricao(const Value: string);
        procedure SetPrecovenda(const Value: Double);
        procedure GravaDados(const Value: string; sEcluirID: string='');
        //property
        property Codigo    : Integer read GetCodigo     write SetCodigo;
        property Descricao : string  read GetDescricao  write SetDescricao;
        property Precovenda: Double  read GetPrecovenda write SetPrecovenda;
      published
        constructor Create;

    end;

implementation

Uses uPesquisa;

{ TProdutos }

constructor TProdutos.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TProdutos.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProdutos.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TProdutos.GetPrecovenda: Double;
begin
  Result := FPrecovenda;
end;

procedure TProdutos.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutos.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutos.SetPrecovenda(const Value: Double);
begin
  FPrecovenda := Value;
end;

procedure TProdutos.GravaDados(const Value: string; sEcluirID: string='');
begin
try
  if Value = 'Novo' then   //Inserir registro
    begin
      dm.DBConexao.StartTransaction;
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO tb_produtos (CODIGO, DESCRICAO, PRECO_VENDA) ');
      QryAuxiliar.SQL.Add('       VALUES (:CODIGO, :DESCRICAO, :PRECO_VENDA)        ');
      QryAuxiliar.ParamByName('CODIGO').AsInteger    := GetCodigo;
      QryAuxiliar.ParamByName('DESCICAO').AsString   := GetDescricao;
      QryAuxiliar.ParamByName('PRECO_VENDA').AsFloat := GetPrecovenda;
      QryAuxiliar.ExecSQL();
      dm.DBConexao.Commit;
    end
   else
     if Value = 'Editar' then  //Editar Registro
       begin
         dm.DBConexao.StartTransaction;
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE tb_produtos             ');
         QryAuxiliar.SQL.Add('SET DESCRICAO    =:DESCRICAO,  ');
         QryAuxiliar.SQL.Add('    PRECO_VENDA  =:PRECO_VENDA ');
         QryAuxiliar.SQL.Add('WHERE CODIGO     =:CODIGO      ');
         QryAuxiliar.ParamByName('CODIGO').AsInteger    := GetCodigo;
         QryAuxiliar.ParamByName('DESCRICAO').AsString  := GetDescricao;
         QryAuxiliar.ParamByName('PRECO_VENDA').AsFloat := GetPrecovenda;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end
   else
     if Value = 'Excluir' then   //Excluir Registro
       begin
         dm.DBConexao.StartTransaction;
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM tb_produtos WHERE CODIGO=:CODIGO');
         QryAuxiliar.ParamByName('CODIGO').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end;
  except
    on E: Exception do
      begin
        dm.DBConexao.Rollback;  //desfaz a transação
        ShowMessage('Ocorreu um erro Inesperado. (Produtos): '+E.Message);
      end;
  end;
end;


procedure TProdutos.PesquisaProduto(strNomeTabela, strCodigo, strNomepesquisa,
  strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT CODIGO as Codigo, DESCRICAO as Descricao, PRECO_VENDA as Preco ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' = '+ quotedstr(trim(strValorPesquisa)));
  QryAuxiliar.Open();
  DM.gblValCodigo  := QryAuxiliar.FieldByName('Codigo').AsString;
  DM.gblValNome    := QryAuxiliar.FieldByName('Descricao').AsString;
  DM.gblValPrcProd := QryAuxiliar.FieldByName('Preco').AsString;
end;

procedure TProdutos.PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa,
  strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT CODIGO as Codigo, DESCRICAO as Descricao, PRECO_VENDA as Preco ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' LIKE '+ quotedstr('%'+ trim(strValorPesquisa)+'%'));
  QryAuxiliar.Open();
  FrmPesquisa.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TProdutos.AbreTabela(strNomeTabela, strCodigo,
  strNomepesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT CODIGO as Codigo, DESCRICAO as Descricao, PRECO_VENDA as Preco ');
  QryAuxiliar.SQL.Add('FROM ' + strNomeTabela);
  QryAuxiliar.SQL.Add('Order by '+strCodigo);
  QryAuxiliar.Open;
  FrmPesquisa.dsPesquisa.DataSet := QryAuxiliar;
end;

end.
