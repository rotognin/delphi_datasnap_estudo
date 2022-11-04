unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, uConexao;

type
  TfCliente = class(TForm)
    Label1: TLabel;
    SQLConnection: TSQLConnection;
    Label2: TLabel;
    edtTexto: TEdit;
    btnExecutar: TButton;
    Label3: TLabel;
    lblResultado: TLabel;
    Label4: TLabel;
    edtNumero1: TEdit;
    edtNumero2: TEdit;
    Label5: TLabel;
    btnSomar: TButton;
    lblNumero: TLabel;
    memTexto: TMemo;
    btnBuscarTxt: TButton;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConectarServidor;
    procedure btnSomarClick(Sender: TObject);
    function ObterConexao: TUClasseServidorClient;
    procedure btnBuscarTxtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

{$R *.dfm}

procedure TfCliente.btnBuscarTxtClick(Sender: TObject);
var objConn: TUClasseServidorClient;
begin
  memTexto.Lines.Clear;

  ConectarServidor;
  objConn := ObterConexao;

  try
    memTexto.Text := objConn.buscarTexto;
  finally
    objConn.Free;
  end;


end;

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
  objConn := ObterConexao;

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

function TfCliente.ObterConexao: TUClasseServidorClient;
begin
  Result := TUClasseServidorClient.Create(SQLConnection.DBXConnection);
end;

procedure TfCliente.btnSomarClick(Sender: TObject);
var objConn: TUClasseServidorClient;
begin
  if (edtNumero1.Text = EmptyStr) or (edtNumero2.Text = EmptyStr) then
  begin
    ShowMessage('É necessário informar os dois números.');
    edtNumero1.SetFocus;
    Exit;
  end;

  if (StrToIntDef(edtNumero1.Text, 0) = 0) or (StrToIntDef(edtNumero2.Text, 0) = 0) then
  begin
    ShowMessage('Favor informar números maiores que 0');
    edtNumero1.SetFocus;
    Exit;
  end;

  lblNumero.Caption := EmptyStr;

  ConectarServidor;
  objConn := ObterConexao;

  try
    lblNumero.Caption := IntToStr(objConn.somarNumeros(StrToInt(edtNumero1.Text), StrToInt(edtNumero2.Text)));
  finally
    objConn.Free;
  end;
end;

procedure TfCliente.ConectarServidor;
begin
  if NOT(SQLConnection.Connected) then
    SQLConnection.Open;
end;


end.
