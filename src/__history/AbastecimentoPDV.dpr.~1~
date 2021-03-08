program AbastecimentoPDV;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UDMPrincipal in 'UDMPrincipal.pas' {DM: TDataModule},
  UConexaoBDpas in 'UConexaoBDpas.pas' {frmConectaDB},
  UConecta in 'UConecta.pas',
  UCad_TAMQUE in 'UCad_TAMQUE.pas' {frmCad_Tanques},
  UTanques in 'Classes\UTanques.pas',
  UDMCad in 'UDMCad.pas' {DMCad: TDataModule},
  uPesquisa in 'uPesquisa.pas' {FrmPesquisa},
  UCad_Bomba in 'UCad_Bomba.pas' {frmCad_Bombas},
  UBombas in 'Classes\UBombas.pas',
  UProdutos in 'Classes\UProdutos.pas',
  UCad_Produto in 'UCad_Produto.pas' {frmCad_Produto},
  UFpgto in 'Classes\UFpgto.pas',
  UCad_Fpgto in 'UCad_Fpgto.pas' {frmCad_Fpgto},
  UOperador in 'Classes\UOperador.pas',
  UCad_Operador in 'UCad_Operador.pas' {frmCad_Operador},
  UCaixa in 'Classes\UCaixa.pas',
  UCad_Caixa in 'UCad_Caixa.pas' {frmCad_Caixa},
  UEmpresa in 'Classes\UEmpresa.pas',
  UCad_Empresa in 'UCad_Empresa.pas' {frmCad_Empresa},
  UParametro in 'UParametro.pas' {frmParametro},
  UVendasPDV in 'UVendasPDV.pas' {frmMov_Vendas},
  uPesquisaProd in 'uPesquisaProd.pas' {frmPes_Produto},
  uFormaPgto in 'uFormaPgto.pas' {frmForma_Pgto},
  uRel_MovimetosDiario in 'uRel_MovimetosDiario.pas' {frmRel_Vendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMCad, DMCad);
  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  Application.CreateForm(TfrmRel_Vendas, frmRel_Vendas);
  Application.Run;
end.
