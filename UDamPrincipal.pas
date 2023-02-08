unit UDamPrincipal;

{Gerado pelo Dam em: 06/02/2023 15:42}

interface

uses DamUnit;

procedure Info(Msg: String);
procedure Aviso(Msg: String);
procedure Erro(Msg: String);
function Confirma(Msg: String): Boolean;
procedure Raisar(Msg: String);
function CapturaErro: String;
procedure ExibeErro;

procedure Info;

implementation

uses Test.API;

procedure Info(Msg: String);
begin
    DamUnit.Info(Msg);
end;

procedure Aviso(Msg: String);
begin
    DamUnit.Aviso(Msg);
end;

procedure Erro(Msg: String);
begin
    DamUnit.Erro(Msg);
end;

function Confirma(Msg: String): Boolean;
begin
    Result := DamUnit.Confirma(Msg);
end;

procedure Raisar(Msg: String);
begin
    DamUnit.Raisar(Msg);
end;

function CapturaErro: String;
begin
    Result := DamUnit.CapturaErro;
end;

procedure ExibeErro;
begin
    DamUnit.ExibeErro;
end;

//-- Mensagens TDamMsg

procedure Info;
begin
  Form1.Info.Run;
end;

end.
