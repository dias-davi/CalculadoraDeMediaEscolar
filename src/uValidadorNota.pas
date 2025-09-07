unit uValidadorNota;

interface

uses
  System.SysUtils;

type
  TValidadorNota = class
  private

  public
    class function SimularTexto(const TextoAtual: string; Key: Char): string; static;
    class function VerificarSeEhDigitoValido(Key: Char): Boolean;
    class function VerificarSeEhVirgulaNaPrimeiraPosicao(const pTexto: string; Key: Char): Boolean;
    class function PermitirApenasUmaVirgula(const pTexto: string; Key: Char): Boolean;
    class function VerificarZeroAEsquerda(const pTexto: string; Key: Char): Boolean;
    class function LimitarCasasDecimais(const pTexto: string; Key: Char; CasasDecimais: Integer): Boolean;
    class function ForaDoIntervalo(const TextoSimulado: string): Boolean;
  end;

implementation

class function TValidadorNota.SimularTexto(const TextoAtual: string; Key: Char): string;
begin
  if Key <> #8 then
    Result := TextoAtual + Key
  else if Key = #8 then
    Result := Copy(TextoAtual, 1, Length(TextoAtual) - 1);
end;

class function TValidadorNota.VerificarSeEhDigitoValido(Key: Char): Boolean;
begin
  Result := Key in ['0'..'9', ',', #8];
end;

class function TValidadorNota.VerificarSeEhVirgulaNaPrimeiraPosicao(const pTexto: string; Key: Char): Boolean;
begin
  Result := (Key = ',') and (pTexto = '');
end;

class function TValidadorNota.PermitirApenasUmaVirgula(const pTexto: string; Key: Char): Boolean;
begin
  Result := (Key = ',') and (Pos(',', pTexto) > 0);
end;

class function TValidadorNota.VerificarZeroAEsquerda(const pTexto: string; Key: Char): Boolean;
begin
  Result := (Length(pTexto) = 1) and (pTexto[1] = '0') and (Key in ['0'..'9']);
end;

class function TValidadorNota.LimitarCasasDecimais(const pTexto: string; Key: Char; CasasDecimais: Integer): Boolean;
var
  LPosVirgula: Integer;
begin
  LPosVirgula := Pos(',', pTexto);
  Result := (LPosVirgula > 0) and (Key in ['0'..'9']) and (Length(pTexto) - LPosVirgula >= 2);
end;

class function TValidadorNota.ForaDoIntervalo(const TextoSimulado: string): Boolean;
var
  LValor: Double;
begin
  Result := False;
  try
    if (TextoSimulado <> '') and (TextoSimulado[Length(TextoSimulado)] <> ',') then
    begin
      LValor := StrToFloat(TextoSimulado);
      Result := (LValor < 0) or (LValor > 10);
    end;
  except
    Result := True;
  end;
end;

end.

