unit uDm;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfDm = class(TDataModule)
    SQLConnection: TSQLConnection;
    SQLQuery: TSQLQuery;
    SQLQuerytxt_texto: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConectarBanco;
    procedure ExecutarConsulta;
    procedure DesconectarBanco;
  end;

var
  fDm: TfDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TfDm }

procedure TfDm.ConectarBanco;
begin
  if NOT(SQLConnection.Connected) then
    SQLConnection.Open;
end;

procedure TfDm.DesconectarBanco;
begin
  if (SQLQuery.Active) then
    SQLQuery.Close;

  if (SQLConnection.Connected) then
    SQLConnection.Close;
end;

procedure TfDm.ExecutarConsulta;
begin
  if (SQLQuery.Active) then
    SQLQuery.Close;

  SQLQuery.Open;
end;

end.
