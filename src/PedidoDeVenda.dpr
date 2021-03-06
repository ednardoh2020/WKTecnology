program PedidoDeVenda;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UDMPrincipal in 'UDMPrincipal.pas' {DM: TDataModule},
  UConexaoBDpas in 'UConexaoBDpas.pas' {frmConectaDB},
  UConecta in 'UConecta.pas',
  uRel_MovimetosDiario in 'uRel_MovimetosDiario.pas' {frmRel_Vendas},
  uClsClientes in 'Classes\uClsClientes.pas',
  uClsProdutos in 'Classes\uClsProdutos.pas',
  uClsPedidovenda in 'Classes\uClsPedidovenda.pas',
  uClsProdutosPedido in 'Classes\uClsProdutosPedido.pas',
  UPedidoDeVenda in 'UPedidoDeVenda.pas' {frmMov_PEDVendas},
  uPesquisa in 'uPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
