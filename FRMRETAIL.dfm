object FRRETAIL: TFRRETAIL
  Left = 0
  Top = 0
  Caption = 'FRRETAIL'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RETAIL: TMyConnection
    Database = 'bellagio'
    Username = 'userfin1'
    Server = '192.168.3.2'
    Connected = True
    Left = 24
    EncryptedPassword = '8AFF8CFF9AFF8DFF99FF96FF91FFCEFF'
  end
  object kmbs2: TMyConnection
    Database = 'kmbs20test'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 192
  end
  object hero: TMyQuery
    Connection = kmbs2
    Left = 192
    Top = 96
  end
  object herod: TMyQuery
    Connection = kmbs2
    Left = 192
    Top = 144
  end
  object HEROX: TMyQuery
    Connection = kmbs2
    Left = 192
    Top = 48
  end
  object comd: TMyQuery
    Connection = RETAIL
    Left = 24
    Top = 48
  end
  object COM: TMyQuery
    Connection = RETAIL
    Left = 24
    Top = 96
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 112
    Top = 80
  end
end
