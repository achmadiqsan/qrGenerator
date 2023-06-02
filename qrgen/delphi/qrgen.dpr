program qrgen;

uses
  Forms,
  main in 'main.pas';

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
