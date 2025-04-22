unit ErweiterteEinstellungenFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList;

type
  TfrmErweiterteEinstellungen = class(TForm)
    rgKodierungDL: TRadioGroup;
    rgKodierungDS: TRadioGroup;
    btnSpeichern: TButton;
    btnSchliessen: TButton;
    btnXMLDateiLoeschen: TButton;
    btnEinstellungsdateiLoeschen: TButton;
    btnAllesLoeschen: TButton;
    shpAllesLoeschenStatus: TShape;
    edtSonderfunktionen: TEdit;
    lblSonderfunktionenSchluesselwort: TLabel;
    btnApoSichDatLoeschen: TButton;
    ActionList1: TActionList;
    actZeigeFarbdialog: TAction;
    procedure btnXMLDateiLoeschenClick(Sender: TObject);
    procedure btnEinstellungsdateiLoeschenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAllesLoeschenClick(Sender: TObject);
    procedure btnApoSichDatLoeschenClick(Sender: TObject);
    procedure actZeigeFarbdialogExecute(Sender: TObject);
  private
    FAllesLoeschen: Boolean;
    function GetKodierungDL: TEncoding;
    function GetKodierungDS: TEncoding;
    procedure SetKodierungDL(const Value: TEncoding);
    procedure SetKodierungDS(const Value: TEncoding);
    procedure SetAllesLoeschen(const Value: Boolean);
    function GetSonderfktSchluesselw: string;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    property KodierungDL: TEncoding read GetKodierungDL write SetKodierungDL;
    property KodierungDS: TEncoding read GetKodierungDS write SetKodierungDS;
    property AllesLoeschen: Boolean read FAllesLoeschen write SetAllesLoeschen;
    property SonderfktSchluesselw: string read GetSonderfktSchluesselw;
  end;

const
  cNameXMLDatei = 'Apothekennotdienstplan.xml';
  cNameEinstellungsDatei = 'Apothekennotdienstplan.config';
  cNameMDBDatei = 'Apothekennotdienstplan.mdb';

implementation

uses
  System.UITypes, FarbauswahlFrm;

{$R *.dfm}

{ TfrmErweiterteEinstellungen }

procedure TfrmErweiterteEinstellungen.actZeigeFarbdialogExecute(
  Sender: TObject);
begin
  with TfrmFarben.Create(nil) do
  begin
    try
      ShowModal();
    finally
      Free;
    end;
  end;
end;

procedure TfrmErweiterteEinstellungen.btnAllesLoeschenClick(Sender: TObject);
begin
  if AllesLoeschen then
  begin
    case MessageDlg('Wenn Sie fortfahren, werden die Daten des Programmes nicht gelöscht.', TMsgDlgType.mtConfirmation, mbOKCancel, 0) of
      mrOK: AllesLoeschen := False;
      mrCancel: Exit;
    end;
  end
  else
  begin
    case MessageDlg('Wenn Sie fortfahren, werden alle Daten des Programms (die XML-Datei, die Einstellungsdatei, die Apothekendatensicherungsdatei und die Exe-Datei selbst) nach dem schließen ' +
      'des Programms gelöscht. Dieser Schritt kann nur vor dem schließen des Programms rückgängig gemacht werden!', TMsgDlgType.mtConfirmation, mbYesNoCancel, 0) of
      mrYes: AllesLoeschen := True;
      mrNo: Exit;
      mrCancel: Exit;
    end;
  end;
end;

procedure TfrmErweiterteEinstellungen.btnApoSichDatLoeschenClick(
  Sender: TObject);
begin
  if not FileExists(cNameMDBDatei) then
  begin
    MessageDlg('Es ist keine Apothekendatensicherungsdatei gespeichert, die gelöscht werden könnte.', TMsgDlgType.mtError, [mbClose], 0);
    Exit;
  end;
  if MessageDlg('Soll die Apothekendatensicherungsdatei wirklich gelöscht werden? Dieser Schritt kann nicht rückgängig gemacht werden.',
    TMsgDlgType.mtConfirmation, [mbClose, TMsgDlgBtn.mbCancel], 0) = mrOk then
  begin
    DeleteFile(cNameMDBDatei);
  end;
end;

procedure TfrmErweiterteEinstellungen.btnEinstellungsdateiLoeschenClick(
  Sender: TObject);
