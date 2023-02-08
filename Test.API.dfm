object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 420
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCEP: TLabel
    Left = 8
    Top = 35
    Width = 39
    Height = 23
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtCEP: TMaskEdit
    Left = 53
    Top = 40
    Width = 329
    Height = 21
    TabOrder = 0
    Text = ''
  end
  object edtLogradouro: TMaskEdit
    Left = 53
    Top = 144
    Width = 377
    Height = 21
    TabOrder = 1
    Text = ''
  end
  object edtComplemento: TMaskEdit
    Left = 53
    Top = 184
    Width = 337
    Height = 21
    TabOrder = 2
    Text = ''
  end
  object edtBairro: TMaskEdit
    Left = 53
    Top = 224
    Width = 297
    Height = 21
    TabOrder = 3
    Text = ''
  end
  object edtLocalidade: TMaskEdit
    Left = 53
    Top = 264
    Width = 297
    Height = 21
    TabOrder = 4
    Text = ''
  end
  object edtUF: TMaskEdit
    Left = 53
    Top = 307
    Width = 297
    Height = 21
    TabOrder = 5
    Text = ''
  end
  object edtDDD: TMaskEdit
    Left = 53
    Top = 350
    Width = 297
    Height = 21
    TabOrder = 6
    Text = ''
  end
  object btnPesquisa: TButton
    Left = 136
    Top = 80
    Width = 185
    Height = 41
    Caption = 'Pesquisar'
    TabOrder = 7
    OnClick = btnPesquisaClick
  end
  object btnExcpetion: TBitBtn
    Left = 408
    Top = 38
    Width = 121
    Height = 26
    Caption = 'Exception'
    TabOrder = 8
    OnClick = btnExcpetionClick
  end
  object btnWrite: TButton
    Left = 368
    Top = 372
    Width = 121
    Height = 35
    Caption = 'Escreva logradouro'
    TabOrder = 9
    OnClick = btnWriteClick
  end
  object btnLearn: TButton
    Left = 495
    Top = 372
    Width = 121
    Height = 35
    Caption = 'Ler logradouro'
    TabOrder = 10
    OnClick = btnLearnClick
  end
  object btnCase: TButton
    Left = 424
    Top = 334
    Width = 136
    Height = 32
    Caption = 'Switch-Case'
    TabOrder = 11
    OnClick = btnCaseClick
  end
  object btnOtherForm: TButton
    Left = 615
    Top = 248
    Width = 41
    Height = 25
    Caption = '->'
    TabOrder = 12
    OnClick = btnOtherFormClick
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://viacep.com.br'
    Params = <>
    HandleRedirects = True
    Left = 608
    Top = 32
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        name = 'request'
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 608
    Top = 80
  end
  object RESTResponse1: TRESTResponse
    Left = 608
    Top = 136
  end
end
