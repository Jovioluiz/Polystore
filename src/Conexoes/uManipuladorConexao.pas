unit uManipuladorConexao;

interface

uses
  uConexao, uConexaoMariaDB, uConexaoMySQL, uConexaoPostgreSQL;

type
  TManipuladorConexao = class
  private
    FPostgreSQL: TConexaoPostgreSQL;
    FMySQL: TConexaoMySQL;
    FMariaDB: TConexaoMariaDB;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ConectarBancos;

    property PostgreSQL: TConexaoPostgreSQL read FPostgreSQL;
    property MySQL: TConexaoMySQL read FMySQL;
    property MariaDB: TConexaoMariaDB read FMariaDB;
  end;

implementation

{ TManipuladorConexao }

procedure TManipuladorConexao.ConectarBancos;
begin
//  FPostgreSQL.Conectar;
//  FMySQL.Conectar;
//  FMariaDB.Conectar;
end;

constructor TManipuladorConexao.Create;
begin
  FPostgreSQL := TConexaoPostgreSQL.GetInstancia;
  FMySQL := TConexaoMySQL.Create;
  FMariaDB := TConexaoMariaDB.Create;
end;

destructor TManipuladorConexao.Destroy;
begin

  inherited;
end;

end.
