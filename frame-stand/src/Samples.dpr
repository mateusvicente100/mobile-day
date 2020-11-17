program Samples;

uses
  System.StartUpCopy,
  FMX.Forms,
  Views.Principal in 'views\Views.Principal.pas' {FrmPrincipal},
  Views.Home in 'views\Views.Home.pas' {FrameHome: TFrame},
  Views.Perfil in 'views\Views.Perfil.pas' {FramePerfil: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
