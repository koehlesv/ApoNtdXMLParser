object frmNotfallTelefonNummern: TfrmNotfallTelefonNummern
  Left = 0
  Top = 0
  Caption = 'Notfall-Telefonnummern'
  ClientHeight = 335
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 335
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 560
      Height = 90
      Caption = 
        '112 Medizinische Notf'#228'lle'#13#10' '#13#10'116 117 '#196'rztlicher Bereitschaftsdi' +
        'enst'#13#10#13#10'F'#252'r H'#246'r- und/oder Sprachgesch'#228'digte Menschen steht auch ' +
        'die Option eines Notfallfaxes an die Nummer 112 bereit. Den notw' +
        'endigen Vordruck erhalten Sie unter https://t1p.de/notfallfax (g' +
        'gf. nicht mehr aktuell). '
      WordWrap = True
    end
    object Label2: TLabel
      Left = 32
      Top = 158
      Width = 534
      Height = 45
      Caption = 
        'Weitere Informationen z.B. unter: '#13#10'https://im.baden-wuerttember' +
        'g.de/de/sicherheit/wichtige-rufnummern-fuer-den-notfall'#13#10'Desweit' +
        'eren gibt es die Nora-App in bestimmten AppStores f'#252'r Smartphone' +
        's und Tess-Relay-Dienste.'
    end
    object Label3: TLabel
      Left = 32
      Top = 240
      Width = 560
      Height = 45
      Caption = 
        'Bitte beachten Sie, dass wir keine Garantie f'#252'r die Aktualit'#228't o' +
        'der die Korrektheit der Informationen '#252'bernehmen. Pr'#252'fen Sie die' +
        ' Informationen regelm'#228#223'ig auf Aktualit'#228't und informieren Sie sic' +
        'h '#252'ber '#196'nderungen, zum Beispiel in Ihrer Apotheke oder bei Ihrer' +
        '*m Haus'#228'rzt*in.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object btnNotfallfax: TButton
      Left = 32
      Top = 120
      Width = 137
      Height = 25
      Caption = '&Notfallfax-PDF'
      TabOrder = 0
      OnClick = btnNotfallfaxClick
    end
    object btnLinkBWNotfallNrn: TButton
      Left = 32
      Top = 209
      Width = 137
      Height = 25
      Caption = '&Weitere Informationen'
      TabOrder = 2
      OnClick = btnLinkBWNotfallNrnClick
    end
    object btnNotfallFax2: TButton
      Left = 184
      Top = 120
      Width = 137
      Height = 25
      Caption = '&Alle Notfallfax-Vorlagen'
      TabOrder = 1
      OnClick = btnNotfallFax2Click
    end
    object btnTessRelayDienste: TButton
      Left = 184
      Top = 209
      Width = 137
      Height = 25
      Caption = '&Tess-Relay-Dienste'
      TabOrder = 3
      OnClick = btnTessRelayDiensteClick
    end
    object btnSchliessen: TButton
      Left = 455
      Top = 291
      Width = 137
      Height = 25
      Cancel = True
      Caption = '&Schlie'#223'en'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 8
      ParentFont = False
      TabOrder = 4
      OnClick = btnSchliessenClick
    end
  end
end
