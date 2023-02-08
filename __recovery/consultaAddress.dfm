object frmConsultaAddress: TfrmConsultaAddress
  Left = 0
  Top = 0
  Caption = 'frmConsultaAddress'
  ClientHeight = 539
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblUF: TLabel
    Left = 85
    Top = 401
    Width = 25
    Height = 19
    Caption = 'UF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLogradouro: TLabel
    Left = 506
    Top = 401
    Width = 88
    Height = 19
    Caption = 'Logradouro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCidade: TLabel
    Left = 241
    Top = 401
    Width = 54
    Height = 19
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCep: TLabel
    Left = 413
    Top = 439
    Width = 137
    Height = 19
    Caption = 'CEP: n'#227'o infomado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtLogradouro: TMaskEdit
    Left = 600
    Top = 403
    Width = 297
    Height = 21
    TabOrder = 0
    Text = ''
    OnChange = edtLogradouroChange
  end
  object cmbUF: TComboBox
    Left = 116
    Top = 403
    Width = 97
    Height = 21
    TabOrder = 1
    Text = 'UF'
    OnChange = cmbUFChange
    Items.Strings = (
      'SC'
      'PR'
      'RS')
  end
  object cmbCidade: TComboBox
    Left = 301
    Top = 403
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 2
    OnChange = cmbCidadeChange
  end
  object btnBusca: TButton
    Left = 208
    Top = 480
    Width = 569
    Height = 41
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = btnBuscaClick
  end
  object lbtEnderecos: TListBox
    Left = 85
    Top = 48
    Width = 812
    Height = 329
    ItemHeight = 13
    TabOrder = 4
    OnClick = lbtEnderecosClick
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://viacep.com.br'
    Params = <>
    HandleRedirects = True
    Left = 16
    Top = 504
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 64
    Top = 504
  end
  object RESTResponse1: TRESTResponse
    Left = 112
    Top = 504
  end
end
