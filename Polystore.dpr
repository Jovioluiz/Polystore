program Polystore;

uses
  Vcl.Forms,
  fPrincipal in 'src\Principal\fPrincipal.pas' {frmPrincipal},
  uExcecoes in 'src\Excecoes\uExcecoes.pas',
  uConexao in 'src\Conexoes\uConexao.pas',
  uConexaoBase in 'src\Conexoes\uConexaoBase.pas',
  uConexaoMariaDB in 'src\Conexoes\uConexaoMariaDB.pas',
  uConexaoMySQL in 'src\Conexoes\uConexaoMySQL.pas',
  uConexaoPostgreSQL in 'src\Conexoes\uConexaoPostgreSQL.pas',
  uManipuladorConexao in 'src\Conexoes\uManipuladorConexao.pas',
  uConsultaPostgreSQL in 'src\Consulta\uConsultaPostgreSQL.pas',
  uConsultas in 'src\Consulta\uConsultas.pas',
  uManipuladorConsultas in 'src\Consulta\uManipuladorConsultas.pas',
  uManipuladorConsultasPostgreSQL in 'src\Consulta\uManipuladorConsultasPostgreSQL.pas',
  dConsultas in 'src\Consulta\dConsultas.pas' {dmConsultas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
