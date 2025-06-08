program ApothekenNotdienstPlan;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF}
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  LizenzdialogFrm in 'LizenzdialogFrm.pas' {frmLizenzdialog},
  ErweiterteEinstellungenFrm in 'ErweiterteEinstellungenFrm.pas' {frmErweiterteEInstellungen},
  TelefonnumernAnzeigenFrm in 'TelefonnumernAnzeigenFrm.pas' {frmNotfallTelefonNummern},
  FarbauswahlFrm in 'FarbauswahlFrm.pas' {frmFarben},
  SysUtils, StrUtils;

{$R *.res}

var
  I: Integer;
  ExecDir: Boolean;
  PrintDir: Boolean;
  SchreibeLogDatei: Boolean;
  BehalteAlteLogdatei: Boolean;
  Druckername: string;
  Dateiname: string;
  LogDateiName: string;

begin
  ExecDir := False;
  PrintDir := False;
  BehalteAlteLogdatei := False;
  SchreibeLogDatei := False;
  Druckername := '';
  Dateiname := '';
  LogDateiName := '';
  for I := 0 to ParamCount do
  begin
    if SameText(Trim(ParamStr(I)), 'ExecuteDirect') then
      ExecDir := True
    else if SameText(Trim(ParamStr(I)), 'Print') then
      PrintDir := True
    else if StartsText('Print:', Trim(ParamStr(I))) then
    begin
      Druckername := Copy(Trim(ParamStr(I)), 7, 9999);
      PrintDir := True;
    end
    else if StartsText('SaveTo:', Trim(ParamStr(I))) then
    begin
      Dateiname := Copy(Trim(ParamStr(I)), 8, 9999);
    end
    else if SameText(Trim(ParamStr(I)), 'Log') then
      SchreibeLogDatei := True
    else if StartsText('Log:', Trim(ParamStr(I))) then
    begin
      LogDateiName := Copy(Trim(ParamStr(I)), 5, 9999);
      SchreibeLogDatei := True;
    end
    else if SameText(Trim(ParamStr(I)), 'AppendLog') then
      BehalteAlteLogdatei := True;
  end;
  if ExecDir then
  begin
    TfrmMain.ExecWithoutDialogue(PrintDir, Druckername, Dateiname, SchreibeLogDatei, BehalteAlteLogdatei, LogDateiName);
    Halt;
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
