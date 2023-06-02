unit main;
(*
  QR Code Generator Delphi example
    main.pas - main unit
    (c)2012 Matthew Hipkin <http://www.matthewhipkin.co.uk>

  This example was created using Delphi 7, some more recent versions of Delphi
  have native PNG support and may not require the pngimage package included
  within this archive. 
*)
interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin, ExtDlgs, pngimage, httpsend, XPMan, ShellApi;

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
    XPManifest1: TXPManifest;
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

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.btnGenerateClick(Sender: TObject);
var
  HTTP: THTTPSend;
  url: String;
  URLData: String;
  png: TPNGObject;
begin
  // URL to post to
  url := 'http://chart.apis.google.com/chart';
  // Generate POST data
  URLData := 'chs='+IntToStr(editWidth.Value)+'x'+IntToStr(editHeight.Value)+'&';
  URLData := URLData + 'cht=qr&chld=M&';
  URLData := URLData + 'chl=' + textText.Text;
  // Create HTTP Object, connect and post
  HTTP := THTTPSend.Create;
  png := TPNGObject.Create;  
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
    png.LoadFromStream(Http.Document);
    imgQR.Picture.Assign(png);
  except
    showmessage('Unable to load retrieved image data');
    exit;
  end;
  // Pop up save dialog
  if SavePictureDialog1.Execute then
    png.SaveToFile(SavePictureDialog1.FileName);
  // Clean up
  HTTP.Free;
  png.Free;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
var
  png: TPNGObject;
begin
  png := TPNGObject.Create;
  png.Assign(imgQR.Picture);
  if SavePictureDialog1.Execute then
    png.SaveToFile(SavePictureDialog1.FileName);
  png.Free;    
end;

procedure TfrmMain.Label4Click(Sender: TObject);
begin
  ShellExecute(handle, Nil, 'http://www.matthewhipkin.co.uk/', '', '.', Sw_show);
end;

end.

