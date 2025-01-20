unit uManipuladorConsultasPostgreSQL;

interface

uses
  uConsultaPostgreSQL, uManipuladorConsultas, uConexaoPostgreSQL;

type
  TManipuladorConsultasPostgreSQL = class(TManipuladorConsultas)
  private
    FConexaoPostgreSQL: TConexaoPostgreSQL;
  public
    procedure CarregaValoresMedios;
    constructor Create; override;
    destructor Destroy; override;
    property ConexaoPostgreSQL: TConexaoPostgreSQL read FConexaoPostgreSQL;
  end;

implementation

uses
  uConsultas;

{ TManipuladorConsultas }

procedure TManipuladorConsultasPostgreSQL.CarregaValoresMedios;
const
  SQL = ' SELECT ' +
        ' 	sum(vl_total) / sum(qt_compra_venda) AS vl_unitario_medio, ' +
        ' 	sum(vl_total) / count(*) AS vl_total_medio, ' +
        ' 	sum(icms_subst_vl_base) / count(*) AS vl_subst_medio, ' +
        ' 	sum(qt_compra_venda) / count(*) AS qt_vendida_media, ' +
        '   sum(ipi_vl_base) / count(*) AS vl_ipi_medio, ' +
        '   sum(icms_normal_vl_base) / count(*) AS vl_icms_normal_medio,  ' +
        ' 	cd_clifor ' +
        ' FROM ' +
        ' 	NFC ' +
        ' GROUP BY ' +
        ' 	cd_clifor  ';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.GetConsultaSQL(TConexaoPostgreSQL.GetInstancia, SQL);
  try
    consulta.Open(SQL);
    consulta.First;
    while not consulta.Eof do
    begin
      Dados.cdsPostgres.Append;
      Dados.cdsPostgres.FieldByName('cd_clifor').AsInteger := consulta.FieldByName('cd_clifor').AsInteger;
      Dados.cdsPostgres.FieldByName('vl_unitario_medio').AsCurrency := consulta.FieldByName('vl_unitario_medio').AsCurrency;
      Dados.cdsPostgres.FieldByName('vl_total_medio').AsCurrency := consulta.FieldByName('vl_total_medio').AsCurrency;
      Dados.cdsPostgres.FieldByName('vl_subst_medio').AsCurrency := consulta.FieldByName('vl_subst_medio').AsCurrency;
      Dados.cdsPostgres.FieldByName('qt_vendida_media').AsCurrency := consulta.FieldByName('qt_vendida_media').AsCurrency;
      Dados.cdsPostgres.FieldByName('vl_ipi_medio').AsCurrency := consulta.FieldByName('vl_ipi_medio').AsCurrency;
      Dados.cdsPostgres.FieldByName('vl_icms_normal_medio').AsCurrency := consulta.FieldByName('vl_icms_normal_medio').AsCurrency;
      Dados.cdsPostgres.Post;
      consulta.Next;
    end;
  finally
    consulta.Free;
  end;
end;


constructor TManipuladorConsultasPostgreSQL.Create;
begin
  inherited;
end;

destructor TManipuladorConsultasPostgreSQL.Destroy;
begin
  inherited;
end;

end.
