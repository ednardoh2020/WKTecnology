unit uClsClientes;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
     FireDAC.Comp.Client, UDMPrincipal, Graphics, Variants, Jpeg,
     Windows, Classes, Controls, Forms, DBClient;

  type
    TClientes = class
      private
        FCodigo     : Integer;
        FNome       : string;
        FCidade     : string;
        FUF         : string;
        QryAuxiliar : TFDQuery;
      public
        //Get
        function GetCodigo : Integer;
        function GetNome   : string;
        function GetCidade : string;
        function GetUF     : string;
        //consultas
        procedure PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa, strValorPesquisa : String);
        procedure PesquisaCliente(strNomeTabela, strCodigo, strNomepesquisa,strValorPesquisa: String);
        procedure AbreTabela(strNomeTabela, strCodigo, strNomepesquisa : String);
        //Set
        procedure SetCodigo(const Value: Integer);
        procedure SetNome(const Value: string);
        procedure SetCidade(const Value: string);
        procedure SetUF(const Value: string);
        procedure GravaDados(const Value: string; sEcluirID: string='');
        //property
        property Codigo: Integer read GetCodigo write SetCodigo;
        property Nome  : string  read GetNome   write SetNome;
        property Cidade: string  read GetCidade write SetCidade;
        property UF    : string  read GetUF     write SetUF;
      published
        constructor Create;

    end;


implementation

Uses uPesquisa;

{ Clientes }

constructor TClientes.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := dm.DBConexao;
end;

function TClientes.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TClientes.GetNome: string;
begin
  Result := FNome;
end;

function TClientes.GetCidade: string;
begin
  Result := FCidade;
end;

function TClientes.GetUF: string;
begin
  Result := FUF;
end;

procedure TClientes.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TClientes.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TClientes.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TClientes.SetUF(const Value: string);
begin
  FUF := Value;
end;

procedure TClientes.GravaDados(const Value: string; sEcluirID: string='');
begin
try
  if Value = 'Novo' then   //Inserir registro
    begin
      dm.DBConexao.StartTransaction;
      QryAuxiliar.Close;
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('INSERT INTO tb_clientes (NOME, CIDADE, UF) ');
      QryAuxiliar.SQL.Add('       VALUES (:NOME, :CIDADE, :UF)        ');
      QryAuxiliar.ParamByName('NOME').AsString   := GetNome;
      QryAuxiliar.ParamByName('CIDADE').AsString := GetCidade;
      QryAuxiliar.ParamByName('UF').AsString     := GetUF;
      QryAuxiliar.ExecSQL();
      dm.DBConexao.Commit;
    end
   else
     if Value = 'Editar' then  //Editar Registro
       begin
         dm.DBConexao.StartTransaction;
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('UPDATE tb_clientes    ');
         QryAuxiliar.SQL.Add('SET NOME    =:NOME,   ');
         QryAuxiliar.SQL.Add('    CIDADE  =:CIDADE, ');
         QryAuxiliar.SQL.Add('    UF      =:UF      ');
         QryAuxiliar.SQL.Add('WHERE CODIGO=:CODIGO  ');
         QryAuxiliar.ParamByName('CODIGO').AsInteger := GetCodigo;
         QryAuxiliar.ParamByName('NOME').AsString    := GetNome;
         QryAuxiliar.ParamByName('CIDADE').AsString  := GetCidade;
         QryAuxiliar.ParamByName('UF').AsString      := GetUF;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end
   else
     if Value = 'Excluir' then   //Excluir Registro
       begin
         dm.DBConexao.StartTransaction;
         QryAuxiliar.Close;
         QryAuxiliar.SQL.Clear;
         QryAuxiliar.SQL.Add('DELETE FROM tb_clientes WHERE CODIGO=:CODIGO');
         QryAuxiliar.ParamByName('CODIGO').AsString := sEcluirID;
         QryAuxiliar.ExecSQL();
         dm.DBConexao.Commit;
       end;
  except
    on E: Exception do
      begin
        dm.DBConexao.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Clientes): '+E.Message);
      end;
  end;
end;

procedure TClientes.PesquisaCliente(strNomeTabela, strCodigo, strNomepesquisa,
  strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT CODIGO as Codigo, NOME as Nome ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' = '+ quotedstr(trim(strValorPesquisa)));
  QryAuxiliar.Open();
  DM.gblValCodigo := QryAuxiliar.FieldByName('Codigo').AsString;
  DM.gblValNome   := QryAuxiliar.FieldByName('Nome').AsString;
end;

procedure TClientes.PesquisaTabela(strNomeTabela, strCodigo, strNomepesquisa,
  strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT CODIGO as Codigo, NOME as Nome ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' LIKE '+ quotedstr('%'+ trim(strValorPesquisa)+'%'));
  QryAuxiliar.Open();
  FrmPesquisa.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TClientes.AbreTabela(strNomeTabela, strCodigo,
  strNomepesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT CODIGO as Codigo, NOME as Nome ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by '+strCodigo);
  QryAuxiliar.Open;
  FrmPesquisa.dsPesquisa.DataSet := QryAuxiliar;
end;

end.
