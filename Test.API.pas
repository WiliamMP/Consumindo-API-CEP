unit Test.API;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls,
  Vcl.Mask, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  RzTabs, Vcl.Buttons, Vcl.ExtCtrls, RzPanel, DamUnit;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    edtCEP: TMaskEdit;
    lblCEP: TLabel;
    edtLogradouro: TMaskEdit;
    edtComplemento: TMaskEdit;
    edtBairro: TMaskEdit;
    edtLocalidade: TMaskEdit;
    edtUF: TMaskEdit;
    edtDDD: TMaskEdit;
    btnPesquisa: TButton;
    btnExcpetion: TBitBtn;
    btnWrite: TButton;
    btnLearn: TButton;
    btnCase: TButton;
    btnOtherForm: TButton;

    procedure btnPesquisaClick(Sender: TObject);
    procedure btnExcpetionClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure btnLearnClick(Sender: TObject);
    procedure btnCaseClick(Sender: TObject);
    procedure btnOtherFormClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses consultaAddress;

{$R *.dfm}


procedure TForm1.btnLearnClick(Sender: TObject);
var

  myFile : TextFile;
  text : string;

begin
  AssignFile(myFile, 'Test.txt');


    Reset(myFile);

    try
      while not Eof(myFile) do
      begin
        Readln(MyFile, text);
        ShowMessage(text);
      end;
    finally
      // Close the file
      CloseFile(myFile);
    end;
end;

procedure TForm1.btnOtherFormClick(Sender: TObject);
begin
  try
    frmConsultaAddress.ShowModal;
  finally

  end;
end;

procedure TForm1.btnPesquisaClick(Sender: TObject);

var
  strJSON : string;
  jsonObject : TJSONObject;
  logradouro : string;
  UF : string;
  Complemento : string;
  Bairro : string;
  Localidade : string;
  DDD : string;

begin

  if (edtCEP.Text = '') then
    begin
      ShowMessage('Campo de CEP v�zio');
      exit();
    end;

      RESTRequest1.Resource := '/ws/' + edtCEP.Text + '/json';
      RESTRequest1.Execute;

      strJSON := RESTResponse1.Content;

  try

    jsonObject :=TJSONObject.ParseJSONValue(strJSON) as TJSONObject;

    logradouro := jsonObject.GetValue<string>('logradouro');
    uf := jsonObject.GetValue<string>('uf');
    complemento := jsonObject.GetValue<string>('complemento');
    bairro := jsonObject.GetValue<string>('bairro');
    localidade := jsonObject.GetValue<string>('localidade');
    ddd := jsonObject.GetValue<string>('ddd');


    edtLogradouro.Text := logradouro;
    edtUF.Text := UF;
    edtComplemento.Text := complemento;
    edtBairro.Text := Bairro;
    edtLocalidade.Text := Localidade;
    edtDDD.Text := DDD;


  finally
    jsonObject.Free;
  end;

end;

procedure TForm1.btnWriteClick(Sender: TObject);
var

   myFile : TextFile;

begin
      // falando qual doc acessar
      AssignFile(myFile, 'Test.txt');

      // abrir para leitura
      Reset(myFile);

      try
      // enquanto n for o fim do doc faz
        while not Eof(myFile) do
        begin
          // reescrever se estiver com ponteiro no final
          Rewrite(myFile);
          // escrever no doc 'hello world'
          Writeln(myFile, edtLogradouro.Text);
        end;
      finally
        // Finalmente fecha o documento
        CloseFile(myFile);
      end;
end;

procedure TForm1.btnCaseClick(Sender: TObject);
var

 variavel : Integer;

begin

variavel := 3;

Case variavel of
    -12 : ShowMessage('Doze negativo');
    1 : ShowMessage('Um');
    2..5 : ShowMessage('Entre 2 e 5');
    else ShowMessage('Qualquer outro valor');
  end;
end;

procedure TForm1.btnExcpetionClick(Sender: TObject);
var
   number1, number0 : Integer;
 begin

   try
     number0 := 0;
     number1 := 1;
     number1 := number1 div number0;
     ShowMessage('1 / 0 = '+IntToStr(number1));
   except
     on E : Exception do
     begin
       ShowMessage('Exception class name = '+E.ClassName);
       ShowMessage('Exception message = '+E.Message);
     end;
   end;

 end;
end.
