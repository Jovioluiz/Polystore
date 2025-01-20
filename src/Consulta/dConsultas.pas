unit dConsultas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TdmConsultas = class(TDataModule)
    dsPostgres: TDataSource;
    cdsPostgres: TClientDataSet;
    cdsPostgrescd_clifor: TIntegerField;
    cdsPostgresvl_unitario_medio: TCurrencyField;
    cdsPostgresvl_total_medio: TCurrencyField;
    cdsPostgresvl_subst_medio: TCurrencyField;
    cdsPostgresqt_vendida_media: TFloatField;
    cdsPostgresvl_ipi_medio: TCurrencyField;
    cdsPostgresvl_icms_normal_medio: TCurrencyField;
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
