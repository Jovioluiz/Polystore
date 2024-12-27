unit uConsultaPostgreSQL;

interface

uses
  uConexaoPostgreSQL;

type
  TConsultasPostgreSQL = class(TConexaoPostgreSQL)
  private
  public
    procedure CarregaValoresMedios;

    constructor Create;
  end;

implementation

uses
  uConsultas;

{ TConsultasPostgreSQL }

procedure TConsultasPostgreSQL.CarregaValoresMedios;
const
  SQL = ' SELECT ' +
        ' 	sum(vl_total) / sum(qt_compra_venda) AS vl_unitario_medio, ' +
        ' 	sum(vl_total) / count(*) AS vl_total_medio, ' +
        ' 	sum(icms_subst_vl_base) / count(*) AS vl_subst_medio, ' +
        ' 	sum(qt_compra_venda) / count(*) AS qt_vendida_media, ' +
        ' 	cd_clifor ' +
        ' FROM ' +
        ' 	NFC ' +
        ' GROUP BY ' +
        ' 	cd_clifor  ';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.GetConsultaSQL(Self, SQL);
  try
    consulta.Open(SQL);
  finally
    consulta.Free;
  end;
end;

constructor TConsultasPostgreSQL.Create;
begin

end;

end.
