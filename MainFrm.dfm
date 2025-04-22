object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Apothekennotdienstplanparser'
  ClientHeight = 618
  ClientWidth = 1299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblApiUrl: TLabel
    Left = 43
    Top = 30
    Width = 47
    Height = 15
    Caption = 'Api-URL:'
  end
  object lblAusgabeMemo: TLabel
    Left = 673
    Top = 30
    Width = 49
    Height = 15
    Caption = 'Ausgabe:'
  end
  object lblXMLTyp: TLabel
    Left = 41
    Top = 155
    Width = 51
    Height = 15
    Caption = 'XML-Typ:'
  end
  object lblEinstellungen: TLabel
    Left = 18
    Top = 194
    Width = 74
    Height = 15
    Caption = 'Einstellungen:'
  end
  object btnDatenAusInternetLaden: TButton
    Left = 97
    Top = 405
    Width = 168
    Height = 25
    Caption = '&Lade Daten aus dem Internet'
    TabOrder = 11
    OnClick = btnDatenAusInternetLadenClick
  end
  object btnDatenReformatieren: TButton
    Left = 288
    Top = 405
    Width = 169
    Height = 25
    Caption = 'Daten &anzeigen'
    TabOrder = 12
    OnClick = btnDatenReformatierenClick
  end
  object memoAusgabe: TMemo
    Left = 737
    Top = 27
    Width = 548
    Height = 494
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 13
  end
  object btnDatenSpeichern: TButton
    Left = 737
    Top = 533
    Width = 121
    Height = 25
    Caption = 'Daten &speichern...'
    TabOrder = 14
    OnClick = btnDatenSpeichernClick
  end
  object cbXMLBehalten: TCheckBox
    Left = 96
    Top = 192
    Width = 529
    Height = 17
    Caption = 'XML-Datei behalten'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object rbDatenBuendeln: TRadioButton
    Left = 96
    Top = 215
    Width = 529
    Height = 17
    Caption = 'Ausgabedaten b'#252'ndeln'
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = rbDatenBuendelnClick
  end
  object rbDatenNichtBuendeln: TRadioButton
    Left = 96
    Top = 261
    Width = 529
    Height = 17
    Caption = 'Ausgabedaten nicht b'#252'ndeln'
    TabOrder = 5
    OnClick = rbDatenNichtBuendelnClick
  end
  object cbEinstellungenSpeichern: TCheckBox
    Left = 96
    Top = 332
    Width = 155
    Height = 17
    Caption = 'Einstellungen speichern'
    TabOrder = 9
    OnClick = cbEinstellungenSpeichernClick
  end
  object cbApiURLSpeichern: TCheckBox
    Left = 273
    Top = 332
    Width = 177
    Height = 17
    Caption = 'Api-URL ebenfalls speichern'
    Enabled = False
    TabOrder = 10
  end
  object cbDoppelteEntfernen: TCheckBox
    Left = 129
    Top = 238
    Width = 497
    Height = 17
    Caption = 'Doppelte Eintr'#228'ge zusdammenfassen (m'#246'glicherweise fehlerhaft)'
    TabOrder = 7
  end
  object cbKompakteDarstellung: TCheckBox
    Left = 96
    Top = 309
    Width = 529
    Height = 17
    Caption = 'Kompakte Darstellung'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object btnHilfe: TButton
    Left = 0
    Top = 0
    Width = 17
    Height = 25
    Caption = '?'
    TabOrder = 23
    OnClick = btnHilfeClick
  end
  object cbXMLTyp: TComboBox
    Left = 96
    Top = 152
    Width = 345
    Height = 23
    TabOrder = 1
    Items.Strings = (
      'Baden-W'#252'rttemberg'
      'Bayern'
      'Nordrhein-Westfalen'
      'Schleswig-Holstein'
      'Th'#252'ringen')
  end
  object btnErweiterteEinstellungen: TButton
    Left = 480
    Top = 151
    Width = 145
    Height = 25
    Caption = '&Erweiterte Einstellungen...'
    TabOrder = 2
    OnClick = btnErweiterteEinstellungenClick
  end
  object btnDatenDrucken: TButton
    Left = 880
    Top = 533
    Width = 121
    Height = 25
    Caption = 'Daten &drucken...'
    TabOrder = 15
    OnClick = btnDatenDruckenClick
  end
  object btnZeigeTelNrs: TButton
    Left = 96
    Top = 533
    Width = 169
    Height = 25
    Caption = '&Telefonnummern anzeigen...'
    TabOrder = 22
    OnClick = btnZeigeTelNrsClick
  end
  object btnProgrammBeenden: TButton
    Left = 1164
    Top = 533
    Width = 121
    Height = 25
    Cancel = True
    Caption = 'Programm &beenden'
    ModalResult = 8
    TabOrder = 17
    OnClick = btnProgrammBeendenClick
  end
  object rbAltenStilNacherzeugen: TRadioButton
    Left = 96
    Top = 284
    Width = 529
    Height = 17
    Caption = 
      'Urspr'#252'nglichen Stil nachempfinden (legt Apothekendatensicherungs' +
      'datei (ASD) an)'
    TabOrder = 6
    OnClick = rbDatenNichtBuendelnClick
  end
  object btnDatenKopieren: TButton
    Left = 1024
    Top = 533
    Width = 121
    Height = 25
    Caption = 'Daten &kopieren'
    TabOrder = 16
    OnClick = btnDatenKopierenClick
  end
  object memoApiUrl: TMemo
    Left = 96
    Top = 27
    Width = 529
    Height = 110
    TabOrder = 0
  end
  object btnMdbSpeichern: TButton
    Left = 737
    Top = 576
    Width = 121
    Height = 25
    Caption = 'ASD s&peichern...'
    TabOrder = 18
    Visible = False
    OnClick = btnMdbSpeichernClick
  end
  object btnMdbDrucken: TButton
    Left = 864
    Top = 576
    Width = 121
    Height = 25
    Caption = 'ASD dr&ucken...'
    TabOrder = 19
    Visible = False
    OnClick = btnMdbDruckenClick
  end
  object btnNurAposSpeichern: TButton
    Left = 997
    Top = 576
    Width = 141
    Height = 25
    Caption = 'Ap&otheken speichern...'
    TabOrder = 20
    Visible = False
    OnClick = btnNurAposSpeichernClick
  end
  object btnNurApoDrucken: TButton
    Left = 1144
    Top = 576
    Width = 141
    Height = 25
    Caption = 'Apotheke&n drucken...'
    TabOrder = 21
    Visible = False
    OnClick = btnNurApoDruckenClick
  end
  object ActionList1: TActionList
    Left = 1
    Top = 397
    object actHilfe: TAction
      Caption = 'Hilfe'
      ShortCut = 112
      OnExecute = actHilfeExecute
    end
    object actDatenSpeichern: TAction
      Caption = 'Daten speichern'
      ShortCut = 16467
      OnExecute = actDatenSpeichernExecute
    end
    object actDatenDrucken: TAction
      Caption = 'Daten drucken'
      ShortCut = 16464
      OnExecute = actDatenDruckenExecute
    end
  end
end
