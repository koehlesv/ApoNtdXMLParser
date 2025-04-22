unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList;

type
  TXMLType = (xmltUnd, xmltBWU, xmltBay, xmltNRW, xmltSWH, xmltTHU);

  TErwEinstObj = class(TObject)
  private
    FKodierungDL: TEncoding;
    FKodierungDS: TEncoding;
  public
    property KodierungDL: TEncoding read FKodierungDL write FKodierungDL;
    property KodierungDS: TEncoding read FKodierungDS write FKodierungDS;
  end;

  TfrmMain = class(TForm)
    btnDatenAusInternetLaden: TButton;
    btnDatenReformatieren: TButton;
    memoAusgabe: TMemo;
    btnDatenSpeichern: TButton;
    cbXMLBehalten: TCheckBox;
    rbDatenBuendeln: TRadioButton;
    rbDatenNichtBuendeln: TRadioButton;
    lblApiUrl: TLabel;
    lblAusgabeMemo: TLabel;
    cbEinstellungenSpeichern: TCheckBox;
    cbApiURLSpeichern: TCheckBox;
    cbDoppelteEntfernen: TCheckBox;
    cbKompakteDarstellung: TCheckBox;
    btnHilfe: TButton;
    ActionList1: TActionList;
    actHilfe: TAction;
    cbXMLTyp: TComboBox;
    lblXMLTyp: TLabel;
    lblEinstellungen: TLabel;
    btnErweiterteEinstellungen: TButton;
    btnDatenDrucken: TButton;
    btnZeigeTelNrs: TButton;
    btnProgrammBeenden: TButton;
    actDatenSpeichern: TAction;
    actDatenDrucken: TAction;
    rbAltenStilNacherzeugen: TRadioButton;
    btnDatenKopieren: TButton;
    memoApiUrl: TMemo;
    btnMdbSpeichern: TButton;
    btnMdbDrucken: TButton;
    btnNurAposSpeichern: TButton;
    btnNurApoDrucken: TButton;
    procedure btnDatenAusInternetLadenClick(Sender: TObject);
    procedure btnDatenReformatierenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbEinstellungenSpeichernClick(Sender: TObject);
    procedure btnDatenSpeichernClick(Sender: TObject);
    procedure rbDatenNichtBuendelnClick(Sender: TObject);
    procedure rbDatenBuendelnClick(Sender: TObject);
    procedure actHilfeExecute(Sender: TObject);
    procedure btnHilfeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnErweiterteEinstellungenClick(Sender: TObject);
    procedure btnZeigeTelNrsClick(Sender: TObject);
    procedure btnProgrammBeendenClick(Sender: TObject);
    procedure btnDatenDruckenClick(Sender: TObject);
    procedure DatenSpeichern(AList: TStrings);
    procedure DatenDrucken(AList: TStrings; AColour: TColor);
    procedure actDatenSpeichernExecute(Sender: TObject);
    procedure actDatenDruckenExecute(Sender: TObject);
    procedure btnDatenKopierenClick(Sender: TObject);
    procedure btnMdbSpeichernClick(Sender: TObject);
    procedure btnMdbDruckenClick(Sender: TObject);
    procedure btnNurAposSpeichernClick(Sender: TObject);
    procedure btnNurApoDruckenClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FErwEinstObj: TErwEinstObj;
    FAposList: TStringList; //Nur gesetzt, falls "alten Modus nachstellen" gesetzt ist, und anschließend auf "Daten anzeigen" geklickt wurde.
    FAllesLoeschen: Boolean;
    FSonderfktSchluesselw: string;
    procedure ReformatData();
    procedure ZeigeHilfeDialog();
    function LizenzdateiHatKorrekteVersion(const APath: string): Boolean;
    function GetSelectedXMLTType(): TXMLType;
    procedure SetXMLTypToCombobox(AXMLTyp: TXMLType);
    procedure SetXMLStringToCombobox(const AXMLTyp: string);
    function GetStartSymbol(AXMLTyp: TXMLType): string;
    function GetStopSymbol(AXMLTyp: TXMLType): string;
    procedure SaveByRichEdit(AColour: TColor; AList: TStrings);
    procedure SaveByRichEditRainbowMode(AList: TStrings);
    function SpeichernMitSonderfunktionFallsUebergeben(AList: TStrings): Boolean; //True, genau dann, wenn eine Sonderfunktion fürs speichern genutzt wurde.
    function MergeMDBFileAndGivenList_Create(AList: TStringList): TStringList;
    procedure GetNummerUndBuchstabenVonApotheke(APersistenteApothekenListe: TStringList; const AApotheke: string; out ANummer: Integer; out ABuchstaben: string);
    function GetColour(const AText: string): TColor;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public-Deklarationen }
  end;

  TXMLParser = class(TObject)
  private
    class function ReformatBullshitDate(const ADate: string; AXMLTyp: TXMLType): string;
  public
    class procedure GleicheApothekenZusammenfassen(var ADaten, AApotheken: TStringList);
    class function LCreateStringList(AEncoding: TEncoding): TStringList;
    class function CreateReformatedXMLType1(AXML: TStringList; const AStartSymbol, AStopSymbol: string): TStringList;
    class function ParseCurrentEntry(AXML: TSTringList; AIndex: Integer; ADatumUnterdruecken: Boolean; const ASeparator: string;
      ANurDatum: Boolean; AXMLTyp: TXMLType): string;
    class function ParseCurrentEntryAsShortDate(AXML: TSTringList; AIndex: Integer; const ASeparator: string; AXMLTyp: TXMLType;
      out AMonat: Integer; out AUhrzeitVon: string): string;
    class function GetMonat(AMonat: Integer): string;
    class function GetTokenValue(const ALine, AStartToken, AEndToken: string; AXMLTyp: TXMLType; AIstDatum: Boolean = False;
      AAddLeadingSpaceIfNotEmpty: Boolean = False): string;
  end;

  TSettingsObj = class(TObject)
  private
    FEinstellungenSpeichern: Boolean;
    FApiUrlSpeichern: Boolean;
    FAusgabedatenBuendeln: Boolean;
    FXMLDateiBehalten: Boolean;
    FDoppelteEintraegeZusammenfassen: Boolean;
    FAltenModusNachstellen: Boolean;
    FKompakt: Boolean;
    FXMLTyp: TXMLType;
    FApiUrl: string;
    FKodierungDS: TEncoding;
    FKodierungDL: TEncoding;
    function GetApiUrlSpeichern: Boolean;
    function GetDoppelteEintraegeZusammenfassen: Boolean;
  public
    constructor Create(); reintroduce; overload;
    constructor Create(AEinstellungenSpeichern, AApiUrlSpeichern, AXMLDateienBehalten, AAusgabedatenBuendeln, ADoppelteEintraegeZusammenfassen, AAltenModusNachstellen, AKompakt: Boolean;
      AXMLTyp: TXMLType; AKodierungDL, AKodierungDS: TEncoding); overload;
    property EinstellungenSpeichern: Boolean read FEinstellungenSpeichern write FEinstellungenSpeichern;
    property ApiUrlSpeichern: Boolean read GetApiUrlSpeichern write FApiUrlSpeichern;
    property XMLDateiBehalten: Boolean read FXMLDateiBehalten write FXMLDateiBehalten;
    property AltenModusNachstellen: Boolean read FAltenModusNachstellen write FAltenModusNachstellen; //Um alte Eínstellungsdateien weiterhin zu unterstützen.
    property AusgabedatenBuendeln: Boolean read FAusgabedatenBuendeln write FAusgabedatenBuendeln;
    property DoppelteEintraegeZusammenfassen: Boolean read GetDoppelteEintraegeZusammenfassen write FDoppelteEintraegeZusammenfassen;
    property Kompakt: Boolean read FKompakt write FKompakt;
    property XMLTyp: TXMLType read FXMLTyp write FXMLTyp;
    property ApiUrl: string read FApiUrl write FApiUrl;
    property KodierungDL: TEncoding read FKodierungDL write FKodierungDL;
    property KodierungDS: TEncoding read FKodierungDS write FKodierungDS;
  end;

  TSettingsManager = class(TObject)
  private
    const
      cEinstSpeichernText = 'EinstellungenSpeichern';
      cApiUrlSpeichernText = 'ApiUrlSpeichern';
      cAusgDatBuendelnText = 'AusgabedatenBuendeln';
      cAltenModusNachstellen = 'AltenModusNachstellen';
      cXMLDateiBehaltenText = 'XMLDateiBehalten';
      cDoppelteEintrZusfasText = 'DoppelteEintraegeZusammenfassen';
      cKompaktText = 'KompakteDarstellung';
      cXMLTyp = 'XMLTyp';
      cApiUrl = 'ApiURL';
      cKodierungDL = 'KodierungDatenLaden';
      cKodierungDS = 'KodierungDatenSpeichern';
    class function CreateDefaultSettingsObj(): TSettingsObj;
  public
    class function GetXMLTypeForString(const AXMLText: string): TXMLType;
    class function GetNameForXMLTyp(AXMLTyp: TXMLType): string;
    class function GetKodierungForString(const AKodierung: string): TEncoding;
    class function GetNameForKodierung(AKodierung: TEncoding): string;
    class function LoadSettings(const AFilePath: string): TSettingsObj;
    class procedure SaveSettings(const AFilePath: string; ASettingsObj: TSettingsObj);
  end;

  TKodierungsHelfer = class(TObject)
  public
    class function CreateStringListNewEncoding(AAlteKodierung, ANeueKodierung: TEncoding;
      AStringList: TStrings): TStringList;
  end;

