unit uRel_MovimetosDiario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, RLReport;

type
  TfrmRel_Vendas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btn_gerar: TButton;
    Button2: TButton;
    edt_DtINI: TMaskEdit;
    edt_DtFIN: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Qry_RelVendas: TFDQuery;
    Qry_RelVendasCD_MOVVENDAS: TStringField;
    Qry_RelVendasCD_PRODUTO: TStringField;
    Qry_RelVendasDESCRICAO_PROD: TStringField;
    Qry_RelVendasDT_MOVVENDAS: TDateField;
    Qry_RelVendasCD_TANQUE: TStringField;
    Qry_RelVendasTIPO_COMBUSTIVEL: TStringField;
    Qry_RelVendasCD_BOMBA: TStringField;
    Qry_RelVendasDS_BOMBA: TStringField;
    Qry_RelVendasCD_OPERADOR: TStringField;
    Qry_RelVendasDS_OPERADOR: TStringField;
    Qry_RelVendasCD_CAIXA: TStringField;
    Qry_RelVendasDS_CAIXA: TStringField;
    Qry_RelVendasCD_FPGTO: TStringField;
    Qry_RelVendasDS_FPGTO: TStringField;
    Qry_RelVendasDS_HISTORICO: TStringField;
    Qry_RelVendasVALOR_VENDA: TBCDField;
    Qry_RelVendasDESCONTO: TBCDField;
    Qry_RelVendasTROCO: TBCDField;
    Qry_RelVendasQTD_PROD: TBCDField;
    Qry_RelVendasPRC_PROD: TBCDField;
    Qry_RelVendasVALOR_IMPOSTO: TBCDField;
    RLP_Vendas: TRLReport;
    RLBand1: TRLBand;
    ds_Relvendas: TDataSource;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLDBText3: TRLDBText;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDraw1: TRLDraw;
    RLBand4: TRLBand;
    RLDraw2: TRLDraw;
    RLDBResult2: TRLDBResult;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLLabel13: TRLLabel;
    RLDBText10: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel14: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel15: TRLLabel;
    Qry_Empresa: TFDQuery;
    Qry_EmpresaCNPJ: TStringField;
    Qry_EmpresaRAZAO_SOCIAL: TStringField;
    Qry_EmpresaNOME_FANTASIA: TStringField;
    Qry_EmpresaENDERECO: TStringField;
    Qry_EmpresaCEP: TStringField;
    Qry_EmpresaTELEFONE: TStringField;
    Qry_EmpresaIE: TStringField;
    Qry_EmpresaLOGOMARCA: TBlobField;
    ds_empresa: TDataSource;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBImage1: TRLDBImage;
    RLDBText14: TRLDBText;
    procedure btn_gerarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_DtINIKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DtFINKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel_Vendas: TfrmRel_Vendas;

implementation

Uses UDMPrincipal;

{$R *.dfm}

procedure TfrmRel_Vendas.btn_gerarClick(Sender: TObject);
begin
  Qry_RelVendas.Close;
  Qry_RelVendas.SQL.Clear;
  Qry_RelVendas.SQL.Add('select mv.cd_movvendas,  '+
                        '          mv.cd_produto, '+
                        '          pr.ds_reduzido_produto as descricao_prod, '+
                        '          mv.dt_movvendas, '+
                        '          mv.cd_tanque,  '+
                        '          ta.tp_combustivel as tipo_combustivel, '+
                        '          mv.cd_bomba, '+
                        '          bo.ds_bomba,  '+
                        '          mv.cd_operador, '+
                        '          op.ds_operador, '+
                        '          mv.cd_caixa, '+
                        '          cx.ds_caixa, '+
                        '          mv.cd_fpgto, '+
                        '          pg.ds_fpgto, '+
                        '          mv.ds_historico, '+
                        '          mv.valor_venda, '+
                        '          mv.desconto, '+
                        '          mv.troco,   '+
                        '          mv.qtd_prod, '+
                        '          mv.prc_prod,  '+
                        '          mv.valor_imposto '+
                        '  from tb_movimentacao_vendas mv '+
                        '       inner join tb_produtos pr on mv.cd_produto = pr.cd_produto  '+
                        '       inner join tb_tanque ta on mv.cd_tanque = ta.cd_tanque '+
                        '       inner join tb_bomba bo on mv.cd_bomba = bo.cd_bomba  '+
                        '       inner join tb_operador op on mv.cd_operador = op.cd_operador '+
                        '       inner join tb_caixa cx on mv.cd_caixa = cx.cd_caixa  '+
                        '       inner join tb_fpgto pg on mv.cd_fpgto = pg.cd_fpgto '+
                        '  where mv.dt_movvendas between :DtINI and :DtFIN '+
                        '  order by mv.dt_movvendas,mv.cd_tanque,mv.cd_bomba ');
  Qry_RelVendas.Params.ParamByName('DtINI').AsString := FormatDateTime('dd.mm.yyyy',StrToDate(edt_DtINI.Text));
  Qry_RelVendas.Params.ParamByName('DtFIN').AsString := FormatDateTime('dd.mm.yyyy',StrToDate(edt_DtFIN.Text));
  Qry_RelVendas.Open();
  RLP_Vendas.Preview();
end;

procedure TfrmRel_Vendas.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRel_Vendas.edt_DtFINKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    btn_gerar.SetFocus;
end;

procedure TfrmRel_Vendas.edt_DtINIKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    edt_DtFIN.SetFocus;
end;

procedure TfrmRel_Vendas.FormShow(Sender: TObject);
begin
  edt_DtINI.Text := FormatDateTime('dd/mm/yyyy',now);
  edt_DtFIN.Text := FormatDateTime('dd/mm/yyyy',now);
  edt_DtINI.SetFocus;
  Qry_Empresa.Close;
  Qry_Empresa.Open();
end;

end.
