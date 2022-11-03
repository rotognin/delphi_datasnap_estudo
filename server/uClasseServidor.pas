unit uClasseServidor;

interface

uses Classes;

type
  {$METHODINFO ON}
  TUClasseServidor = class(TComponent)

    function mostrarTexto(Texto: String): String;

  end;
  {$METHODINFO OFF}

implementation

{ TUClasseServidor }

// Função gerada automaticamente usando Ctrl + Shift + C
function TUClasseServidor.mostrarTexto(Texto: String): String;
begin
  // Retornar alguma coisa
  Result := ' --- ' + Texto + ' --- ';
end;

end.