const
  cNameAusgabedatei = 'Apothekennotdienstplan.txt';
  cNameLizenzDatei = 'skApothekennotdienstplan.lizenzakzeptiert';
  cLizenzVersion = 'V1';

  cXMLTypBwu = 'Baden-Württemberg';
  cXMLTypBay = 'Bayern';
  cXMLTypNrw = 'Nordrhein-Westfalen';
  cXMLTypSwh = 'Schleswig-Holstein';
  cXMLTypThu = 'Thüringen';

  cKodierungAscii = 'ASCII';
  cKodierungAnsi = 'ANSI';
  cKodierungUTF7 = 'UTF-7';
  cKodierungUTF8 = 'UTF-8';
  cKodierungUnicode = 'Unicode';
  cKodierungBEUnicode = 'BEUnicode';

  cHinweisSignal = '||$$HINWEIS$$||';

var
  frmMain: TfrmMain;

implementation

uses
  URLMon, System.UITypes, LizenzdialogFrm, ErweiterteEinstellungenFrm, VCL.Printers, ShellApi,
  TelefonnumernAnzeigenFrm, StrUtils, ComCtrls, DateUtils;

{$R *.dfm}

procedure TfrmMain.actDatenDruckenExecute(Sender: TObject);
begin
  DatenDrucken(memoAusgabe.Lines, GetColour(FSonderfktSchluesselw));
end;

procedure TfrmMain.actDatenSpeichernExecute(Sender: TObject);
begin
  DatenSpeichern(memoAusgabe.Lines);
end;

procedure TfrmMain.actHilfeExecute(Sender: TObject);
begin
  ZeigeHilfeDialog();
end;

procedure TfrmMain.btnDatenAusInternetLadenClick(Sender: TObject);
var
  Url : String;
  ErgebnisGueltig: HRESULT;
begin
  Url := memoApiUrl.Text;
  if Url = '' then
  begin
     MessageDlg('Die Api-URL darf nicht leer sein. Gegebenenfalls in der Hilfe nachlesen, wie eine Api-URL aufgebaut sein muss.', TMsgDlgType.mtError, [TMsgDlgBtn.mbClose], 0);
     Exit;
  end;
  if GetSelectedXMLTType() = xmltUnd then
  begin
    MessageDlg('Bitte den verwendeten XML-Typ auswählen.', TMsgDlgType.mtError, [TMsgDlgBtn.mbClose], 0);
    Exit;
  end;
  {if GetSelectedXMLTType() = xmltNRW then
  begin
    MessageDlg('Bitte laden Sie die Datei direkt von der Apotheker*innenkammer Nordrhein-Westfalen herunter und speichern Sie diese als "Apothekennotdienstplan.xml"' +
      'im selben Verzeichnis wie dieses Programm ab; ein Direktdownload ist leider nicht möglich.', TMsgDlgType.mtError, [TMsgDlgBtn.mbClose], 0);
    Exit;
  end;}
  if ((GetSelectedXMLTType() in [xmltBWU, xmltBay]) and (not Url.StartsWith('https://notdienst.sberg.net/', True)) and (not Url.StartsWith('http://notdienst.sberg.net/', True))) or
    ((GetSelectedXMLTType() = xmltNRW) and (not Url.StartsWith('https://www.aknr.de/', True)) and (not Url.StartsWith('http://www.aknr.de/', True))) or
    ((GetSelectedXMLTType() = xmltSWH) and (not Url.StartsWith('https://www.aksh-service.de/', True)) and (not Url.StartsWith('http://www.aksh-service.de/', True))) or
    ((GetSelectedXMLTType() = xmltTHU) and (not Url.StartsWith('https://www.lakt.de/', True)) and (not Url.StartsWith('http://www.lakt.de/', True))) then
  begin
     MessageDlg('Die Api-URL verlinkt auf eine nicht unterstütze Webseite. Gegebenenfalls in der Hilfe nachlesen, wie eine Api-URL aufgebaut sein muss. Die Url beginnt mit http:// oder https:// .' +
       sLineBreak + 'Gegebenenfalls passt der Webseitentyp auch nicht zum ausgewählten XML-Format.', TMsgDlgType.mtError, [TMsgDlgBtn.mbClose], 0);
     Exit;
  end;
  if FileExists(cNameXMLDatei) then
  begin
    if MessageDlg('Die Zieldatei existiert bereits und wird überschrieben. Soll diese überschrieben werden?', TMsgDlgType.mtWarning, [mbYes, mbCancel], 0) <> mrYes then
      Exit;
  end;
  ErgebnisGueltig := UrlDownloadToFile(nil, PChar(Url), PChar(cNameXMLDatei), 0, nil);
  case ErgebnisGueltig of
    S_OK: ; //Erwünschter Fall;
    E_OUTOFMEMORY: MessageDlg('Es steht nicht genügend Speicher zur Verfügung, um die angeforderten Daten herunterzuladen.', TMsgDlgType.mtError, [mbClose], 0);
    INET_E_DOWNLOAD_FAILURE: MessageDlg('Downloadfehler. Bitte prüfen Sie Ihre Internetverbindung, Ihre Firewall und die angegebene URL.', TMsgDlgType.mtError, [mbClose], 0);
  end;

end;

procedure TfrmMain.btnDatenDruckenClick(Sender: TObject);
begin
  DatenDrucken(memoAusgabe.Lines, GetColour(FSonderfktSchluesselw));
end;

procedure TfrmMain.btnDatenKopierenClick(Sender: TObject);
begin
  memoAusgabe.SelectAll;
  memoAusgabe.CopyToClipboard;
end;

{ TXMLParser }

class function TXMLParser.CreateReformatedXMLType1(AXML: TStringList; const AStartSymbol,
  AStopSymbol: string): TStringList;
label
  SelbeZeileNochmal;
var
  I, Sv, Ev: Integer;
  SvZeile, EvZeile: Integer;
  SvValid, EvValid: Boolean;
  J: Integer;
  TmpOutput: string;
begin
  Sv := -1;
  SvZeile := -1;
  SvValid := False;
  Ev := -1;
  EvZeile := -1;
  EvValid := False;
  Result := TStringList.Create();
  try
    for I := 0 to AXML.Count - 1 do
    begin
      SelbeZeileNochmal:
      if not SvValid then
      begin
        Sv := AXML[I].IndexOf(AStartSymbol);
        SvZeile := I;
      end;
      if not EvValid then
      begin
        Ev := AXML[I].IndexOf(AStopSymbol);
        EvZeile := I;
      end;
      if Sv <= 0 then
        Continue;
      SvValid := True;
      if Ev <= 0 then
        Continue;
      EvValid := True;
      if SvZeile = EvZeile then
      begin
        Result.Add(AXML[I].Substring(Sv, Ev - Sv));
        AXML[I] := AXML[I].Substring(Ev + 1);
        SvValid := False;
        EvValid := False;
        goto SelbeZeileNochmal;
      end
      else
      begin
        TmpOutput := AXML[SVZeile].Substring(Sv);
        for J := SvZeile + 1 to EVZeile - 1 do
          TmpOutput := TmpOutput + AXML[J];
        TmpOutput := TmpOutput + AXML[EVZeile].Substring(0, Ev);
        Result.Add(TmpOutput);
        TmpOutput := '';
        AXML[EvZeile] := AXML[EvZeile].Substring(Ev + 1);
        SvValid := False;
        EvValid := False;
        goto SelbeZeileNochmal;
      end;
    end;
  except
    on E: Exception do
    begin
      Result.Free;
      //Result := nil;
      raise;
    end;
  end;
end;

class function TXMLParser.GetMonat(AMonat: Integer): string;
begin
  Result := '';
  case AMonat of
  1: Result := 'Januar';
  2: Result := 'Februar';
  3: Result := 'März';
  4: Result := 'April';
  5: Result := 'Mai';
  6: Result := 'Juni';
  7: Result := 'Juli';
  8: Result := 'August';
  9: Result := 'September';
  10: Result := 'Oktober';
  11: Result := 'November';
  12: Result := 'Dezember';
  end;
end;

class function TXMLParser.GetTokenValue(const ALine, AStartToken,
  AEndToken: string; AXMLTyp: TXMLType; AIstDatum: Boolean {Default False};
  AAddLeadingSpaceIfNotEmpty: Boolean {Default False}): string;
var
  Sv, Ev: Integer;
begin
  Sv := ALine.IndexOf(AStartToken);
  Ev := ALine.IndexOf(AEndToken);
  if (Sv > 0) and (Ev > 0) then
  begin
    if AIstDatum then
    begin
      if (AXMLTyp = xmltBWU) or (AXMLTyp = xmltBay) then
      begin
        Result := ReformatBullshitDate(ALine.Substring(Sv + Length(AStartToken), Ev - Sv - 1), AXMLTyp);
      end;
      if AXMLTyp = xmltNRW then
      begin
        Result := ALine.Substring(Sv + Length(AStartToken), Ev - Sv - Length(AStartToken));
      end;
      //xmltSHW: wird übern AIstDatum = False gelöst.
      if AXMLTyp = xmltTHU then
        Result := ReformatBullshitDate(ALine.Substring(Sv + Length(AStartToken), Ev - Sv - 1), AXMLTyp);
    end
    else
      Result := ALine.Substring(Sv + Length(AStartToken), Ev - Sv - Length(AEndToken) + 1);
  end
  else
    Result := '';
  if AAddLeadingSpaceIfNotEmpty and (StringReplace(Result, ' ', '', [rfReplaceAll]) <> '') then
    Result := ' ' + Result;
end;

class procedure TXMLParser.GleicheApothekenZusammenfassen(var ADaten,
  AApotheken: TStringList);
label
  DopplungenEntfernen;
