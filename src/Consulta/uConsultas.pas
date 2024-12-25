unit uConsultas;

interface

uses
  uConexao, FireDAC.Comp.Client;

type
  TConsultas = class(TFDQuery)
  private
    FConexao: IConexao;
    function GetConexaoDB: TFDConnection;
  public
    constructor Create(Conexao: IConexao); reintroduce;
    property ConexaoDB: TFDConnection read GetConexaoDB;
  end;

implementation

uses
  uConexaoPostegreSQL, uConexaoMySQL, uConexaoMariaDB;

{ TConsultas }

constructor TConsultas.Create(Conexao: IConexao);
begin
  FConexao := Conexao;
  Self.Connection := GetConexaoDB;
end;

function TConsultas.GetConexaoDB: TFDConnection;
begin
  if FConexao is TConexaoPostegreSQL then
    Result :=  TConexaoPostegreSQL(FConexao).Conexao
  else if FConexao is TConexaoMySQL then
    Result :=  TConexaoMySQL(FConexao).Conexao
  else if FConexao is TConexaoMariaDB then
    Result :=  TConexaoMariaDB(FConexao).Conexao
  else
    Result := nil;
end;

end.
