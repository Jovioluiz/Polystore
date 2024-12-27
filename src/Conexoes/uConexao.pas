unit uConexao;

interface

uses
  FireDAC.Comp.Client;

type
  TConexao = class
    function GetConexao: TFDConnection; virtual; abstract;
    function Conectado: Boolean; virtual; abstract;
  end;

implementation

end.
