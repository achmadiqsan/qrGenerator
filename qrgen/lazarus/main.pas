unit main;
(*
  QR Code Generator Lazarus/FreePascal example
    main.pas - main unit
    (c)2012 Matthew Hipkin <http://www.matthewhipkin.co.uk>
*)
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin, ExtDlgs, LCLIntF, httpsend;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnGenerate: TButton;
    btnSave: TButton;
    imgQR: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    textText: TMemo;
    SavePictureDialog1: TSavePictureDialog;
    editWidth: TSpinEdit;
    editHeight: TSpinEdit;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnGenerateClick(Sender: TObject);
var
  HTTP: THTTPSend;
  url: String;
  URLData: String;
begin
  // URL to post to
  url := 'http://chart.apis.google.com/chart';
  // Generate POST data
  URLData := 'chs='+IntToStr(editWidth.Value)+'x'+IntToStr(editHeight.Value)+'&';
  URLData := URLData + 'cht=qr&chld=M&';
  URLData := URLData + 'chl=' + textText.Text;
  // Create HTTP Object, connect and post
  HTTP := THTTPSend.Create;
  try
    HTTP.Document.Write(Pointer(URLData)^, Length(URLData));
    HTTP.MimeType := 'application/x-www-form-urlencoded';
    HTTP.HTTPMethod('POST', URL);
  except
    showmessage('Unable to connect to Google API!');
    exit;
  end;
  // Load image data
  try
    imgQR.Picture.LoadFromStream(Http.Document);
  except
    showmessage('Unable to load retrieved image data');
    exit;
  end;
  // Pop up save dialog
  if SavePictureDialog1.Execute then
    imgQR.Picture.SaveToFile(SavePictureDialog1.FileName,'png');
  // Clean up
  HTTP.Free;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    imgQR.Picture.SaveToFile(SavePictureDialog1.FileName,'png');
end;

procedure TfrmMain.Label4Click(Sender: TObject);
begin
  OpenURL('http://www.matthewhipkin.co.uk');
end;

end.

