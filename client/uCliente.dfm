object fCliente: TfCliente
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 380
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 48
    Height = 19
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 77
    Height = 13
    Caption = 'Digite um texto:'
  end
  object Label3: TLabel
    Left = 33
    Top = 176
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object lblResultado: TLabel
    Left = 94
    Top = 176
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 8
    Top = 248
    Width = 97
    Height = 13
    Caption = 'Digite dois n'#250'meros:'
  end
  object Label5: TLabel
    Left = 53
    Top = 328
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object lblNumero: TLabel
    Left = 111
    Top = 328
    Width = 258
    Height = 13
  end
  object edtTexto: TEdit
    Left = 91
    Top = 93
    Width = 310
    Height = 21
    TabOrder = 0
  end
  object btnExecutar: TButton
    Left = 91
    Top = 120
    Width = 102
    Height = 25
    Caption = 'Executar'
    TabOrder = 1
    OnClick = btnExecutarClick
  end
  object edtNumero1: TEdit
    Left = 111
    Top = 245
    Width = 58
    Height = 21
    TabOrder = 2
  end
  object edtNumero2: TEdit
    Left = 175
    Top = 245
    Width = 58
    Height = 21
    TabOrder = 3
  end
  object btnSomar: TButton
    Left = 111
    Top = 272
    Width = 102
    Height = 25
    Caption = 'Somar'
    TabOrder = 4
    OnClick = btnSomarClick
  end
  object memTexto: TMemo
    Left = 440
    Top = 93
    Width = 564
    Height = 188
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object btnBuscarTxt: TButton
    Left = 440
    Top = 287
    Width = 102
    Height = 25
    Caption = 'Buscar Texto'
    TabOrder = 6
    OnClick = btnBuscarTxtClick
  end
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 344
    Top = 16
    UniqueId = '{0742B920-BF38-4C68-819B-50AA9F0896B2}'
  end
end
