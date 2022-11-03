program PServidor;

uses
  Vcl.Forms,
  uServidor in 'uServidor.pas' {fServidor},
  uClasseServidor in 'uClasseServidor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfServidor, fServidor);
  Application.Run;
end.
