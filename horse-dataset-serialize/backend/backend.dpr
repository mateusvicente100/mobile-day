program backend;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  System.SysUtils,
  Services.Cliente in 'src\services\Services.Cliente.pas' {ServiceCliente: TDataModule},
  Controllers.Cliente in 'src\controllers\Controllers.Cliente.pas';

begin
  THorse
    .Use(Jhonson)
    .Use(HandleException);
  Controllers.Cliente.Registry;
  THorse.Listen;
end.
