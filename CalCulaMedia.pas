unit CalCulaMedia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TSituacaoAluno = class(TForm)
    lbledtNota1: TLabeledEdit;
    lbledtNota2: TLabeledEdit;
    lbledtNota3: TLabeledEdit;
    btnCalcularMedia: TButton;
    lblResultado: TLabel;
    grpNotas: TGroupBox;
    grpResultado: TGroupBox;
    grpLabelResultado: TGroupBox;
    function VerificarAprovacao(pNota1: Double;
                                pNota2: Double;
                                pNota3: Double): string;
    procedure btnCalcularMediaClick(Sender: TObject);
    procedure lbledtNota1KeyPress(Sender: TObject;
                                  var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SituacaoAluno: TSituacaoAluno;

implementation

{$R *.dfm}

procedure TSituacaoAluno.btnCalcularMediaClick(Sender: TObject);
var
  lNota1: Double;
  lNota2: Double;
  lNota3: Double;
  lResultado: string;

begin
  lNota1:= StrToFloat(lbledtNota1.Text);
  lNota2:= StrToFloat(lbledtNota2.Text);
  lNota3:= StrToFloat(lbledtNota3.Text);

  lResultado := VerificarAprovacao(lNota1, lNota2, lNota3);

  lblResultado.Caption := lResultado;
end;

procedure TSituacaoAluno.lbledtNota1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then
    key := #0
end;

function TSituacaoAluno.VerificarAprovacao(pNota1: Double; pNota2: Double; pNota3: Double): string;
  var
    lMedia: Double;
    lMensagemAprovado: string;
    lMensagemRecuperacao: string;
    lMensagemReprovado: string;

begin
  lMedia:= ((pNota1 + pNota2 + pNota3) / 3);
    lMensagemAprovado :='Aprovado!' + #13#10 +'Média: ' + FloatToStr(lMedia);
    lMensagemRecuperacao := 'Em Recuperação!' + #13#10 + 'Média: ' + FloatToStr(lMedia);
    lMensagemReprovado := 'Reprovado!' + #13#10 + 'Média: ' + FloatToStr(lMedia);

  if lMedia >= 7 then
    Result := lMensagemAprovado

  else if ((lMedia >= 5) and (lMedia <= 6.9)) then
    Result := lMensagemRecuperacao

  else if lMedia < 5 then
    Result := lMensagemReprovado

end;

end.
