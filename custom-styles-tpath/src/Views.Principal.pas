unit Views.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TFrmPrincipal = class(TForm)
    retFooter: TRectangle;
    txtFooter: TText;
    lytContent: TLayout;
    retHeader: TRectangle;
    StyleBook: TStyleBook;
    Button2: TButton;
    retContent: TRectangle;
    imgLogoAdriano: TImage;
    imgLogoApoio: TImage;
    btnMenu: TSpeedButton;
    imgMenu: TPath;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

end.
