unit uClasseServidor;

interface

uses Classes, uDm, System.SysUtils;

type
  {$METHODINFO ON}
  TUClasseServidor = class(TComponent)

    function mostrarTexto(Texto: String): String;
    function somarNumeros(numero1, numero2: Integer): Integer;
    function buscarTexto: String;

  end;
  {$METHODINFO OFF}

implementation

{ TUClasseServidor }

// Função gerada automaticamente usando Ctrl + Shift + C
function TUClasseServidor.buscarTexto: String;
begin
  // Buscar texto de uma tabela do banco de dados
  fDm.ConectarBanco;
  fDm.ExecutarConsulta;

  if (fDm.SQLQuerytxt_texto.AsString = EmptyStr) then
    Result := 'Sem informação'
  Else
    Result := fDm.SQLQuerytxt_texto.AsString;

  fDm.DesconectarBanco;
end;

function TUClasseServidor.mostrarTexto(Texto: String): String;
begin
  // Retornar alguma coisa
  Result := ' --- ' + Texto + ' --- ';
end;


function TUClasseServidor.somarNumeros(numero1, numero2: Integer): Integer;
begin
  Result := numero1 + numero2;
end;

end.
