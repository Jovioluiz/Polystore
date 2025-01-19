unit dConsultas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TdmConsultas = class(TDataModule)
    dsPostgres: TDataSource;
    cdsPostgres: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConsultas: TdmConsultas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