var
  I: Integer;
  J: Integer;
  K: Integer;
  NextValToCheck: Integer;
  CurrNum: Integer;
  NextNum: Integer;
  LastNum: Integer;
  CurrStr: string;
  NextStr: string;
  Dopplungen: string;
  DopplungenHelferListe, BereitsZugefuegt: TStringList;
begin
  Dopplungen := '';
  CurrStr := '';
  NextStr := '';
  BereitsZugefuegt := TStringList.Create;
  try
    for I := 0 to AApotheken.Count - 1 do
    begin
      if Length(AApotheken[I]) > 5 then
      begin
        CurrStr := CurrStr + AApotheken[I];
        Continue;
      end;
      CurrNum := StrToInt(AApotheken[I]);  //War Mal -1.
      NextNum := CurrNum + 1;
      for J := I + 1 to AApotheken.Count - 1 do
      begin
        if Length(AApotheken[J]) < 5 then
        begin
          if SameText(CurrStr, NextStr) and (BereitsZugefuegt.IndexOf(IntToStr(CurrNum)) = -1) and (BereitsZugefuegt.IndexOf(IntToStr(NextNum)) = -1) then
          begin
            if Dopplungen <> '' then
              Dopplungen := Dopplungen + ', ' + IntToStr(CurrNum - 1) + '=' + IntToStr(NextNum)
            else
              Dopplungen := IntToStr(CurrNum - 1) + '=' + IntToStr(NextNum);
            BereitsZugefuegt.Add(IntToSTr(NextNum));
          end;
          NextNum := StrToInt(AApotheken[J]);
          NextStr := '';
          Continue;
        end;
        NextStr := NextStr + AApotheken[J];
      end;
      if SameText(CurrStr, NextStr) then
      begin
        if Dopplungen <> '' then
          Dopplungen := Dopplungen + ', ' + IntToStr(CurrNum - 1) + '=' + IntToStr(NextNum)
        else
          Dopplungen := IntToStr(CurrNum - 1) + '=' + IntToStr(NextNum);
      end;
      CurrNum := StrToInt(AApotheken[I]);
      CurrStr := '';
      NextStr := '';
    end;
  finally
    BereitsZugefuegt.Free;
  end;

  if Dopplungen <> '' then
  begin
    DopplungenHelferListe:= TStringList.Create;
    BereitsZugefuegt := TStringList.Create; //Wird hier benutzt, um die Daten der Apotheken zu löschen.
    try
      DopplungenHelferListe.CommaText := Dopplungen;
      DopplungenEntfernen:
        J := DopplungenHelferListe.Count - 1;
        if J >= 0 then
        begin
          CurrNum := StrToInt(DopplungenHelferListe[J].Substring(0, DopplungenHelferListe[J].IndexOf('=')));
          NextNum := StrToInt(DopplungenHelferListe[J].Substring(DopplungenHelferListe[J].IndexOf('=') + 1));
          if CurrNum = NextNum then
          begin
            DopplungenHelferListe.Delete(J);
            goto DopplungenEntfernen;
          end;
          for I := 0 to ADaten.Count - 1 do
          begin
            if StrToInt(ADaten[I].Substring(ADaten[I].IndexOf('Apothekennummer(n)') + Length('Apothekennummer(n)') + 1)) = (NextNum) then
            begin
              BereitsZugefuegt.Add(IntToStr(NextNum));
              ADaten[I] := ADaten[I].Substring(0, ADaten[I].IndexOf('Apothekennummer(n)') + Length('Apothekennummer(n)')) + ' ' + IntToStr(CurrNum);
              DopplungenHelferListe.Delete(J);
              goto DopplungenEntfernen;
            end;
          end;
        end;
        LastNum := AApotheken.Count - 1;
        for I := AApotheken.Count - 1 downto 0 do
        begin
          if Length(AApotheken[I]) < 5 then
          begin
            if BereitsZugefuegt.IndexOf(AApotheken[I]) > -1 then
            begin
              for K := LastNum - 1 downto I do
                AApotheken[K] := '';
            end;
            LastNum := I;
          end;
        end;
    finally
      BereitsZugefuegt.Free;
      DopplungenHelferListe.Free;
    end;

    for I := AApotheken.Count - 1 downto 0 do
    begin
      if AApotheken[I] = '' then
        AApotheken.Delete(I);
    end;
  end;
end;

class function TXMLParser.LCreateStringList(AEncoding: TEncoding): TStringList;
begin
  Result := TStringList.Create();
  try
    Result.LoadFromFile(cNameXMLDatei, AEncoding);
  except
    on E: Exception do
    begin
      Result.Free;
      //Result := nil;
      raise;
    end;
  end;
end;

class function TXMLParser.ParseCurrentEntry(AXML: TSTringList;
  AIndex: Integer; ADatumUnterdruecken: Boolean; const ASeparator: string; ANurDatum: Boolean;
  AXMLTyp: TXMLType): string;
begin
  Result := '';
  if (not ADatumUnterdruecken) or ANurDatum then
  begin
    if (AXMLTyp = xmltBWU) or (AXMLTyp = xmltBay) then
    begin
      Result := 'Von: ' + GetTokenValue(AXML[AIndex], '<from>',  '</from>', AXMLTyp, True) + ' Uhr';
      Result := Result + ' Bis: ' + GetTokenValue(AXML[AIndex], '<to>',  '</to>', AXMLTyp, True) + ' Uhr';
    end;
    if AXMLTyp = xmltNRW then
    begin
      Result := 'Datum: ' + GetTokenValue(AXML[AIndex], '<datum>',  '</datum>', AXMLTyp, True);
    end;
    if AXMLTyp = xmltSWH then
    begin
      Result := 'Datum: ' + GetTokenValue(AXML[AIndex], '<datum>',  '</datum>', AXMLTyp, False) +
        ' ab ' + GetTokenValue(AXML[AIndex], '<startzeit>',  '</startzeit>', AXMLTyp, False) + ' Uhr';
    end;
    if AXMLTyp = xmltTHU then
    begin
      Result := 'Von: ' + GetTokenValue(AXML[AIndex], '<DTSTART>',  '</DTSTART>', AXMLTyp, True) + ' Uhr';
      Result := Result + ' Bis: ' + GetTokenValue(AXML[AIndex], '<DTEND>',  '</DTEND>', AXMLTyp, True) + ' Uhr';
    end;
  end;
  if ANurDatum then
    Exit;
  if Result <> '' then
    Result := Result + sLineBreak;
  if (AXMLTyp = xmltBWU) or (AXMLTyp = xmltBay) then
  begin
    Result := Result {+ ' Apotheke: '} + GetTokenValue(AXML[AIndex], '<name>',  '</name>', AXMLTyp) + ASeparator;
    Result := Result + {'Adresse: ' +} GetTokenValue(AXML[AIndex], '<street>',  '</street>', AXMLTyp) + ASeparator +
      GetTokenValue(AXML[AIndex], '<zipCode>',  '</zipCode>', AXMLTyp) + ' ' + GetTokenValue(AXML[AIndex], '<location>',  '</location>', AXMLTyp) +
      GetTokenValue(AXML[AIndex], '<subLocation>',  '</subLocation>', AXMLTyp, False, True);
    Result := Result + ASeparator + 'Tel.: ' + GetTokenValue(AXML[AIndex], '<phone>',  '</phone>', AXMLTyp);
  end;
  if AXMLTyp = xmltNRW then
  begin
    Result := Result {+ ' Apotheke: '} + GetTokenValue(AXML[AIndex], '<apotheke>',  '</apotheke>', AXMLTyp) + ASeparator;
    Result := Result + {'Adresse: ' +} GetTokenValue(AXML[AIndex], '<strasse>',  '</strasse>', AXMLTyp) + ASeparator +
      GetTokenValue(AXML[AIndex], '<plz>',  '</plz>', AXMLTyp) + ' ' + GetTokenValue(AXML[AIndex], '<ort>',  '</ort>', AXMLTyp) +
      GetTokenValue(AXML[AIndex], '<ortsteil>',  '</ortsteil>', AXMLTyp, False, True);
    Result := Result + ASeparator + 'Tel.: ' + GetTokenValue(AXML[AIndex], '<telefon>',  '</telefon>', AXMLTyp);
  end;
  if AXMLTyp = xmltSWH then
  begin
    Result := Result {+ ' Apotheke: '} + GetTokenValue(AXML[AIndex], '<apotheke>',  '</apotheke>', AXMLTyp) + ASeparator;
    Result := Result + {'Adresse: ' +} GetTokenValue(AXML[AIndex], '<strasse>',  '</strasse>', AXMLTyp) + ASeparator +
      GetTokenValue(AXML[AIndex], '<plz>',  '</plz>', AXMLTyp) + ' ' + GetTokenValue(AXML[AIndex], '<ort>',  '</ort>', AXMLTyp) +
      GetTokenValue(AXML[AIndex], '<ortsteil>',  '</ortsteil>', AXMLTyp, False, True);
    Result := Result + ASeparator + 'Tel.: ' + GetTokenValue(AXML[AIndex], '<telefon>',  '</telefon>', AXMLTyp);
  end;
  if AXMLTyp = xmltTHU then
  begin
    Result := Result {+ ' Apotheke: '} + GetTokenValue(AXML[AIndex], '<NAME>',  '</NAME>', AXMLTyp) + ASeparator;
    Result := Result + {'Adresse: ' +} GetTokenValue(AXML[AIndex], '<STREET>',  '</STREET>', AXMLTyp) + ASeparator +
      GetTokenValue(AXML[AIndex], '<ZIP>',  '</ZIP>', AXMLTyp) + ' ' + GetTokenValue(AXML[AIndex], '<CITY>',  '</CITY>', AXMLTyp);
    Result := Result + ASeparator + 'Tel.: ' + GetTokenValue(AXML[AIndex], '<PHONE>',  '</PHONE>', AXMLTyp);
  end;
