unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uManipuladorConexao, uManipuladorConsultasPostgreSQL;

type
  TfrmPrincipal = class(TForm)
    btnConectar: TButton;
    btnConsultar: TButton;
    grdConsultas: TDBGrid;
    pnlFundo: TPanel;
    procedure btnConectarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FManipuladorConexao: TManipuladorConexao;
    FManipuladorConsultas: TManipuladorConsultasPostgreSQL;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  FManipuladorConexao := TManipuladorConexao.Create;
  FManipuladorConsultas := TManipuladorConsultasPostgreSQL.Create;
  FManipuladorConexao.ConectarBancos;

  grdConsultas.DataSource :=  FManipuladorConsultas.Dados.dsPostgres;
end;

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
begin
  if not Assigned(FManipuladorConsultas) then
    raise Exception.Create('Necessário conectar nos bancos primeiramente.');

  FManipuladorConsultas.CarregaValoresMedios;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FManipuladorConexao.Free;
  FManipuladorConsultas.Free;
end;

end.
