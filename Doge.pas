unit Doge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Doge: TImage;
    Timer1: TTimer;
    Cookies: TLabel;
    IShibe: TImage;
    Shibes: TLabel;
    CookiesPS: TLabel;
    PriceShibes: TLabel;
    ShibesHack: TButton;
    CookieHack: TButton;
    LShibesCPS: TLabel;
    PageControl1: TPageControl;
    Funcionarios: TTabSheet;
    ScrollBox1: TScrollBox;
    Conquistas: TTabSheet;
    Sobre: TTabSheet;
    LClicks: TLabel;
    BShibeUp: TButton;
    ScrollShibeUp: TScrollBox;
    ImageAchive1: TImage;
    ShibeUpgrades: TLabel;
    LabelAchive1: TLabel;
    LDescAchiev1: TLabel;
    ImageAchiev1Off: TImage;
    LPriceAchiev1: TLabel;
    Versao: TLabel;
    ImageShibeOff: TImage;
    procedure DogeClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IShibeClick(Sender: TObject);
    procedure CookieHackClick(Sender: TObject);
    procedure ShibesHackClick(Sender: TObject);
    procedure BShibeUpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  cookie,cps : extended;
  //Shibes
  nshibes,shibescps : extended;
  pshibes : extended = 10;
  //Temporizador
  time,clicks: Integer;

implementation

{$R *.dfm}

//==== Função da Versão do Aplicativo ==========================================
Function VersaoExe: String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := Application.ExeName;
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
//==============================================================================
end;

//==== Upgrades dos Shibes =====================================================
procedure TForm1.BShibeUpClick(Sender: TObject);
begin
ScrollShibeUp.Visible:= not ScrollShibeUp.Visible;
end;

//==== Hack de Cookie ==========================================================
procedure TForm1.CookieHackClick(Sender: TObject);
begin
cookie:=9999999999;
end;

//==== Fazendo Cookies com seu Doge ;D =========================================
procedure TForm1.DogeClick(Sender: TObject);
begin
cookie:=cookie+1;
clicks:=clicks+1;
end;


//==== Criando o Form ==========================================================
procedure TForm1.FormCreate(Sender: TObject);
begin
LDescAchiev1.Caption:='Aumenta a produção de ' + #13#10 + 'Cookies por 2';
Versao.Caption:='[ '+VersaoExe+' ]';
end;


procedure TForm1.IShibeClick(Sender: TObject);
begin
//==== Comprando Escreavos Shibessexuais =======================================
if cookie>=pshibes then
  begin
    cookie:=cookie-pshibes;                              //    Pagando os Shibes
    nshibes:=nshibes+1;                                  //   Contando os Shibes
    pshibes:=pshibes*1.125;                              //           Novo preço
  end;
end;


procedure TForm1.ShibesHackClick(Sender: TObject);
begin
nshibes:=9999999999;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
//==== Calculando os Cookies por segundo =======================================
if time=100 then
  begin
    shibescps:=(nshibes*0.2146);
    cps:=shibescps;
    cookie:=cookie+cps;
    time:=0;
  end;
time:=time+1;

//== Atualização de Valores ==
CookiesPS.Caption:='Por Segundo: '+floattostrF(cps, ffNumber, 19,1);
Cookies.Caption:=floattostrF(cookie, ffNumber, 19,0)+' Cookies';
Shibes.Caption:='Shibes: '+floattostrf(nshibes, ffNumber, 19,0);  //Qtd de Shibe
LShibesCPS.Caption:='Cookies p/ s: '+floattostrf(shibescps, ffNumber, 19,1);
PriceShibes.Caption:='Preço: '+Floattostrf(pshibes,ffNumber, 19,0);    //PShibes
LClicks.Caption:='Clicks: '+inttostr(clicks);

Form1.Caption:= 'Doge Cookie [' + floattostrF(cookie, ffNumber, 19,0) + ']';

//==== Verificando Possibilidade de Compra =====================================
// Shibes
if cookie>=pshibes then ImageShibeOff.Visible:=False else ImageShibeOff.Visible:=True;
// Shibes Upgrades
if cookie>=400 then ImageAchiev1Off.Visible:=False else ImageAchiev1Off.Visible:=True;


end;

end.