end;

class function TXMLParser.ParseCurrentEntryAsShortDate(AXML: TSTringList;
  AIndex: Integer; const ASeparator: string; AXMLTyp: TXMLType;
  out AMonat: Integer; out AUhrzeitVon: string): string;
var
  Datum: TDateTime;
begin
  Result := '';
  if AXMLTyp in [xmltBWU, xmltBay] then
  begin
    Result := GetTokenValue(AXML[AIndex], '<from>',  '</from>', AXMLTyp, True);
  end;
  if AXMLTyp = xmltNRW then
  begin
    Result := GetTokenValue(AXML[AIndex], '<datum>',  '</datum>', AXMLTyp, True);
  end;
  if AXMLTyp = xmltSWH then
  begin
    Result := GetTokenValue(AXML[AIndex], '<datum>',  '</datum>', AXMLTyp, False) + ' ' + GetTokenValue(AXML[AIndex], '<startzeit>', '</startzeit>', AXMLTyp, False);
  end;
  if AXMLTyp = xmltTHU then
  begin
    Result := GetTokenValue(AXML[AIndex], '<DTSTART>',  '</DTSTART>', AXMLTyp, True);
  end;
  Datum := StrToDateTime(Result);
  Result := Result.Substring(0, 10);
  Result := FormatSettings.LongDayNames[DayOfWeek(Datum)].Substring(0, 2) + ' ' + IntToStr(DayOf(Datum)) + ': ';
  AMonat := MonthOf(Datum);
  AUhrzeitVon := TimeToStr(TimeOf(Datum));
  if AXMLTyp = xmltNRW then
    AUhrzeitVon := '-1';
end;

class function TXMLParser.ReformatBullshitDate(const ADate: string; AXMLTyp: TXMLType): string;
begin
  if AXMLTyp in [xmltBWU, xmltBay] then
  begin
    Result := ADate.Substring(8, 2) + '.' + ADate.Substring(5, 2) + '.' + ADate.Substring(0, 4) + ' '
      + IntToStr(StrToInt(ADate.Substring(11, 2)) + 1).PadLeft(2, '0') + ':' + ADate.Substring(14, 2);
  end;
  if AXMLTyp = xmltTHU then
  begin
    Result := ADate.Substring(8, 2) + '.' + ADate.Substring(5, 2) + '.' + ADate.Substring(0, 4) + ' '
      + IntToStr(StrToInt(ADate.Substring(11, 2))).PadLeft(2, '0') + ':' + ADate.Substring(14, 2);
  end;
end;

procedure TfrmMain.btnDatenReformatierenClick(Sender: TObject);
begin
  ReformatData();
end;

procedure TfrmMain.btnDatenSpeichernClick(Sender: TObject);
begin
  if not SpeichernMitSonderfunktionFallsUebergeben(memoAusgabe.Lines) then
    DatenSpeichern(memoAusgabe.Lines);
end;

procedure TfrmMain.btnErweiterteEinstellungenClick(Sender: TObject);
var
  ErweiterteEinstellungenFrm: TfrmErweiterteEinstellungen;
begin
  ErweiterteEinstellungenFrm := TfrmErweiterteEinstellungen.Create(nil);
  try
    ErweiterteEinstellungenFrm.KodierungDL := FErwEinstObj.FKodierungDL;
    ErweiterteEinstellungenFrm.KodierungDS := FErwEinstObj.FKodierungDS;
    ErweiterteEinstellungenFrm.AllesLoeschen := FAllesLoeschen;
    if ErweiterteEinstellungenFrm.ShowModal = mrOK then
    begin
      FErwEinstObj.FKodierungDL := ErweiterteEinstellungenFrm.KodierungDL;
      FErwEinstObj.FKodierungDS := ErweiterteEinstellungenFrm.KodierungDS;
      FAllesLoeschen := ErweiterteEinstellungenFrm.AllesLoeschen;
      FSonderfktSchluesselw := ErweiterteEinstellungenFrm.SonderfktSchluesselw;
    end;
  finally
    ErweiterteEinstellungenFrm.Free;
  end;
end;

procedure TfrmMain.btnHilfeClick(Sender: TObject);
begin
  ZeigeHilfeDialog();
end;

procedure TfrmMain.btnMdbDruckenClick(Sender: TObject);
var
  MdbInhalt: TStringList;
begin
  if FileExists(cNameMDBDatei) then
  begin
    MdbInhalt := TStringList.Create();
    try
      MdbInhalt.LoadFromFile(cNameMDBDatei);
      DatenDrucken(MdbInhalt, GetColour(FSonderfktSchluesselw));
    finally
      MdbInhalt.Free;
    end;
  end;
end;

procedure TfrmMain.btnMdbSpeichernClick(Sender: TObject);
var
  MdbInhalt: TStringList;
begin
  if FileExists(cNameMDBDatei) then
  begin
    MdbInhalt := TStringList.Create();
    try
      MdbInhalt.LoadFromFile(cNameMDBDatei);
      if not SpeichernMitSonderfunktionFallsUebergeben(MdbInhalt) then
        DatenSpeichern(MdbInhalt);
    finally
      MdbInhalt.Free;
    end;
  end;
end;

procedure TfrmMain.btnNurApoDruckenClick(Sender: TObject);
begin
  DatenDrucken(FAposList, GetColour(FSonderfktSchluesselw));
end;

procedure TfrmMain.btnNurAposSpeichernClick(Sender: TObject);
begin
  if not SpeichernMitSonderfunktionFallsUebergeben(FAposList) then
    DatenSpeichern(FAposList);
end;

procedure TfrmMain.btnProgrammBeendenClick(Sender: TObject);
begin
  Close();
end;

//ShellExecute(0, 'open', PChar('callto:NUMMER'), nil, nil, SW_HIDE);
  //Exit;

procedure TfrmMain.btnZeigeTelNrsClick(Sender: TObject);
begin
  with TfrmNotfallTelefonNummern.Create(nil) do
  begin
    try
      ShowModal();
    finally
      Free;
    end;
  end;
end;

procedure TfrmMain.cbEinstellungenSpeichernClick(Sender: TObject);
begin
  if not cbEinstellungenSpeichern.Checked then
    cbApiURLSpeichern.Checked := False;
  cbApiURLSpeichern.Enabled := cbEinstellungenSpeichern.Checked;
end;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FErwEinstObj := TErwEinstObj.Create;
  FAposList := TStringList.Create();
end;

procedure TfrmMain.DatenDrucken(AList: TStrings; AColour: TColor);
label
  ZeileFortsetzen;
var
  PrintDialogue: TPrintDialog;
  Breite, Hoehe, Links, Oben, X, Y: Integer;
  I, J, PosLetztLeerz: Integer;
  TmpList: TStringList;
  Tmp: string;
begin
  PrintDialogue := TPrintDialog.Create(nil);
  try
    if PrintDialogue.Execute() then
    begin
      TmpList := TStringList.Create;
      try
        Printer.BeginDoc;
        SetMapMode(Printer.Canvas.Handle, MM_LOMETRIC); //Umstellen auf 1/10 mm

        Printer.Canvas.Font.Name := 'Calibri';
        Printer.Canvas.Brush.Color := clWhite;
        if AColour <> clNone then
          Printer.Canvas.Font.Color := AColour;
        Printer.Canvas.Font.Height := 50;

        //Blattgöße in 1/10 mm ermitteln:
        Breite := GetDeviceCaps(Printer.Canvas.Handle, HORZSIZE) * 10;
        Hoehe := GetDeviceCaps(Printer.Canvas.Handle, VERTSIZE) * 10;

        Links := 250; //2,5 cm
        Oben := 250; //2,5 cm

        X := Links;
        Y := Oben * (- 1);

        for I := 0 to AList.Count - 1 do
        begin
          if ((Printer.Canvas.TextWidth(AList[I])) >= (breite - (2 * Links))) then
          begin
            J := 1;
            PosLetztLeerz := 0;
            ZeileFortsetzen:
            Tmp := '';
            while (Printer.Canvas.TextWidth(Tmp) < (breite - (2 * Links))) and (J <= Length(AList[I])) do
            begin
              Tmp := Tmp + AList[I][J];
              if AList[I][J] = ' ' then
                PosLetztLeerz := J;
              Inc(J);
            end;
            if (J <= Length(AList[I])) and (J <> PosLetztLeerz) then
            begin
              Tmp := Tmp.Substring(0, Length(Tmp) - (J - PosLetztLeerz) + 1); //+1: Llerzeichen auch drucken für die Lesbarkeit mit Assistenzsoftware.
              J := PosLetztLeerz + 1;
            end;
            TmpList.Add(Tmp);
            if J <= Length(AList[I]) then
              goto ZeileFortsetzen;
          end
          else
          begin
            TmpList.Add(AList[I]);
          end;
        end;

        for I := 0 to TmpList.Count - 1 do
        begin

          if ((- 1) * Y) > (Hoehe - (2 * Oben)) then
          begin
            Y := Oben * (- 1);
            Printer.NewPage;
          end;

          Printer.Canvas.TextOut(x, y, TmpList[I]);

          Y := Y - Printer.Canvas.TextHeight(TmpList[I]);

        end;
        Printer.EndDoc;
      finally
        TmpList.Free;
      end;
    end;
  finally
    PrintDialogue.Free;
  end;
end;

procedure TfrmMain.DatenSpeichern(AList: TStrings);
var
  SaveDialogue: TSaveDialog;
  Ausgabe: TStringList;
