object frmMain: TfrmMain
  Left = 598
  Top = 165
  Width = 676
  Height = 306
  Caption = 'QR Code generator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object imgQR: TImage
    Left = 408
    Top = 14
    Width = 250
    Height = 250
    Stretch = True
  end
  object Label1: TLabel
    Left = 8
    Top = 184
    Width = 28
    Height = 13
    Caption = 'Width'
    Color = clBtnFace
    ParentColor = False
  end
  object Label2: TLabel
    Left = 64
    Top = 184
    Width = 31
    Height = 13
    Caption = 'Height'
    Color = clBtnFace
    ParentColor = False
  end
  object Label3: TLabel
    Left = 8
    Top = 14
    Width = 125
    Height = 13
    Caption = 'Enter text to be encoded.'
    Color = clBtnFace
    ParentColor = False
  end
  object Label4: TLabel
    Left = 8
    Top = 249
    Width = 159
    Height = 13
    Cursor = crHandPoint
    Caption = 'http://www.matthewhipkin.co.uk'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = Label4Click
  end
  object textText: TMemo
    Left = 8
    Top = 32
    Width = 392
    Height = 146
    TabOrder = 0
  end
  object btnGenerate: TButton
    Left = 325
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 1
    OnClick = btnGenerateClick
  end
  object btnSave: TButton
    Left = 240
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object editWidth: TSpinEdit
    Left = 8
    Top = 200
    Width = 50
    Height = 22
    MaxValue = 1000
    MinValue = 0
    TabOrder = 3
    Value = 250
  end
  object editHeight: TSpinEdit
    Left = 64
    Top = 200
    Width = 50
    Height = 22
    MaxValue = 1000
    MinValue = 0
    TabOrder = 4
    Value = 250
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'PNG Image (*.png)|*.png'
    Left = 178
    Top = 147
  end
  object XPManifest1: TXPManifest
    Left = 488
    Top = 80
  end
end
