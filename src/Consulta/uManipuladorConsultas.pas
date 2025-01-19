unit uManipuladorConsultas;

interface

uses
  dConsultas, uConexaoBase;

type
  TManipuladorConsultas = class

  private
    FDados: TdmConsultas;
    FConexao: TConexaoBase;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Dados: TdmConsultas read FDados write FDados;
  end;

implementation

{ TManipuladorConsultas }

constructor TManipuladorConsultas.Create;
begin
  FDados := TdmConsultas.Create(nil);
end;

destructor TManipuladorConsultas.Destroy;
begin
  FDados.Free;
  inherited;
end;

end.
