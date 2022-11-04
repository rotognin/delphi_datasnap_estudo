program PServidor;

uses
  Vcl.Forms,
  uServidor in 'uServidor.pas' {fServidor},
  uClasseServidor in 'uClasseServidor.pas',
  uDm in 'uDm.pas' {fDm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfServidor, fServidor);
  Application.CreateForm(TfDm, fDm);
  Application.Run;
end.
