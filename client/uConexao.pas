//
// Created by the DataSnap proxy generator.
// 04/11/2022 14:39:14
//

unit uConexao;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TUClasseServidorClient = class(TDSAdminClient)
  private
    FmostrarTextoCommand: TDBXCommand;
    FsomarNumerosCommand: TDBXCommand;
    FbuscarTextoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function mostrarTexto(Texto: string): string;
    function somarNumeros(numero1: Integer; numero2: Integer): Integer;
    function buscarTexto: string;
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

function TUClasseServidorClient.somarNumeros(numero1: Integer; numero2: Integer): Integer;
begin
  if FsomarNumerosCommand = nil then
  begin
    FsomarNumerosCommand := FDBXConnection.CreateCommand;
    FsomarNumerosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsomarNumerosCommand.Text := 'TUClasseServidor.somarNumeros';
    FsomarNumerosCommand.Prepare;
  end;
  FsomarNumerosCommand.Parameters[0].Value.SetInt32(numero1);
  FsomarNumerosCommand.Parameters[1].Value.SetInt32(numero2);
  FsomarNumerosCommand.ExecuteUpdate;
  Result := FsomarNumerosCommand.Parameters[2].Value.GetInt32;
end;

function TUClasseServidorClient.buscarTexto: string;
begin
  if FbuscarTextoCommand = nil then
  begin
    FbuscarTextoCommand := FDBXConnection.CreateCommand;
    FbuscarTextoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FbuscarTextoCommand.Text := 'TUClasseServidor.buscarTexto';
    FbuscarTextoCommand.Prepare;
  end;
  FbuscarTextoCommand.ExecuteUpdate;
  Result := FbuscarTextoCommand.Parameters[0].Value.GetWideString;
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
  FsomarNumerosCommand.DisposeOf;
  FbuscarTextoCommand.DisposeOf;
  inherited;
end;

end.

