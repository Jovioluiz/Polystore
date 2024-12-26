unit uConexaoPostegreSQL;

interface

uses
  uConexao, FireDAC.Comp.Client, Firedac.Stan.Def, FireDAC.Phys.PG, System.SysUtils,
  uConexaoBase;

type
  TConexaoPostegreSQL = class(TConexaoBase)
  private
    FConnection: TFDConnection;
    FDriver: TFDPhysPgDriverLink;
  public
    function GetConexao: TFDConnection; override;
    function Conectado: Boolean; override;
    constructor Create;
    destructor Destroy; override;
  end;
implementation

uses
  System.IniFiles, uExcecoes;

{ TConexaoPostegreSQL }

function TConexaoPostegreSQL.Conectado: Boolean;
begin
  Result := FConnection.Connected;
end;

function TConexaoPostegreSQL.GetConexao: TFDConnection;
begin
  Result := FConnection;
end;

constructor TConexaoPostegreSQL.Create;
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

destructor TConexaoPostegreSQL.Destroy;
begin
  FConnection.Free;
  FDriver.Free;
  inherited;
end;

end.
