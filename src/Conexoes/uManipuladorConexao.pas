unit uManipuladorConexao;

interface

uses
  uConexao;

type
  TManipuladorConexao = class
  private
    FPostgreSQL,
    FMySQL,
    FMariaDB: IConexao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ConectarBancos;

    property PostgreSQL: IConexao read FPostgreSQL;
    property MySQL: IConexao read FMySQL;
    property MariaDB: IConexao read FMariaDB;
  end;

implementation

uses
  uConexaoPostegreSQL, uConexaoMySQL, uConexaoMariaDB;

{ TManipuladorConexao }

procedure TManipuladorConexao.ConectarBancos;
begin
  FPostgreSQL.Conectar;
  FMySQL.Conectar;
  FMariaDB.Conectar;
end;

constructor TManipuladorConexao.Create;
begin
  FPostgreSQL := TConexaoPostegreSQL.Create;
  FMySQL := TConexaoMySQL.Create;
  FMariaDB := TConexaoMariaDB.Create;
end;

destructor TManipuladorConexao.Destroy;
begin

  inherited;
end;

end.
