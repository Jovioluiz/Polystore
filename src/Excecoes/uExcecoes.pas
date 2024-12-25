unit uExcecoes;

interface

uses
  System.SysUtils;

type
  TExcecoes = class(Exception)

  end;

type
  TExcecoesMariaDB = class(TExcecoes)

  end;

type
  TExcecoesMySQL = class(TExcecoes)

  end;

type
  TExcecoesPostgreSQL = class(TExcecoes)

  end;

implementation

end.