begin
  SaveDialogue := TSaveDialog.Create(nil);
  try
    SaveDialogue.DefaultExt := 'txt';
    SaveDialogue.Filter := 'Textdateien (*.txt)|*.txt|Alle Dateien (*.*)|*.*';
    SaveDialogue.Options := SaveDialogue.Options + [ofOldStyleDialog, ofOverwritePrompt];
    if SaveDialogue.Execute() then
    begin
      Ausgabe := TKodierungsHelfer.CreateStringListNewEncoding(FErwEinstObj.KodierungDL, FErwEinstObj.FKodierungDS, AList);
      try
        Ausgabe.SaveToFile(SaveDialogue.FileName, FErwEinstObj.KodierungDS);
      finally
        Ausgabe.Free;
      end;
    end;
  finally
    SaveDialogue.Free;
  end;
end;

destructor TfrmMain.Destroy;
begin
  FAposList.Free;
  FErwEinstObj.Free;
  inherited Destroy;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  SettingsObj: TSettingsObj;
  Guid: TGuid;
  ProgName, BatName: string;
  Loeschbat: TStringList;
begin
  if ((not cbXMLBehalten.Checked) or (FAllesLoeschen)) and FileExists(cNameXMLDatei) then
    DeleteFile(cNameXMLDatei);
  if FAllesLoeschen and FileExists(cNameEinstellungsDatei) then
    DeleteFile(cNameEinstellungsDatei);
  if FAllesLoeschen and FileExists(cNameLizenzDatei) then
    DeleteFile(cNameLizenzDatei);
  if FAllesLoeschen and FileExists(cNameMDBDatei) then
    DeleteFile(cNameMDBDatei);
  if FAllesLoeschen then
  begin
    CreateGUID(Guid);
    BatName := ReplaceStr(ReplaceStr(ReplaceStr(GUIDToString(Guid), '{', ''), '}', ''), '-', '')  + '.bat';
    ProgName := extractFilename(paramstr(0));
    Loeschbat := TSTringList.Create;
    try
      Loeschbat.Add('@ECHO OFF');
      Loeschbat.Add(':VorDemLoeschen');
      Loeschbat.Add('Erase ' + ProgName);
      Loeschbat.Add('If exist ' + ProgName + ' goto VorDemLoeschen');
      Loeschbat.Add('Erase ' + BatName);
      Loeschbat.SaveToFile(BatName);
    finally
      Loeschbat.Free;
    end;
    ShellExecute(0, 'open', PChar(BatName), nil, nil, SW_HIDE);
    Exit;
  end;
  if cbEinstellungenSpeichern.Checked then
  begin
    SettingsObj := TSettingsObj.Create(True, cbApiURLSpeichern.Checked, cbXMLBehalten.Checked, rbDatenBuendeln.Checked, cbDoppelteEntfernen.Checked, rbAltenStilNacherzeugen.Checked,
      cbKompakteDarstellung.Checked, GetSelectedXMLTType(), FErwEinstObj.KodierungDL, FErwEinstObj.KodierungDS);
    try
      if cbEinstellungenSpeichern.Checked and cbApiURLSpeichern.Checked then
        SettingsObj.ApiUrl := memoApiUrl.Text;
      TSettingsManager.SaveSettings(cNameEinstellungsDatei, SettingsObj);
    finally
      SettingsObj.Free;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;
  FAllesLoeschen := False;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  SettingsObj: TSettingsObj;
  LizenzDateiSchreiben: TStringList;
begin
  if (not FileExists(cNameLizenzDatei)) or (not LizenzdateiHatKorrekteVersion(cNameLizenzDatei)) then
  begin
    with TfrmLizenzdialog.Create(nil) do
    begin
      try
        if ShowModal <> mrOk then
          Halt;
      finally
        Free;
      end;
    end;
    LizenzDateiSchreiben := TStringList.Create;
    try
      LizenzDateiSchreiben.Add(cLizenzVersion);
      LizenzDateiSchreiben.SaveToFile(cNameLizenzDatei);
    finally
      LizenzDateiSchreiben.Free;
    end;
  end;
  memoAusgabe.Clear();
  memoAusgabe.Lines.Add('Alle Angaben ohne Gewähr. Änderungen sind jederzeit möglich.');
  memoAusgabe.Lines.Add('Die Notdienstdaten wurden durch die für Sie zuständige Landesapotheker*innenkammer ' +
    TSettingsManager.GetNameForXMLTyp(GetSelectedXMLTType) + ' zur Verfügung gestellt.');
  SettingsObj := TSettingsManager.LoadSettings(cNameEinstellungsDatei);
  try
    cbEinstellungenSpeichern.Checked := SettingsObj.EinstellungenSpeichern;
    cbApiURLSpeichern.Checked := SettingsObj.ApiUrlSpeichern;
    cbXMLBehalten.Checked := SettingsObj.XMLDateiBehalten;
    rbDatenBuendeln.Checked := SettingsObj.AusgabedatenBuendeln;
    rbDatenNichtBuendeln.Checked := not SettingsObj.AusgabedatenBuendeln;
    rbAltenStilNacherzeugen.Checked := SettingsObj.AltenModusNachstellen;
    cbDoppelteEntfernen.Checked := SettingsObj.DoppelteEintraegeZusammenfassen;
    cbKompakteDarstellung.Checked := SettingsObj.Kompakt;
    if SettingsObj.ApiUrlSpeichern then
      memoApiUrl.Text := SettingsObj.ApiUrl;
    SetXMLTypToCombobox(SettingsObj.XMLTyp);
    FErwEinstObj.KodierungDL := SettingsObj.KodierungDL;
    FErwEinstObj.KodierungDS := SettingsObj.KodierungDS;
  finally
    SettingsObj.Free;
  end;
  if FileExists(cNameMDBDatei) then
  begin
    btnMdbSpeichern.Visible := True;
    btnMdbDrucken.Visible := True;
  end;
end;

function TfrmMain.GetColour(const AText: string): TColor;
var
  StartPosSdfktSpeichern: Integer;
begin
  Result := clNone;
  if FSonderfktSchluesselw = '' then
    Exit;
  StartPosSdfktSpeichern := FSonderfktSchluesselw.IndexOf('Colour:');
  if StartPosSdfktSpeichern < 0 then
    Exit;
  StartPosSdfktSpeichern := StartPosSdfktSpeichern + 7;
  if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clBlack', True) then
    Exit(clBlack)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clMaroon', True) then
    Exit(clMaroon)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clGreen', True) then
    Exit(clGreen)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clOlive', True) then
    Exit(clOlive)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clNavy', True) then
    Exit(clNavy)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clPurple', True) then
    Exit(clPurple)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clTeal', True) then
    Exit(clTeal)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clGray', True) then
    Exit(clGray)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clSilver', True) then
    Exit(clSilver)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clRed', True) then
    Exit(clRed)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clLime', True) then
    Exit(clLime)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clYellow', True) then
    Exit(clYellow)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clBlue', True) then
    Exit(clBlue)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clFuchsia', True) then
    Exit(clFuchsia)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clAqua', True) then
    Exit(clAqua)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clLtGray', True) then
    Exit(clLtGray)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clDkGray', True) then
    Exit(clDkGray)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clWhite', True) then
    Exit(clWhite)
  else if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('clGolf', True) then
    Exit(ColorToRGB(18 + 17 shl 8 + 58 shl 16));
end;

procedure TfrmMain.GetNummerUndBuchstabenVonApotheke(
  APersistenteApothekenListe: TStringList; const AApotheke: string;
  out ANummer: Integer; out ABuchstaben: string);
var
  AktIndex: Integer;
begin
  AktIndex := APersistenteApothekenListe.IndexOf(AApotheke);
  if AktIndex > -1 then
  begin
    ANummer := StrToInt(APersistenteApothekenListe[AktIndex - 1].Substring(0, Length(APersistenteApothekenListe[AktIndex - 1]) - 1));
    ABuchstaben := APersistenteApothekenListe[AktIndex - 1].Substring(Length(APersistenteApothekenListe[AktIndex - 1]) - 1);
  end;
end;

function TfrmMain.GetSelectedXMLTType: TXMLType;
begin
  Result := xmltUnd;
  if cbXMLTyp.ItemIndex < 0 then
    Exit;
  if cbXMLTyp.Items[cbXMLTyp.ItemIndex] = cXMLTypBwu then
    Result := xmltBWU
  else if cbXMLTyp.Items[cbXMLTyp.ItemIndex] = cXMLTypBay then
    Result := xmltBay
  else if cbXMLTyp.Items[cbXMLTyp.ItemIndex] = cXMLTypNrw then
    Result := xmltNrw
  else if cbXMLTyp.Items[cbXMLTyp.ItemIndex] = cXMLTypSwh then
    Result := xmltSwh
  else if cbXMLTyp.Items[cbXMLTyp.ItemIndex] = cXMLTypThu then
    Result := xmltThu;
end;

function TfrmMain.GetStartSymbol(AXMLTyp: TXMLType): string;
begin
  Result := 'WRONG TYPE';
  case AXMLTyp of
    xmltBWU: Result := '<entry>';
    xmltBay: Result := '<entry>';
    xmltNRW: Result := '<notdienst>';
    xmltSWH: Result := '<notdienst>';
    xmltTHU: Result := '<VEVENT>';
  end;
end;

function TfrmMain.GetStopSymbol(AXMLTyp: TXMLType): string;
begin
  Result := 'WRONG TYPE';
  case AXMLTyp of
    xmltBWU: Result := '</entry>';
    xmltBay: Result := '</entry>';
    xmltNRW: Result := '</notdienst>';
    xmltSWH: Result := '</notdienst>';
    xmltTHU: Result := '</VEVENT>';
  end;
