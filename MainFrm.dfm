object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Apothekennotdienstplanparser'
  ClientHeight = 618
  ClientWidth = 1300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 618
    Align = alLeft
    TabOrder = 1
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
    object lblApiUrl: TLabel
      Left = 43
      Top = 30
      Width = 47
      Height = 15
      Caption = 'Api-URL:'
    end
    object rbAltenStilNacherzeugen: TRadioButton
      Left = 96
      Top = 284
      Width = 529
      Height = 17
      Caption = 
        'Urspr'#252'nglichen Stil nachempfinden (legt Apothekendatensicherungs' +
        'datei (ASD) an)'
      TabOrder = 0
      OnClick = rbDatenNichtBuendelnClick
    end
    object rbDatenBuendeln: TRadioButton
      Left = 96
      Top = 215
      Width = 529
      Height = 17
      Caption = 'Ausgabedaten b'#252'ndeln'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbDatenBuendelnClick
    end
    object rbDatenNichtBuendeln: TRadioButton
      Left = 96
      Top = 261
      Width = 529
      Height = 17
      Caption = 'Ausgabedaten nicht b'#252'ndeln'
      TabOrder = 2
      OnClick = rbDatenNichtBuendelnClick
    end
    object memoApiUrl: TMemo
      Left = 96
      Top = 27
      Width = 529
      Height = 110
      TabOrder = 3
    end
    object cbApiURLSpeichern: TCheckBox
      Left = 273
      Top = 332
      Width = 177
      Height = 17
      Caption = 'Api-URL ebenfalls speichern'
      Enabled = False
      TabOrder = 4
    end
    object cbDoppelteEntfernen: TCheckBox
      Left = 129
      Top = 238
      Width = 497
      Height = 17
      Caption = 'Doppelte Eintr'#228'ge zusammenfassen (m'#246'glicherweise fehlerhaft)'
      TabOrder = 5
    end
    object cbEinstellungenSpeichern: TCheckBox
      Left = 96
      Top = 332
      Width = 155
      Height = 17
      Caption = 'Einstellungen speichern'
      TabOrder = 6
      OnClick = cbEinstellungenSpeichernClick
    end
    object cbKompakteDarstellung: TCheckBox
      Left = 96
      Top = 309
      Width = 529
      Height = 17
      Caption = 'Kompakte Darstellung'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cbXMLBehalten: TCheckBox
      Left = 96
      Top = 192
      Width = 529
      Height = 17
      Caption = 'XML-Datei behalten'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cbXMLTyp: TComboBox
      Left = 96
      Top = 152
      Width = 345
      Height = 23
      TabOrder = 9
      Items.Strings = (
        'Baden-W'#252'rttemberg'
        'Bayern'
        'Nordrhein-Westfalen'
        'Schleswig-Holstein'
        'Th'#252'ringen')
    end
    object btnZeigeTelNrs: TButton
      Left = 96
      Top = 533
      Width = 169
      Height = 25
      Caption = '&Telefonnummern anzeigen...'
      TabOrder = 10
      OnClick = btnZeigeTelNrsClick
    end
    object btnHilfe: TButton
      Left = 0
      Top = 0
      Width = 17
      Height = 25
      Caption = '?'
      TabOrder = 11
      OnClick = btnHilfeClick
    end
    object btnErweiterteEinstellungen: TButton
      Left = 480
      Top = 151
      Width = 145
      Height = 25
      Caption = '&Erweiterte Einstellungen...'
      TabOrder = 12
      OnClick = btnErweiterteEinstellungenClick
    end
    object btnDatenReformatieren: TButton
      Left = 288
      Top = 405
      Width = 169
      Height = 25
      Caption = 'Daten &anzeigen'
      TabOrder = 13
      OnClick = btnDatenReformatierenClick
    end
    object btnDatenAusInternetLaden: TButton
      Left = 97
      Top = 405
      Width = 168
      Height = 25
      Caption = '&Lade Daten aus dem Internet'
      TabOrder = 14
      OnClick = btnDatenAusInternetLadenClick
    end
  end
  object Panel1: TPanel
    Left = 645
    Top = 0
    Width = 655
    Height = 618
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 653
      Height = 534
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lblAusgabeMemo: TLabel
        AlignWithMargins = True
        Left = 20
        Top = 30
        Width = 49
        Height = 501
        Margins.Left = 20
        Margins.Top = 30
        Align = alLeft
        Caption = 'Ausgabe:'
        ExplicitHeight = 15
      end
      object memoAusgabe: TMemo
        AlignWithMargins = True
        Left = 75
        Top = 20
        Width = 568
        Height = 494
        Margins.Top = 20
        Margins.Right = 10
        Margins.Bottom = 20
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 576
      Width = 653
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnDatenDrucken: TButton
        AlignWithMargins = True
        Left = 376
        Top = 7
        Width = 121
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Caption = 'Daten &drucken...'
        TabOrder = 2
        OnClick = btnDatenDruckenClick
      end
      object btnMdbDrucken: TButton
        AlignWithMargins = True
        Left = 237
        Top = 7
        Width = 119
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Caption = 'ASD dr&ucken...'
        TabOrder = 4
        Visible = False
        OnClick = btnMdbDruckenClick
      end
      object btnNurApoDrucken: TButton
        AlignWithMargins = True
        Left = 75
        Top = 7
        Width = 142
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Caption = 'Apotheke&n drucken...'
        TabOrder = 1
        Visible = False
        OnClick = btnNurApoDruckenClick
      end
      object btnProgrammBeenden: TButton
        AlignWithMargins = True
        Left = 517
        Top = 7
        Width = 125
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Cancel = True
        Caption = 'Programm &beenden'
        ModalResult = 8
        TabOrder = 3
        OnClick = btnProgrammBeendenClick
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 65
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 535
      Width = 653
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnDatenKopieren: TButton
        AlignWithMargins = True
        Left = 518
        Top = 7
        Width = 125
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Caption = 'Daten &kopieren'
        TabOrder = 2
        OnClick = btnDatenKopierenClick
      end
      object btnDatenSpeichern: TButton
        AlignWithMargins = True
        Left = 377
        Top = 7
        Width = 121
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Caption = 'Daten &speichern...'
        TabOrder = 1
        OnClick = btnDatenSpeichernClick
      end
      object btnMdbSpeichern: TButton
        AlignWithMargins = True
        Left = 236
        Top = 7
        Width = 121
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Caption = 'ASD s&peichern...'
        TabOrder = 3
        Visible = False
        OnClick = btnMdbSpeichernClick
      end
      object btnNurAposSpeichern: TButton
        AlignWithMargins = True
        Left = 75
        Top = 7
        Width = 141
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 9
        Align = alLeft
        Caption = 'Ap&otheken speichern...'
        TabOrder = 0
        Visible = False
        OnClick = btnNurAposSpeichernClick
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 65
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 4
      end
    end
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