begin
  if not FileExists(cNameEinstellungsDatei) then
  begin
    MessageDlg('Es ist keine Einstellungsdatei gespeichert, die gelöscht werden könnte.', TMsgDlgType.mtError, [mbClose], 0);
    Exit;
  end;
  if MessageDlg('Soll die Einstellungsdatei wirklich gelöscht werden? Dieser Schritt kann nicht rückgängig gemacht werden.',
    TMsgDlgType.mtConfirmation, [mbClose, TMsgDlgBtn.mbCancel], 0) = mrOk then
  begin
    DeleteFile(cNameEinstellungsDatei);
  end;
end;

procedure TfrmErweiterteEinstellungen.btnXMLDateiLoeschenClick(Sender: TObject);
begin
  if not FileExists(cNameXMLDatei) then
  begin
    MessageDlg('Es ist keine XML-Datei gespeichert, die gelöscht werden könnte.', TMsgDlgType.mtError, [mbClose], 0);
    Exit;
  end;
  if MessageDlg('Soll die XML-Datei wirklich gelöscht werden? Dieser Schritt kann nicht rückgängig gemacht werden.',
    TMsgDlgType.mtConfirmation, [mbClose, TMsgDlgBtn.mbCancel], 0) = mrOk then
  begin
    DeleteFile(cNameXMLDatei);
  end;
end;

procedure TfrmErweiterteEinstellungen.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;
end;

function TfrmErweiterteEinstellungen.GetKodierungDL: TEncoding;
begin
  Result := TEncoding.Default;
  case rgKodierungDL.ItemIndex of
    0: Result := TEncoding.ANSI;
    1: Result := TEncoding.ASCII;
    2: Result := TEncoding.UTF7;
    3: Result := TEncoding.UTF8;
    4: Result := TEncoding.Unicode;
    5: Result := TEncoding.BigEndianUnicode;
  end;
end;

function TfrmErweiterteEinstellungen.GetKodierungDS: TEncoding;
begin
  Result := TEncoding.Default;
  case rgKodierungDS.ItemIndex of
    0: Result := TEncoding.ANSI;
    1: Result := TEncoding.ASCII;
    2: Result := TEncoding.UTF7;
    3: Result := TEncoding.UTF8;
    4: Result := TEncoding.Unicode;
    5: Result := TEncoding.BigEndianUnicode;
  end;
end;

function TfrmErweiterteEinstellungen.GetSonderfktSchluesselw: string;
begin
  Result := edtSonderfunktionen.Text;
end;

procedure TfrmErweiterteEinstellungen.SetAllesLoeschen(const Value: Boolean);
begin
  FAllesLoeschen := Value;
  if not Value then
  begin
    shpAllesLoeschenStatus.Brush.Color := clGreen;
    btnAllesLoeschen.Caption := '&Programm löschen';
  end
  else
  begin
    shpAllesLoeschenStatus.Brush.Color := clRed;
    btnAllesLoeschen.Caption := '&Programm beibehalten';
  end;
end;

procedure TfrmErweiterteEinstellungen.SetKodierungDL(const Value: TEncoding);
begin
  if Value = TEncoding.ANSI then
    rgKodierungDL.ItemIndex := 0
  else if Value = TEncoding.ASCII then
    rgKodierungDL.ItemIndex := 1
  else if Value = TEncoding.UTF7 then
    rgKodierungDL.ItemIndex := 2
  else if Value = TEncoding.UTF8 then
    rgKodierungDL.ItemIndex := 3
  else if Value = TEncoding.Unicode then
    rgKodierungDL.ItemIndex := 4
  else if Value = TEncoding.BigEndianUnicode then
    rgKodierungDL.ItemIndex := 5;
end;

procedure TfrmErweiterteEinstellungen.SetKodierungDS(const Value: TEncoding);
begin
  if Value = TEncoding.ANSI then
    rgKodierungDS.ItemIndex := 0
  else if Value = TEncoding.ASCII then
    rgKodierungDS.ItemIndex := 1
  else if Value = TEncoding.UTF7 then
    rgKodierungDS.ItemIndex := 2
  else if Value = TEncoding.UTF8 then
    rgKodierungDS.ItemIndex := 3
  else if Value = TEncoding.Unicode then
    rgKodierungDS.ItemIndex := 4
  else if Value = TEncoding.BigEndianUnicode then
    rgKodierungDS.ItemIndex := 5;
end;

end.
