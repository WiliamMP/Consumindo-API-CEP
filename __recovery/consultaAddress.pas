unit consultaAddress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, System.StrUtils,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  RzTabs, Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit, Vcl.ComCtrls, RzLstBox,
  Vcl.CheckLst, ListBoxObj;

type
  TfrmConsultaAddress = class(TForm)
    lblUF: TLabel;
    lblLogradouro: TLabel;
    lblCidade: TLabel;
    edtLogradouro: TMaskEdit;
    cmbUF: TComboBox;
    cmbCidade: TComboBox;
    btnBusca: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    lbtEnderecos: TListBox;
    lblCep: TLabel;
    procedure cmbUFChange(Sender: TObject);
    procedure cmbCidadeChange(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtLogradouroChange(Sender: TObject);
    procedure lbtEnderecosClick(Sender: TObject);
  private
    { Private declarations }
  public
    consultado : Boolean;
    ansResource : string;
  end;

var
  frmConsultaAddress: TfrmConsultaAddress;

  arrJson : TJSONArray;
  jsonAPI : string;
  subObjJson : TJSONObject;

implementation

{$R *.dfm}


procedure TfrmConsultaAddress.btnBuscaClick(Sender: TObject);
var

  logradouro : string;
  i : Integer;
  strJson : string;

  valLog, valBair, valComp : TJSONValue;

begin
   lbtEnderecos.Clear;
      logradouro := edtLogradouro.Text;
      if not consultado then
      begin
          logradouro := StringReplace(logradouro, ' ','+',[rfReplaceAll, rfIgnoreCase]);


          RESTRequest1.Resource := RESTRequest1.Resource + logradouro + '/json';
          RESTRequest1.Execute;
          RESTRequest1.Resource := StringReplace(RESTRequest1.Resource, logradouro + '/json', '',[rfReplaceAll, rfIgnoreCase]);
          consultado := True;


          jsonAPI := RESTResponse1.Content;
          arrJson := TJSONObject.ParseJSONValue(jsonAPI) as TJSONArray;

      try
        for i := 0 to arrJson.Size - 1 do
            begin
                subObjJson := (arrJson.Get(i) as TJSONObject);
                valLog := subObjJson.GetValue<TJSONValue>('logradouro') as TJSONValue;
                valBair := subObjJson.GetValue<TJSONValue>('bairro') as TJSONValue;
                valComp := subObjJson.GetValue<TJSONValue>('complemento') as TJSONValue;

              lbtEnderecos.Items.Add(valLog.Value+ ' ' + valComp.Value +',' + valBair.Value);

              lbtEnderecos.ItemIndex := lbtEnderecos.Items.IndexOf(valLog.Value+ ' ' + valComp.Value +',' + valBair.Value);
              subObjJson.Free;
            end;
      finally
           subObjJson.Free;
      end;
   end;
end;

procedure TfrmConsultaAddress.cmbCidadeChange(Sender: TObject);
var

  City : string;

begin

City := cmbCidade.Text;
consultado := False;
lbtEnderecos.Clear;

if not City.IsEmpty then

  begin
    case AnsiIndexStr(City, ['Florianopolis','Curitiba','Porto Alegre']) of

    0:

    begin
    RESTRequest1.Resource := '';
    RESTRequest1.Resource := RESTRequest1.Resource + 'ws/SC/Florianopolis/';
    ansResource := RESTRequest1.Resource;
    end;

    1:

    begin;
    RESTRequest1.Resource := '';
    RESTRequest1.Resource := RESTRequest1.Resource + 'ws/PR/Curitiba/';
    ansResource := RESTRequest1.Resource;
    end;

    2:

    begin
    RESTRequest1.Resource := '';
    RESTRequest1.Resource := RESTRequest1.Resource + 'ws/RS/Porto Alegre/';
    ansResource := RESTRequest1.Resource;
    end;

    end;


  end;
end;

procedure TfrmConsultaAddress.cmbUFChange(Sender: TObject);
var

  UF : string;
                                                                             begin

  UF := cmbUF.Text;
  RESTRequest1.Resource := '';
  consultado := False;
  lbtEnderecos.Clear;

  if not UF.IsEmpty then
  begin
    cmbCidade.Enabled := True;
    case AnsiIndexStr(UF, ['SC','PR','RS']) of

    0:

    begin
    cmbCidade.Clear; // limpar para colocar novos

    cmbCidade.Items.Add('Florianopolis');;
    end;

    1:

    begin
    cmbCidade.Clear; // limpar para colocar novos

    cmbCidade.Items.Add('Curitiba');
    end;

    2:

    begin
    cmbCidade.Clear; // limpar para colocar novos
    RESTRequest1.ClearBody;

    cmbCidade.Items.Add('Porto Alegre');
    end;

    end;
  end;
end;

procedure TfrmConsultaAddress.edtLogradouroChange(Sender: TObject);
begin
  consultado := False;
end;

procedure TfrmConsultaAddress.lbtEnderecosClick(Sender: TObject);
var

 index : Integer;
 sInfo : string;
 jValue : TJSONValue;

begin
  jsonAPI := RESTResponse1.Content;
  arrJson := TJSONObject.ParseJSONValue(jsonAPI) as TJSONArray;

  index := lbtEnderecos.ItemIndex;

  sInfo := lbtEnderecos.Items[index];

  subObjJson := (arrJson.Get(index) as TJSONObject);
  jValue := subObjJson.GetValue<TJSONValue>('cep') as TJSONValue;
  //  ShowMessage(jValue.Value);


  lblCep.Caption := 'CEP: ' + jValue.Value;

  arrJson.Free;


end;

end.
