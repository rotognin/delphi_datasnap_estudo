//
// Created by the DataSnap proxy generator.
// 03/11/2022 17:48:48
// 

unit uConexao;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TUClasseServidorClient = class(TDSAdminClient)
  private
    FmostrarTextoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function mostrarTexto(Texto: string): string;
  end;

implementation

function TUClasseServidorClient.mostrarTexto(Texto: string): string;
begin
  if FmostrarTextoCommand = nil then
  begin
    FmostrarTextoCommand := FDBXConnection.CreateCommand;
    FmostrarTextoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FmostrarTextoCommand.Text := 'TUClasseServidor.mostrarTexto';
    FmostrarTextoCommand.Prepare;
  end;
  FmostrarTextoCommand.Parameters[0].Value.SetWideString(Texto);
  FmostrarTextoCommand.ExecuteUpdate;
  Result := FmostrarTextoCommand.Parameters[1].Value.GetWideString;
end;

constructor TUClasseServidorClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TUClasseServidorClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TUClasseServidorClient.Destroy;
begin
  FmostrarTextoCommand.DisposeOf;
  inherited;
end;

end.
