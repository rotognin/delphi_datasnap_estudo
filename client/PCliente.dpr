program PCliente;

uses
  Vcl.Forms,
  uCliente in 'uCliente.pas' {fCliente},
  uConexao in 'uConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfCliente, fCliente);
  Application.Run;
end.