end;

function TfrmMain.LizenzdateiHatKorrekteVersion(const APath: string): Boolean;
var
  LizenzDateiInhalt: TStringList;
begin
  if not FileExists(APath) then
    Exit(False);
  LizenzDateiInhalt := TStringList.Create();
  try
    LizenzDateiInhalt.LoadFromFile(APath);
    Result := (LizenzDateiInhalt.Count > 0) and (LizenzDateiInhalt[0] = cLizenzVersion);
  finally
    LizenzDateiInhalt.Free;
  end;
end;

function TfrmMain.MergeMDBFileAndGivenList_Create(
  AList: TStringList): TStringList;
const
  Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; //Wir können maximal 26 Apotheken pro Tag speichern.
var
  AktZahl, AktBuchstabe: Integer;
  I: Integer;
  AktWertIstStartwert: Boolean;
begin
  Result := TStringList.Create;
  try
    if FileExists(cNameMDBDatei) then
      Result.LoadFromFile(cNameMDBDatei);
      //TODO sk: Prüfsumme?
    AktZahl := 0;
    AktBuchstabe := 1;
    if Result.Count <> 0 then
    begin
      for I := 0 to Result.Count - 1 do //Maximale Apothekennummer: 9999Z.
      begin
        if Length(Result[I]) <= 5 then
        begin
          //Das nächste zu vergebende Zeichen ist jeweils aktuelles Zeichen + 1.
          AktZahl := StrToInt(Result[I].Substring(0, Length(Result[I]) - 1));
          //AktBuchstabe := Alphabet.IndexOf(Result[I].Substring(Length(Result[I]))) + 1;
        end;
      end;
    end;
    AktWertIstStartwert := True;
    for I := 0 to AList.Count - 1 do
    begin
      //Zahlen aus AList ignorieren - und als neue Zeile interpretieren.
      if Length(AList[I]) <= 5 then
      begin
        AktWertIstStartwert := True;
        Continue;
      end;
      //Zu setzender Eintrag ist bereits gesetzt.
      if Result.IndexOf(AList[I]) > -1 then
      begin
        //AktWertIstStartwert := False;
        Continue;
      end;
      if AktWertIstStartwert then
      begin
        Inc(AktZahl);
        AktBuchstabe := 1;
      end
      else
        Inc(AktBuchstabe);
      Result.Add(IntToStr(AktZahl) + Alphabet[AktBuchstabe]);
      Result.Add(AList[I]);
      AktWertIstStartwert := False;
    end;
  except
    Result.Free;
    //Result := nil;
    raise;
  end;
end;

procedure TfrmMain.rbDatenBuendelnClick(Sender: TObject);
begin
  cbDoppelteEntfernen.Enabled := True;
end;

procedure TfrmMain.rbDatenNichtBuendelnClick(Sender: TObject);
begin
  cbDoppelteEntfernen.Checked := False;
  cbDoppelteEntfernen.Enabled := False;
end;

procedure TfrmMain.ReformatData;
var
  FirstTimeEntered: Boolean;
  I, AktNummer, LetztNr: Integer;
  LetzterMonat, AktMonat: Integer;
  Tmp, Tmp2, Tmp3, DatenUndLfdNr, ApothekenLfdNr: TStringList;
  LetzteDaten, Datum, Uhrzeit, LetztUhrzt: string;
  NummernAktuellerTag, AktBchstb, LetzterBchstb: string;
  Separator: string;
  XMLTyp: TXMLType;
begin
  if not FileExists(cNameXMLDatei) then
  begin
    MessageDlg('Die benötigte XML-Datei konnte nicht gefunden werden. Diese muss den Namen ' + cNameXMLDatei + ' tragen.', TMsgDlgType.mtError, [mbClose], 0);
    Exit;
  end;
  memoAusgabe.Clear();
  memoAusgabe.Lines.Add('Alle Angaben ohne Gewähr. Änderungen sind jederzeit möglich.');
  memoAusgabe.Lines.Add('Die Notdienstdaten wurden durch die für Sie zuständige Landesapotheker*innenkammer ' +
    TSettingsManager.GetNameForXMLTyp(GetSelectedXMLTType) + ' zur Verfügung gestellt.');
  if cbKompakteDarstellung.Checked then
    Separator := '; '
  else
    Separator := sLineBreak;
  AktNummer := 0;
  LetzteDaten := '';
  XMLTyp:= GetSelectedXMLTType();
  Tmp := TXMLParser.LCreateStringList(FErwEinstObj.KodierungDL);
  if XMLTyp in [xmltNRW, xmltSWH] then
  begin
    Tmp3 := TXMLParser.CreateReformatedXMLType1(Tmp, '<notdienstzeiten>', '</notdienstzeiten>');
    try
      if Tmp3.Count > 0 then
        memoAusgabe.Lines.Add(Trim(StringReplace(Tmp3[0], '<notdienstzeiten>', '', [])));
    finally
      FreeAndNil(Tmp3);
    end;
  end;
  Tmp2 := TXMLParser.CreateReformatedXMLType1(Tmp, GetStartSymbol(XMLTyp), GetStopSymbol(XMLTyp));
  if (Tmp.Count > 0) and Tmp[0].StartsWith(cHinweisSignal) then
  begin
    memoAusgabe.Lines.Add(Tmp[0].Substring(Length(cHinweisSignal)));
    Tmp.Delete(0);
  end;
  DatenUndLfdNr := TStringList.Create;
  ApothekenLfdNr := TStringList.Create;
  try
    if rbDatenNichtBuendeln.Checked then
    begin
      btnNurAposSpeichern.Visible := False;
      btnNurApoDrucken.Visible := False;
      for I := 0 to Tmp2.Count - 1 do
      begin
        if SameText(LetzteDaten, TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp)) then
        begin
          memoAusgabe.Lines.Add(TXMLParser.ParseCurrentEntry(Tmp2, I, True, Separator, False, XMLTyp));
        end
        else
        begin
          LetzteDaten := TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp);
          memoAusgabe.Lines.Add(TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, False, XMLTyp));
        end;
      end;
      Exit;
    end;
    if rbAltenStilNacherzeugen.Checked then
    begin
      LetzteDaten := '###';
      for I := 0 to Tmp2.Count - 1 do
      begin
        if not SameText(LetzteDaten, TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp)) then
        begin
          LetzteDaten := TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp);
          ApothekenLfdNr.Add('-1'); //Egal was, solange es kleiner als fünf Stellen ist.
        end;
        ApothekenLfdNr.Add(TXMLParser.ParseCurrentEntry(Tmp2, I, True, Separator, False, XMLTyp));
      end;
      Tmp3 := MergeMDBFileAndGivenList_Create(ApothekenLfdNr); //Enthält die aktuelle "Manuelle Datenbank" der Apothekendaten.
      try
        LetztUhrzt := '-1';
        LetzteDaten := 'nil';
        LetztNr := -2;
        LetzterBchstb := '';
        FirstTimeEntered := True;
        LetzterMonat := 0;
        AktMonat := 0;
        for I := 0 to Tmp2.Count - 1 do
        begin
           if SameText(LetzteDaten, TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp)) then
           begin
             GetNummerUndBuchstabenVonApotheke(Tmp3, TXMLParser.ParseCurrentEntry(Tmp2, I, True, Separator, False, XMLTyp),
               AktNummer, AktBchstb);
             if AktNummer <> LetztNr then
             begin
               {if NummernAktuellerTag = '' then
                 NummernAktuellerTag := NummernAktuellerTag + IntToStr(AktNummer) + AktBchstb
               else}
                 NummernAktuellerTag := NummernAktuellerTag + ', ' + IntToStr(AktNummer) + AktBchstb;
             end
             else
               NummernAktuellerTag := NummernAktuellerTag + AktBchstb; //TODO sk: Wenn alle gespeicherten abgefragt wurden, die Buchstaben hinter der Zahl löschen? Weitere out-Variable und separat mitzählen.
           end
           else
           begin
             if not FirstTimeEntered then
             begin
               DatenUndLfdNr.Add(Datum {+ ': Apothekennummer(n) '} + NummernAktuellerTag);
             end;
             LetzteDaten := TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp);
             Datum := TXMLParser.ParseCurrentEntryAsShortDate(Tmp2, I, Separator, XMLTyp, AktMonat, Uhrzeit); //TODO sk: LetzteUhrzeit, DerzeitigeUhrzeit.
             if AktMonat <> LetzterMonat then
             begin
               LetzterMonat := AktMonat;
               DatenUndLfdNr.Add(TXMLParser.GetMonat(AktMonat));
             end;
             if not SameText(LetztUhrzt, Uhrzeit) then
             begin
               LetztUhrzt := Uhrzeit;
               DatenUndLfdNr.Add(Uhrzeit + ' Uhr');
             end;
             FirstTimeEntered := False;
             GetNummerUndBuchstabenVonApotheke(Tmp3, TXMLParser.ParseCurrentEntry(Tmp2, I, True, Separator, False, XMLTyp),
               AktNummer, AktBchstb);
             NummernAktuellerTag := IntToStr(AktNummer) + AktBchstb;
           end;
           LetztNr := AktNummer;
        end;
        DatenUndLfdNr.Add(Datum {+ ': Apothekennummer(n) '} + NummernAktuellerTag);
        for I := 0 to DatenUndLfdNr.Count - 1 do
          memoAusgabe.Lines.Add(DatenUndLfdNr[I]);
        FAposList.Clear();
        for I := 0 to memoAusgabe.Lines.Count - 1 do
          FAposList.Add(memoAusgabe.Lines[I]);
        for I := 0 to Tmp3.Count - 1 do
        begin
          if I mod 2 = 0 then
            LetzteDaten := Tmp3[I]
          else
            memoAusgabe.Lines.Add(LetzteDaten + ': ' + Tmp3[I]);
        end;
        Tmp3.SaveToFile(cNameMDBDatei); //Daten speichern, um sie nächstes Mal ggf. erneut verwenden zu können.
        btnMdbSpeichern.Visible := True;
        btnMdbDrucken.Visible := True;
        btnNurAposSpeichern.Visible := True;
        btnNurApoDrucken.Visible := True;
      finally
        FreeAndNil(Tmp3);
      end;
      Exit;
    end;
    //rbDatenBuendeln.Checked:
    btnNurAposSpeichern.Visible := False;
    btnNurApoDrucken.Visible := False;
    for I := 0 to Tmp2.Count - 1 do
    begin
       if SameText(LetzteDaten, TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp)) then
       begin
         ApothekenLfdNr.Add(TXMLParser.ParseCurrentEntry(Tmp2, I, True, Separator, False, XMLTyp));
       end
       else
       begin
         Inc(AktNummer);
         LetzteDaten := TXMLParser.ParseCurrentEntry(Tmp2, I, False, Separator, True, XMLTyp);
         ApothekenLfdNr.Add(IntToStr(AktNummer));
         DatenUndLfdNr.Add(LetzteDaten + ': Apothekennummer(n) ' + IntToStr(AktNummer));
         ApothekenLfdNr.Add(TXMLParser.ParseCurrentEntry(Tmp2, I, True, Separator, False, XMLTyp));
       end;
    end;
    if cbDoppelteEntfernen.Checked then
      TXMLParser.GleicheApothekenZusammenfassen(DatenUndLfdNr, ApothekenLfdNr);
    for I := 0 to DatenUndLfdNr.Count - 1 do
      memoAusgabe.Lines.Add(DatenUndLfdNr[I]);
    for I := 0 to ApothekenLfdNr.Count - 1 do
      memoAusgabe.Lines.Add(ApothekenLfdNr[I]);
  finally
    ApothekenLfdNr.Free;
    DatenUndLfdNr.Free;
    Tmp2.Free;
    Tmp.Free;
  end;
