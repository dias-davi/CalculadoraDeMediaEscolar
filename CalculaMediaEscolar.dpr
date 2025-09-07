program CalculaMediaEscolar;

uses
  Vcl.Forms,
  TelaPrincipal in 'src\TelaPrincipal.pas' {SituacaoAluno},
  uValidadorNota in 'src\uValidadorNota.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSituacaoAluno, SituacaoAluno);
  Application.Run;
end.
