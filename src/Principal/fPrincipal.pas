unit fPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.MySQL, uManipuladorConexao,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, uManipuladorConsultas;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    btnConectar: TButton;
    grdConsulta: TGrid;
    vl_unitario_medio: TCurrencyColumn;
    vl_total_medio: TCurrencyColumn;
    vl_subst_medio: TCurrencyColumn;
    qt_vendida_media: TFloatColumn;
    cd_clifor: TIntegerColumn;
    btnConsultar: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    FManipuladorConexao: TManipuladorConexao;
    FManipuladorConsultas: TManipuladorConsultas;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation


{$R *.fmx}

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  FManipuladorConexao := TManipuladorConexao.Create;
  FManipuladorConsultas := TManipuladorConsultas.Create;
  FManipuladorConexao.ConectarBancos;
end;

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
begin
  if not Assigned(FManipuladorConsultas) then
    raise Exception.Create('Necessário conectar nos bancos primeiramente.');

  FManipuladorConsultas.PostgreSQL.CarregaValoresMedios;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  grdConsulta.Live
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FManipuladorConexao.Free;
  FManipuladorConsultas.Free;
end;

end.
