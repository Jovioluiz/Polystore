unit uManipuladorConsultas;

interface

uses
  uConsultaPostgreSQL;

type
  TManipuladorConsultas = class
  private
    FPostgreSQL: TConsultasPostgreSQL;
  public
    constructor Create;
    destructor Destroy; override;
    property PostgreSQL: TConsultasPostgreSQL read FPostgreSQL;
  end;

implementation

{ TManipuladorConsultas }

constructor TManipuladorConsultas.Create;
begin
  FPostgreSQL := TConsultasPostgreSQL.Create;
end;

destructor TManipuladorConsultas.Destroy;
begin
  FPostgreSQL.Free;
  inherited;
end;

end.
