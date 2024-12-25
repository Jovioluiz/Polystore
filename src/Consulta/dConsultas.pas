unit dConsultas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmConsultas = class(TDataModule)
    dsConsultaPostgres: TDataSource;
    cdsConsultaPostgres: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConsultas: TdmConsultas;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
