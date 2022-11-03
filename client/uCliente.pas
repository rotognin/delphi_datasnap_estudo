unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr;

type
  TfCliente = class(TForm)
    Label1: TLabel;
    SQLConnection: TSQLConnection;
    Label2: TLabel;
    edtTexto: TEdit;
    btnExecutar: TButton;
    Label3: TLabel;
    lblResultado: TLabel;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConectarServidor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

{$R *.dfm}

uses uConexao;

procedure TfCliente.btnExecutarClick(Sender: TObject);
var objConn: TUClasseServidorClient;
begin
  if (edtTexto.Text = EmptyStr) then
  begin
    ShowMessage('Digite alguma coisaaaaa');
    edtTexto.SetFocus;
    Exit;
  end;

  lblResultado.Caption := '';

  // Instanciar a classe que irá conectar com o servidor
  ConectarServidor;
  objConn := TUClasseServidorClient.Create(SQLConnection.DBXConnection);

  try
    lblResultado.Caption := objConn.mostrarTexto(edtTexto.Text);
  finally
    objConn.Free;
  end;
end;

procedure TfCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (SQLConnection.Connected) then
    SQLConnection.Close;
end;

procedure TfCliente.ConectarServidor;
begin
  if NOT(SQLConnection.Connected) then
    SQLConnection.Open;
end;


end.
