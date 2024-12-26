unit uConexaoBase;

interface

uses
  uConexao, FireDAC.Comp.Client;

type
  TConexaoBase = class(TInterfacedObject, IConexao)

  public
    function GetConexao: TFDConnection; virtual; abstract;
    function Conectado: Boolean; virtual;

  end;

implementation

{ TConexaoBase }

function TConexaoBase.Conectado: Boolean;
begin
  Result := True;
end;

end.
