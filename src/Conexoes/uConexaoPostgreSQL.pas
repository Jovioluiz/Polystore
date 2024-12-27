unit uConexaoPostgreSQL;

interface

uses
  uConexao, FireDAC.Comp.Client, Firedac.Stan.Def, FireDAC.Phys.PG, System.SysUtils,
  uConexaoBase;

type
  TConexaoPostgreSQL = class(TConexaoBase)
  private
    class var Instancia: TConexaoPostgreSQL;
    FConnection: TFDConnection;
    FDriver: TFDPhysPgDriverLink;
  protected
    constructor Create;
  public
    function GetConexao: TFDConnection; override;
    function Conectado: Boolean; override;
    class function GetInstancia: TConexaoPostgreSQL;
    class procedure ReleaseInstance;
    destructor Destroy; override;
  end;
implementation

uses
  System.IniFiles, uExcecoes;

{ TConexaoPostegreSQL }

function TConexaoPostgreSQL.Conectado: Boolean;
begin
  Result := FConnection.Connected;
end;

function TConexaoPostgreSQL.GetConexao: TFDConnection;
begin
  Result := FConnection;
end;

class function TConexaoPostgreSQL.GetInstancia: TConexaoPostgreSQL;
begin
  if not Assigned(Instancia) then
    Instancia := TConexaoPostgreSQL.Create;
  Result := Instancia;
end;

class procedure TConexaoPostgreSQL.ReleaseInstance;
begin
  if Assigned(Instancia) then
    Instancia.Free;
end;

constructor TConexaoPostgreSQL.Create;
var
  conexaoIni: TIniFile;
begin
  FConnection := TFDConnection.Create(nil);
  FDriver := TFDPhysPgDriverLink.Create(nil);

    conexaoIni := TIniFile.Create('.\conexao.ini');
  try
    try
      FConnection.DriverName := 'PG';
      FConnection.Params.Values['Server'] := conexaoIni.ReadString('configuracoesPostgreSQL', 'servidor', '');
      FConnection.Params.Database := conexaoIni.ReadString('configuracoesPostgreSQL', 'banco', '');
      FConnection.Params.UserName := conexaoIni.ReadString('configuracoesPostgreSQL', 'usuario', '');
      FConnection.Params.Password := conexaoIni.ReadString('configuracoesPostgreSQL', 'senha', '');
      FConnection.Params.Values['Port'] := conexaoIni.ReadString('configuracoesPostgreSQL', 'porta', '');
      FConnection.LoginPrompt := False;
      FDriver.VendorLib := '.\lib\libpq.dll';
      FConnection.TxOptions.AutoCommit := False;
      FConnection.Connected := True;
    except
      on e: Exception do
      begin
        var msg := 'Erro ao conectar no banco de dados ' + FConnection.Params.Database + ''#13'' + ' Verifique o arquivo de conexao.' + ''#13'';
        raise TExcecoesPostgreSQL.Create(msg + e.Message);
      end;
    end;
  finally
    conexaoIni.Free;
  end;
end;

destructor TConexaoPostgreSQL.Destroy;
begin
  FConnection.Free;
  FDriver.Free;
  inherited;
end;

initialization

finalization
  TConexaoPostgreSQL.ReleaseInstance;

end.
