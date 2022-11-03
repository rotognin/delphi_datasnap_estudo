object fServidor: TfServidor
  Left = 0
  Top = 0
  Caption = 'Form Servidor'
  ClientHeight = 157
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 127
    Height = 19
    Caption = 'Servidor Rodando'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DSServer: TDSServer
    Left = 48
    Top = 80
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    Left = 128
    Top = 80
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    Server = DSServer
    Filters = <>
    Left = 232
    Top = 80
  end
  object DSHTTPService: TDSHTTPService
    HttpPort = 8089
    Server = DSServer
    Filters = <>
    Left = 352
    Top = 80
  end
end
