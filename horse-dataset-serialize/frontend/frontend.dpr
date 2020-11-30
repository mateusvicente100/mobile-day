program frontend;

uses
  System.StartUpCopy,
  FMX.Forms,
  Services.Cliente in 'src\services\Services.Cliente.pas' {ServiceCliente: TDataModule},
  Views.Cliente in 'src\views\Views.Cliente.pas' {FrmCliente},
  Providers.Frames.Cliente in 'src\providers\Providers.Frames.Cliente.pas' {FrameCliente: TFrame},
  Providers.Types in 'src\providers\Providers.Types.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.Run;
end.
