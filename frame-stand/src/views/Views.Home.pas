unit Views.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TFrameHome = class(TFrame)
    retContent: TRectangle;
    retHeader: TRectangle;
    imgFrameStand: TImage;
    txtCargo: TText;
    Text1: TText;
    imgLogoAdriano: TImage;
    imgLogoApoio: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