end;

procedure TfrmMain.SaveByRichEdit(AColour: TColor; AList: TStrings);
var
  SaveDialogue: TSaveDialog;
  RichEdit: TRichEdit;
  I: Integer;
begin
  SaveDialogue := TSaveDialog.Create(nil);
  try
    SaveDialogue.Options := SaveDialogue.Options + [ofOldStyleDialog, ofOverwritePrompt];
    SaveDialogue.Filter := 'Rich Text File (*.rtf)|*.rtf';
    SaveDialogue.DefaultExt := 'rtf';
    if SaveDialogue.Execute() then
    begin
      RichEdit := TRichEdit.Create(nil);
      try
        RichEdit.Visible := False;
        RichEdit.Parent := Self;
        RichEdit.PlainText := False;
        RichEdit.SelAttributes.Color := AColour;
        RichEdit.Lines.Add('');
        for I := 0 to AList.Count - 1 do
        begin
          RichEdit.SelAttributes.Color := AColour;
          RichEdit.Lines.Add(AList[I]);
        end;
        RichEdit.LInes.Delete(0);
        RichEdit.Lines.SaveToFile(SaveDialogue.FileName);
      finally
        RichEdit.Free;
      end;
    end;
  finally
    SaveDialogue.Free;
  end;
end;

procedure TfrmMain.SaveByRichEditRainbowMode(AList: TStrings);
var
  SaveDialogue: TSaveDialog;
  RichEdit: TRichEdit;
  I: Integer;
begin
  SaveDialogue := TSaveDialog.Create(nil);
  try
    SaveDialogue.Options := SaveDialogue.Options + [ofOldStyleDialog, ofOverwritePrompt];
    SaveDialogue.Filter := 'Rich Text File (*.rtf)|*.rtf';
    SaveDialogue.DefaultExt := 'rtf';
    if SaveDialogue.Execute() then
    begin
      RichEdit := TRichEdit.Create(nil);
      try
        RichEdit.Visible := False;
        RichEdit.Parent := Self;
        RichEdit.PlainText := False;
        RichEdit.SelAttributes.Color := clAqua;
        RichEdit.Lines.Add('');
        for I := 0 to AList.Count - 1 do
        begin
          case (I mod 6) of
            0: RichEdit.SelAttributes.Color := clRed;
            1: RichEdit.SelAttributes.Color := TColors.Orange;
            2: RichEdit.SelAttributes.Color := clYellow;
            3: RichEdit.SelAttributes.Color := TColors.Darkgreen;
            4: RichEdit.SelAttributes.Color := clBlue;
            5: RichEdit.SelAttributes.Color := TColors.Darkviolet;
          end;
          RichEdit.Lines.Add(AList[I]);
        end;
        RichEdit.Lines.Delete(0);
        RichEdit.Lines.SaveToFile(SaveDialogue.FileName);
      finally
        RichEdit.Free;
      end;
    end;
  finally
    SaveDialogue.Free;
  end;
end;

procedure TfrmMain.SetXMLStringToCombobox(const AXMLTyp: string);
var
  I: Integer;
begin
  for I := 0 to cbXMLTyp.Items.Count - 1 do
  begin
    if SameText(AXMLTyp, cbXMLTyp.Items[I]) then
    begin
      cbXMLTyp.ItemIndex := I;
      Break;
    end;
  end;
end;

procedure TfrmMain.SetXMLTypToCombobox(AXMLTyp: TXMLType);
begin
  case AXMLTyp of
    xmltBWU: SetXMLStringToCombobox(cXMLTypBwu);
    xmltBay: SetXMLStringToCombobox(cXMLTypBay);
    xmltNRW: SetXMLStringToCombobox(cXMLTypNrw);
    xmltSWH: SetXMLStringToCombobox(cXMLTypSwh);
    xmltTHU: SetXMLStringToCombobox(cXMLTypThu);
  end;

end;

function TfrmMain.SpeichernMitSonderfunktionFallsUebergeben(AList: TStrings): Boolean;
var
  StartPosSdfktSpeichern: Integer;
  ResColour: TColor;
begin
  Result := False;
  StartPosSdfktSpeichern := FSonderfktSchluesselw.IndexOf('Colour:');
  if StartPosSdfktSpeichern < 0 then
    Exit;
  StartPosSdfktSpeichern := StartPosSdfktSpeichern + 7;
  if FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('Regenbogen', True) or FSonderfktSchluesselw.Substring(StartPosSdfktSpeichern).StartsWith('LGBTIAQ+', True) then
  begin
    SaveByRichEditRainbowMode(AList);
    Exit(True);
  end;
  ResColour := GetColour(FSonderfktSchluesselw);
  Result := ResColour <> clNone;
  if Result then
    SaveByRichEdit(ResColour, AList);
end;

procedure TfrmMain.ZeigeHilfeDialog;
begin
  MessageDlg('Dieses Programm lädt den aktuellen Notfallplan der Landesapotheker*innenkammer herunter. Dazu benötigen Sie eine Api-URL, welche Sie direkt bei der für Sie zuständigen Apotheker*innenkammer erhalten. ' +
    'Diese fügen Sie in das Feld "Api-Url" ein.' + sLineBreak + 'Nun können Sie, falls gewünscht, Einstellungen vornehmen.' + sLineBreak + 'Klicken Sie anschließend der Reihe nach auf "Lade Daten aus dem Internet", um ' +
    'die XML-Daten auf Ihren Computer zu kopieren (benötigt eine Internetverbindung), auf "Daten anzeigen" um die Daten anzuzeigen und auf "Daten speichern", um die Daten abzuspeichern.',
    TMsgDlgType.mtInformation, [TMsgDlgBtn.mbClose], 0);
end;

{ TSettingsManager }

class function TSettingsManager.CreateDefaultSettingsObj: TSettingsObj;
begin
  Result := TSettingsObj.Create;
  Result.ApiUrlSpeichern := False;
  Result.EinstellungenSpeichern := False;
  Result.AusgabedatenBuendeln := True;
  Result.XMLDateiBehalten := True;
  Result.DoppelteEintraegeZusammenfassen := False;
  Result.Kompakt := True;
  Result.AltenModusNachstellen := False;
  Result.XMLTyp := xmltUnd;
  Result.KodierungDL := TEncoding.UTF8;
  Result.KodierungDS := TEncoding.ANSI;
end;

class function TSettingsManager.GetKodierungForString(
  const AKodierung: string): TEncoding;
begin
  Result := TEncoding.Default;
  if SameText(AKodierung, cKodierungAscii) then
    Result := TEncoding.ANSI
  else if SameText(AKodierung, cKodierungAnsi) then
    Result := TEncoding.ASCII
  else if SameText(AKodierung, cKodierungUTF7) then
    Result := TEncoding.UTF7
  else if SameText(AKodierung, cKodierungUTF8) then
    Result := TEncoding.UTF8
  else if SameText(AKodierung, cKodierungUnicode) then
    Result := TEncoding.Unicode
  else if SameText(AKodierung, cKodierungBEUnicode) then
    Result := TEncoding.BigEndianUnicode;
end;

class function TSettingsManager.GetNameForKodierung(
  AKodierung: TEncoding): string;
begin
  if AKodierung = TEncoding.ASCII then
    Result := cKodierungAscii
  else if AKodierung = TEncoding.ANSI then
    Result := cKodierungAnsi
  else if AKodierung = TEncoding.UTF7 then
    Result := cKodierungUTF7
  else if AKodierung = TEncoding.UTF8 then
    Result := cKodierungUTF8
  else if AKodierung = TEncoding.Unicode then
    Result := cKodierungUnicode
  else if AKodierung = TEncoding.BigEndianUnicode then
    Result := cKodierungBEUnicode;
