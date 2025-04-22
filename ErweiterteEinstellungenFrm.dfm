object frmErweiterteEInstellungen: TfrmErweiterteEInstellungen
  Left = 0
  Top = 0
  Caption = 'Erweiterte Einstellungen'
  ClientHeight = 441
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object shpAllesLoeschenStatus: TShape
    Left = 256
    Top = 176
    Width = 26
    Height = 25
    Brush.Color = clGreen
  end
  object lblSonderfunktionenSchluesselwort: TLabel
    Left = 256
    Top = 211
    Width = 168
    Height = 15
    Caption = 'Sonderfunktionen Schl'#252'selwort:'
  end
  object rgKodierungDL: TRadioGroup
    Left = 24
    Top = 24
    Width = 185
    Height = 145
    Caption = 'Kodierung Daten laden:'
    ItemIndex = 3
    Items.Strings = (
      'ANSI'
      'ASCII'
      'UTF-7'
      'UTF-8'
      'Unicode'
      'Unicode (Big Endian)')
    TabOrder = 0
  end
  object rgKodierungDS: TRadioGroup
    Left = 24
    Top = 184
    Width = 185
    Height = 145
    Caption = 'Kodierung Daten speichern:'
    ItemIndex = 0
    Items.Strings = (
      'ANSI'
      'ASCII'
      'UTF-7'
      'UTF-8'
      'Unicode'
      'Unicode (Big Endian)')
    TabOrder = 1
  end
  object btnSpeichern: TButton
    Left = 24
    Top = 392
    Width = 121
    Height = 25
    Caption = '&Speichern'
    Default = True
    ModalResult = 1
    TabOrder = 7
  end
  object btnSchliessen: TButton
    Left = 312
    Top = 392
    Width = 121
    Height = 25
    Cancel = True
    Caption = '&Verwerfen'
    ModalResult = 8
    TabOrder = 8
  end
  object btnXMLDateiLoeschen: TButton
    Left = 256
    Top = 32
    Width = 177
    Height = 25
    Caption = '&XML-Datei l'#246'schen'
    TabOrder = 2
    OnClick = btnXMLDateiLoeschenClick
  end
  object btnEinstellungsdateiLoeschen: TButton
    Left = 256
    Top = 80
    Width = 177
    Height = 25
    Caption = '&Einstellungsdatei l'#246'schen'
    TabOrder = 3
    OnClick = btnEinstellungsdateiLoeschenClick
  end
  object btnAllesLoeschen: TButton
    Left = 288
    Top = 176
    Width = 145
    Height = 25
    Caption = '&Programm l'#246'schen'
    TabOrder = 5
    OnClick = btnAllesLoeschenClick
  end
  object edtSonderfunktionen: TEdit
    Left = 256
    Top = 232
    Width = 177
    Height = 23
    Hint = 'Sonderfunktionen Schl'#252'sselwort'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object btnApoSichDatLoeschen: TButton
    Left = 256
    Top = 128
    Width = 177
    Height = 25
    Caption = '&Apo-Sicherungsdatei l'#246'schen'
    TabOrder = 4
    OnClick = btnApoSichDatLoeschenClick
  end
  object ActionList1: TActionList
    Left = 16
    Top = 344
    object actZeigeFarbdialog: TAction
      Caption = 'Farbdialog anzeigen'
      ShortCut = 112
      OnExecute = actZeigeFarbdialogExecute
    end
  end
end
