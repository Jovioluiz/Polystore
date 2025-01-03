unit uConexaoMySQL;

interface

uses
  uConexao, FireDAC.Comp.Client, FireDAC.Phys.MySQL, IniFiles, System.SysUtils,
  uConexaoBase;

type
  TConexaoMySQL = class(TConexaoBase)
  private
    FConnection: TFDConnection;
    FDriver: TFDPhysMySQLDriverLink;
  public
    function GetConexao: TFDConnection; override;
    function Conectado: Boolean; override;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TConexaoMySQL }

uses uExcecoes;

function TConexaoMySQL.Conectado: Boolean;
begin
  Result := FConnection.Connected;
end;

function TConexaoMySQL.GetConexao: TFDConnection;
begin
  Result := FConnection;
end;

constructor TConexaoMySQL.Create;
var
  conexaoIni: TIniFile;
begin
  FConnection := TFDConnection.Create(nil);
  FDriver := TFDPhysMySQLDriverLink.Create(nil);

  conexaoIni := TIniFile.Create('.\conexao.ini');
  try
    try
      FConnection.DriverName := 'MySQL';
      FConnection.Params.Values['Server'] := conexaoIni.ReadString('configuracoesMySQL', 'servidorMy', '');
      if FConnection.Params.Values['Server'].IsEmpty then
        Exit();

      FConnection.Params.Database := conexaoIni.ReadString('configuracoesMySQL', 'bancoMy', '');
      FConnection.Params.UserName := conexaoIni.ReadString('configuracoesMySQL', 'usuarioMy', '');
      FConnection.Params.Password := conexaoIni.ReadString('configuracoesMySQL', 'senhaMy', '');
      FConnection.Params.Values['Port'] := conexaoIni.ReadString('configuracoesMySQL', 'portaMy', '');
      FDriver.VendorLib := '.\lib\libpq.dll';
      FConnection.LoginPrompt := False;
      FConnection.Connected := True;

    except
      on e: Exception do
      begin
        var msg := 'Erro ao conectar no banco de dados ' + FConnection.Params.Database + ''#13'' + ' Verifique o arquivo de conexao.' + ''#13'';
        raise TExcecoesMySQL.Create(msg + e.Message);
      end;
    end;
  finally
    conexaoIni.Free;
  end;
end;

destructor TConexaoMySQL.Destroy;
begin
  FConnection.Free;
  FDriver.Free;
  inherited;
end;

end.
