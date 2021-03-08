unit UDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.VCLUI.Wait, FireDAC.VCLUI.Async,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    DBConexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
    gblValCodigo : String;
    gblValNome : String;
    gblValPrcProd : String;
    gblValBomba : String;
    gblFormaPgto : String;
    gblValorPago : String;
    gblTroco : String;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
