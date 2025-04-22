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
  FarbauswahlFrm in 'FarbauswahlFrm.pas' {frmFarben};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
