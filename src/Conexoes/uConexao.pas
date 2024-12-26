unit uConexao;

interface

uses
  FireDAC.Comp.Client;

type
  IConexao = interface
  ['{1CDA797D-F2DB-4B83-9DAE-9C8D37475EE4}']
    function GetConexao: TFDConnection;
    function Conectado: Boolean;
  end;

implementation

end.
