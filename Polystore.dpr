program Polystore;

uses
  System.StartUpCopy,
  FMX.Forms,
  fPrincipal in 'src\Principal\fPrincipal.pas' {frmPrincipal},
  uConexao in 'src\Conexoes\uConexao.pas',
  uConexaoMySQL in 'src\Conexoes\uConexaoMySQL.pas',
  uConexaoPostgreSQL in 'src\Conexoes\uConexaoPostgreSQL.pas',
  uManipuladorConexao in 'src\Conexoes\uManipuladorConexao.pas',
  uConexaoMariaDB in 'src\Conexoes\uConexaoMariaDB.pas',
  uExcecoes in 'src\Excecoes\uExcecoes.pas',
  dConsultas in 'src\Consulta\dConsultas.pas' {dmConsultas: TDataModule},
  uConsultaPostgreSQL in 'src\Consulta\uConsultaPostgreSQL.pas',
  uConsultas in 'src\Consulta\uConsultas.pas',
  uManipuladorConsultas in 'src\Consulta\uManipuladorConsultas.pas',
  uConexaoBase in 'src\Conexoes\uConexaoBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
