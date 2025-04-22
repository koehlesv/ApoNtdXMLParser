unit TelefonnumernAnzeigenFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmNotfallTelefonNummern = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    btnNotfallfax: TButton;
    Label2: TLabel;
    btnLinkBWNotfallNrn: TButton;
    Label3: TLabel;
    btnNotfallFax2: TButton;
    btnTessRelayDienste: TButton;
    btnSchliessen: TButton;
    procedure btnNotfallfaxClick(Sender: TObject);
    procedure btnLinkBWNotfallNrnClick(Sender: TObject);
    procedure btnNotfallFax2Click(Sender: TObject);
    procedure btnTessRelayDiensteClick(Sender: TObject);
    procedure btnSchliessenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure OpenWebsite(const ALink: string);
  public
    { Public-Deklarationen }
  end;

implementation

uses
  ShellAPI, System.UITypes;

{$R *.dfm}
//

procedure TfrmNotfallTelefonNummern.btnLinkBWNotfallNrnClick(Sender: TObject);
begin
  OpenWebsite('https://im.baden-wuerttemberg.de/de/sicherheit/wichtige-rufnummern-fuer-den-notfall');
end;

procedure TfrmNotfallTelefonNummern.btnNotfallFax2Click(Sender: TObject);
begin
  OpenWebsite('https://www.notfall-telefax112.de/notfall-telefax-vorlagen.html');
end;

procedure TfrmNotfallTelefonNummern.btnNotfallfaxClick(Sender: TObject);
begin
  OpenWebsite('https://im.baden-wuerttemberg.de/fileadmin/redaktion/m-im/intern/dateien/pdf/20170706_Notfall_-_Fax_112.pdf');
end;

procedure TfrmNotfallTelefonNummern.btnSchliessenClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmNotfallTelefonNummern.btnTessRelayDiensteClick(Sender: TObject);
begin
  OpenWebsite('https://www.tess-relay-dienste.de/dienste/notruf');
end;

procedure TfrmNotfallTelefonNummern.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TfrmNotfallTelefonNummern.OpenWebsite(const ALink: string);
begin
  case ShellExecute(0, 'open', PChar(ALink), nil, nil, SW_SHOWNORMAL) of
    0: Exit;  //OK.
    SE_ERR_ACCESSDENIED: MessageDlg('Ihr Betriebssystem oder Ihr Virenscanner hat den Zugriff verweigert.', TMsgDlgType.mtError, [mbClose], 0);
    SE_ERR_NOASSOC: MessageDlg('Es ist keine Standardanwendung für https-URL''s hinterlegt.', TMsgDlgType.mtError, [mbClose], 0);
    SE_ERR_OOM: MessageDlg('Zu wenig Speicherplatz.', TMsgDlgType.mtError, [mbClose], 0);
    SE_ERR_PNF: MessageDlg('Pfad nicht gefunden.', TMsgDlgType.mtError, [mbClose], 0);
  end;
end;

end.
