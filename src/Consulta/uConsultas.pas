unit uConsultas;

interface

uses
  uConexao, FireDAC.Comp.Client, System.Classes, FireDAC.DApt, FireDAC.Stan.Async;

type
  TConsultaSQL = class(TFDQuery)
  private
    FConexao: TConexao;
    function GetConexaoDB: TFDConnection;
    constructor Create(const Conexao: TConexao; const SQL: string = ''); reintroduce; overload;
  public
    constructor Create(Owner: TComponent); overload; override;
    class function GetConsultaSQL(const Conexao: TConexao; const SQL: string = ''): TConsultaSQL; static;
    property ConexaoDB: TFDConnection read GetConexaoDB;
  end;

implementation

uses
  uConexaoPostgreSQL, uConexaoMySQL, uConexaoMariaDB;

{ TConsultas }

function TConsultaSQL.GetConexaoDB: TFDConnection;
begin
  if FConexao is TConexaoPostgreSQL then
    Result :=  TConexaoPostgreSQL(FConexao).GetInstancia.GetConexao
  else if FConexao is TConexaoMySQL then
    Result :=  TConexaoMySQL(FConexao).GetConexao
  else if FConexao is TConexaoMariaDB then
    Result :=  TConexaoMariaDB(FConexao).GetConexao
  else
    Result := nil;
end;

constructor TConsultaSQL.Create(Owner: TComponent);
begin
  inherited Create(Owner);
end;

constructor TConsultaSQL.Create(const Conexao: TConexao; const SQL: string = '');
begin
  FConexao := Conexao;
  Create(Owner);
  Self.Connection := ConexaoDB;
  Self.SQL.Text := SQL;
end;

class function TConsultaSQL.GetConsultaSQL(const Conexao: TConexao; const SQL: string = ''): TConsultaSQL;
begin
  Result := TConsultaSQL.Create(Conexao, SQL);
end;

end.
