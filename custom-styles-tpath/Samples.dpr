program Samples;

uses
  System.StartUpCopy,
  FMX.Forms,
  Views.Principal in 'src\Views.Principal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