end;

class function TSettingsManager.GetNameForXMLTyp(AXMLTyp: TXMLType): string;
begin
  Result := '';
  case AXMLTyp of
    xmltBWU: Result := cXMLTypBwu;
    xmltBay: Result := cXMLTypBay;
    xmltNRW: Result := cXMLTypNrw;
    xmltSWH: Result := cXMLTypSwh;
    xmltTHU: Result := cXMLTypThu;
  end;
end;

class function TSettingsManager.GetXMLTypeForString(
  const AXMLText: string): TXMLType;
begin
  Result := xmltUnd;
  if SameText(AXMLText, cXMLTypBwu) then
    Result := xmltBWU
  else if SameText(AXMLText, cXMLTypBay) then
    Result := xmltBay
  else if SameText(AXMLText, cXMLTypNrw) then
    Result := xmltNRW
  else if SameText(AXMLText, cXMLTypSwh) then
    Result := xmltSWH
  else if SameText(AXMLText, cXMLTypThu) then
    Result := xmltTHU;
end;

class function TSettingsManager.LoadSettings(
  const AFilePath: string): TSettingsObj;
var
  Einstellungen: TStringList;
  I: Integer;
begin
  if FileExists(AFilePath) then
  begin
    Result := TSettingsManager.CreateDefaultSettingsObj();
    try
    Einstellungen := TStringList.Create();
    try
      Einstellungen.LoadFromFile(AFilePath);
      Result.EinstellungenSpeichern := True;
      for I := 0 to Einstellungen.Count - 1 do
      begin
        if Einstellungen[I].StartsWith(cApiUrlSpeichernText) then
          Result.ApiUrlSpeichern := StrToBool(Einstellungen[I].Substring(Length(cApiUrlSpeichernText) + 1))
        else if Einstellungen[I].StartsWith(cXMLDateiBehaltenText) then
          Result.XMLDateiBehalten := StrToBool(Einstellungen[I].Substring(Length(cXMLDateiBehaltenText) + 1))
        else if Einstellungen[I].StartsWith(cAusgDatBuendelnText) then
          Result.AusgabedatenBuendeln := StrToBool(Einstellungen[I].Substring(Length(cAusgDatBuendelnText) + 1))
        else if Einstellungen[I].StartsWith(cDoppelteEintrZusfasText) then
          Result.DoppelteEintraegeZusammenfassen := StrToBool(Einstellungen[I].Substring(Length(cDoppelteEintrZusfasText) + 1))
        else if Einstellungen[I].StartsWith(cKompaktText) then
          Result.Kompakt := StrToBool(Einstellungen[I].Substring(Length(cKompaktText) + 1))
        else if Einstellungen[I].StartsWith(cAltenModusNachstellen) then
          Result.AltenModusNachstellen := True   
        else if Einstellungen[I].StartsWith(cApiUrl) then
          Result.ApiUrl := Einstellungen[I].Substring(Length(cApiUrl) + 1)
        else if Einstellungen[I].StartsWith(cXMLTyp) then
          Result.XMLTyp := GetXMLTypeForString(Einstellungen[I].Substring(Length(cXMLTyp) + 1))
        else if Einstellungen[I].StartsWith(cKodierungDL) then
          Result.KodierungDL := GetKodierungForString(Einstellungen[I].Substring(Length(cKodierungDL) + 1))
        else if Einstellungen[I].StartsWith(cKodierungDS) then
          Result.KodierungDS := GetKodierungForString(Einstellungen[I].Substring(Length(cKodierungDS) + 1));
      end;
    finally
      Einstellungen.Free;
    end;
    except
      on E: Exception do
      begin
        Result.Free;
        //Result := nil;
        raise;
      end;
    end;
  end
  else
    Result := TSettingsManager.CreateDefaultSettingsObj();
end;

class procedure TSettingsManager.SaveSettings(const AFilePath: string;
  ASettingsObj: TSettingsObj);
var
  Einstellungen: TStringList;
begin
  Einstellungen := TStringList.Create;
  try
    Einstellungen.Add(cEinstSpeichernText + '=' + BoolToStr(ASettingsObj.EinstellungenSpeichern));
    Einstellungen.Add(cApiUrlSpeichernText + '=' + BoolToStr(ASettingsObj.ApiUrlSpeichern));
    Einstellungen.Add(cAusgDatBuendelnText + '=' + BoolToStr(ASettingsObj.AusgabedatenBuendeln));
    Einstellungen.Add(cXMLDateiBehaltenText + '=' + BoolToStr(ASettingsObj.XMLDateiBehalten));
    Einstellungen.Add(cDoppelteEintrZusfasText + '=' + BoolToStr(ASettingsObj.DoppelteEintraegeZusammenfassen));
    Einstellungen.Add(cKompaktText + '=' + BoolToStr(ASettingsObj.Kompakt));
    Einstellungen.Add(cAltenModusNachstellen);
    Einstellungen.Add(cApiUrl + '=' + ASettingsObj.ApiUrl);
    Einstellungen.Add(cXMLTyp + '=' + GetNameForXMLTyp(ASettingsObj.XMLTyp));
    Einstellungen.Add(cKodierungDL + '=' + GetNameForKodierung(ASettingsObj.KodierungDL));
    Einstellungen.Add(cKodierungDS + '=' + GetNameForKodierung(ASettingsObj.KodierungDS));
    Einstellungen.SaveToFile(AFilePath);
  finally
    Einstellungen.Free;
  end;
end;

{ TSettingsObj }

constructor TSettingsObj.Create;
begin
  inherited Create();
end;

constructor TSettingsObj.Create(AEinstellungenSpeichern, AApiUrlSpeichern,
  AXMLDateienBehalten, AAusgabedatenBuendeln, ADoppelteEintraegeZusammenfassen, AAltenModusNachstellen, AKompakt: Boolean;
  AXMLTyp: TXMLType; AKodierungDL, AKodierungDS: TEncoding);
begin
  inherited Create();
  EinstellungenSpeichern := AEinstellungenSpeichern;
  ApiUrlSpeichern := AApiUrlSpeichern;
  XMLDateiBehalten := AXMLDateienBehalten;
  AusgabedatenBuendeln := AAusgabedatenBuendeln;
  DoppelteEintraegeZusammenfassen := ADoppelteEintraegeZusammenfassen;
  FAltenModusNachstellen := AAltenModusNachstellen;
  Kompakt := AKompakt;
  XMLTyp := AXMLTyp;
  FKodierungDL := AKodierungDL;
  FKodierungDS := AKodierungDS;
end;

function TSettingsObj.GetApiUrlSpeichern: Boolean;
begin
  Result := FApiUrlSpeichern and FEinstellungenSpeichern;
end;

function TSettingsObj.GetDoppelteEintraegeZusammenfassen: Boolean;
begin
  Result := FDoppelteEintraegeZusammenfassen and AusgabedatenBuendeln;
end;

{ TKodierungsHelfer }

class function TKodierungsHelfer.CreateStringListNewEncoding(AAlteKodierung,
  ANeueKodierung: TEncoding; AStringList: TStrings): TStringList;
var
  BisherigeBytes, NeueBytes: TBytes;
  I: Integer;
begin
  Result := TStringList.Create();
  try
    if AAlteKodierung = ANeueKodierung then
    begin
      Result.Assign(AStringList);
      Exit;
    end;
    for I := 0 to AStringList.Count - 1 do
    begin
      if AAlteKodierung = TEncoding.ASCII then
        BisherigeBytes := TEncoding.ASCII.GetBytes(AStringList[I])
      else if AAlteKodierung = TEncoding.ANSI then
        BisherigeBytes := TEncoding.ANSI.GetBytes(AStringList[I])
      else if AAlteKodierung = TEncoding.UTF7 then
        BisherigeBytes := TEncoding.UTF7.GetBytes(AStringList[I])
      else if AAlteKodierung = TEncoding.UTF8 then
        BisherigeBytes := TEncoding.UTF8.GetBytes(AStringList[I])
      else if AAlteKodierung = TEncoding.Unicode then
        BisherigeBytes := TEncoding.Unicode.GetBytes(AStringList[I])
      else if AAlteKodierung = TEncoding.BigEndianUnicode then
        BisherigeBytes := TEncoding.BigEndianUnicode.GetBytes(AStringList[I])
      else
        BisherigeBytes := TEncoding.Default.GetBytes(AStringList[I]);
      NeueBytes := TEncoding.Convert(AAlteKodierung, ANeueKodierung, BisherigeBytes);
      if ANeueKodierung = TEncoding.ASCII then
        Result.Add(TEncoding.ASCII.GetString(NeueBytes))
      else if ANeueKodierung = TEncoding.ANSI then
        Result.Add(TEncoding.ANSI.GetString(NeueBytes))
      else if ANeueKodierung = TEncoding.UTF7 then
        Result.Add(TEncoding.UTF7.GetString(NeueBytes))
      else if ANeueKodierung = TEncoding.UTF8 then
        Result.Add(TEncoding.UTF8.GetString(NeueBytes))
      else if ANeueKodierung = TEncoding.Unicode then
        Result.Add(TEncoding.Unicode.GetString(NeueBytes))
      else if ANeueKodierung = TEncoding.BigEndianUnicode then
        Result.Add(TEncoding.BiGEndianUnicode.GetString(NeueBytes))
      else
        Result.Add(TEncoding.Default.GetString(NeueBytes));
    end;
  except
    on E: Exception do
    begin
      Result.Free;
      raise;
    end;
  end;
end;

end.
