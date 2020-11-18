unit Providers.Frames.Cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TFrameCliente = class(TFrame)
    retContent: TRectangle;
    lblEmail: TLabel;
    lblNome: TLabel;
    crlDelete: TCircle;
    imgDelete: TPath;
    lineSeparator: TLine;
  end;

implementation

{$R *.fmx}

end.
