unit uConexaoMariaDB;

interface

uses
  uConexao, FireDAC.Comp.Client, FireDAC.Phys.MySQL, System.SysUtils;

type
  TConexaoMariaDB = class(TInterfacedObject, IConexao)
  private
    FConnection: TFDConnection;
    FDriver: TFDPhysMySQLDriverLink;
  public
    function Conectar(): IConexao;
    function Conectado: Boolean;
    function Conexao: TFDConnection;
    constructor Create;
    destructor Destroy; override;

  end;

implementation

uses
  System.IniFiles, uExcecoes;

{ TConexaoMariaDB }

function TConexaoMariaDB.Conectado: Boolean;
begin
  Result := FConnection.Connected;
end;

function TConexaoMariaDB.Conectar: IConexao;
var
  conexaoIni: TIniFile;
begin

  conexaoIni := TIniFile.Create('.\conexao.ini');
  try
    try
      FConnection.DriverName := 'MySQL';
      FConnection.Params.Values['Server'] := conexaoIni.ReadString('configuracoesMariaDB', 'servidor', '');
      if FConnection.Params.Values['Server'].IsEmpty then
        Exit(nil);

      FConnection.Params.Database := conexaoIni.ReadString('configuracoesMariaDB', 'banco', '');
      FConnection.Params.UserName := conexaoIni.ReadString('configuracoesMariaDB', 'usuario', '');
      FConnection.Params.Password := conexaoIni.ReadString('configuracoesMariaDB', 'senha', '');
      FConnection.Params.Values['Port'] := conexaoIni.ReadString('configuracoesMariaDB', 'porta', '');
      FConnection.Params.Values['UseSSL'] := '0';
      FDriver.VendorLib := '.\lib\libmysql.dll';
      FConnection.LoginPrompt := False;
      FConnection.Connected := True;

      Result := Self;
    except
      on e: Exception do
      begin
        var msg := 'Erro ao conectar no banco de dados ' + FConnection.Params.Database + ''#13'' + ' Verifique o arquivo de conexao.' + ''#13'';
        raise TExcecoesMariaDB.Create(msg + e.Message);
      end;
    end;
  finally
    conexaoIni.Free;
  end;
end;

function TConexaoMariaDB.Conexao: TFDConnection;
begin
  Result := FConnection;
end;

constructor TConexaoMariaDB.Create;
begin
  FConnection := TFDConnection.Create(nil);
  FDriver := TFDPhysMySQLDriverLink.Create(nil);
end;

destructor TConexaoMariaDB.Destroy;
begin
  FConnection.Free;
  FDriver.Free;
  inherited;
end;

end.
