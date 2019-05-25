program Doge_Cookie;



uses
  Vcl.Forms,
  Doge in 'Doge.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
