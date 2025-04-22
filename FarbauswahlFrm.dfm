object frmFarben: TfrmFarben
  Left = 0
  Top = 0
  Caption = 'Farbinformationsdialog'
  ClientHeight = 489
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 29
    Top = 87
    Width = 353
    Height = 15
    Caption = 
      '   clBlack           clMaroon           clGreen            clOli' +
      've              clNavy'
  end
  object Label2: TLabel
    Left = 29
    Top = 191
    Width = 346
    Height = 15
    Caption = 
      '  clPurple            clTeal                clGray              ' +
      ' clSilver             clRed'
  end
  object Label3: TLabel
    Left = 29
    Top = 295
    Width = 349
    Height = 15
    Caption = 
      '   clLime            clYellow             clBlue            clFu' +
      'chsia           clAqua'
  end
  object Label4: TLabel
    Left = 29
    Top = 399
    Width = 356
    Height = 15
    Caption = 
      '  clLtGrey          clDkGrey           clWhite            clXXXX' +
      'X           clYYYYY'
  end
  object Label5: TLabel
    Left = 28
    Top = 428
    Width = 300
    Height = 45
    Caption = 
      'clXX... ist eine Spezialfarbe, deren tats'#228'chlicher Kurzname hier' +
      ' nicht verraten wird, und clYY... ist ein Farbwechsel, dessen Sc' +
      'hl'#252'sselwort hier ebenfalls nicht verraten wird.'
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 401
    Height = 73
    BevelOuter = bvNone
    TabOrder = 0
    object Shape1: TShape
      AlignWithMargins = True
      Left = 328
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape2: TShape
      AlignWithMargins = True
      Left = 174
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clGreen
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 63
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape5: TShape
      AlignWithMargins = True
      Left = 97
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clMaroon
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 3
      ExplicitTop = -362
      ExplicitHeight = 435
    end
    object Shape3: TShape
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clBlack
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 29
      ExplicitTop = 12
      ExplicitHeight = 65
    end
    object Shape4: TShape
      AlignWithMargins = True
      Left = 251
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clOlive
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 112
    Width = 401
    Height = 73
    BevelOuter = bvNone
    TabOrder = 1
    object Shape6: TShape
      AlignWithMargins = True
      Left = 328
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clRed
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape7: TShape
      AlignWithMargins = True
      Left = 174
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clGray
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 63
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape8: TShape
      AlignWithMargins = True
      Left = 97
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clTeal
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 3
      ExplicitTop = -362
      ExplicitHeight = 435
    end
    object Shape9: TShape
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clPurple
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 29
      ExplicitTop = 12
      ExplicitHeight = 65
    end
    object Shape10: TShape
      AlignWithMargins = True
      Left = 251
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clSilver
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 216
    Width = 401
    Height = 73
    BevelOuter = bvNone
    TabOrder = 2
    object Shape11: TShape
      AlignWithMargins = True
      Left = 328
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clAqua
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape12: TShape
      AlignWithMargins = True
      Left = 174
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clBlue
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 63
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape13: TShape
      AlignWithMargins = True
      Left = 97
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clYellow
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 3
      ExplicitTop = -362
      ExplicitHeight = 435
    end
    object Shape14: TShape
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clLime
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 29
      ExplicitTop = 12
      ExplicitHeight = 65
    end
    object Shape15: TShape
      AlignWithMargins = True
      Left = 251
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clFuchsia
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 320
    Width = 401
    Height = 73
    BevelOuter = bvNone
    TabOrder = 3
    object Shape16: TShape
      AlignWithMargins = True
      Left = 328
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Style = bsDiagCross
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape17: TShape
      AlignWithMargins = True
      Left = 174
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 63
      ExplicitTop = -338
      ExplicitHeight = 435
    end
    object Shape18: TShape
      AlignWithMargins = True
      Left = 97
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clGray
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 3
      ExplicitTop = -362
      ExplicitHeight = 435
    end
    object Shape19: TShape
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = clSilver
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 29
      ExplicitTop = 12
      ExplicitHeight = 65
    end
    object Shape20: TShape
      AlignWithMargins = True
      Left = 251
      Top = 3
      Width = 54
      Height = 67
      Margins.Left = 20
      Align = alLeft
      Brush.Color = 3805458
      Pen.Style = psClear
      Shape = stSquare
      ExplicitLeft = 123
      ExplicitTop = -338
      ExplicitHeight = 435
    end
  end
  object btnClose: TButton
    Left = 340
    Top = 456
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Schlie'#223'en'
    Default = True
    ModalResult = 8
    TabOrder = 4
  end
end
