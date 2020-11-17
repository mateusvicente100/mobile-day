unit Views.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Layouts, FMX.MultiView,
  SubjectStand, FrameStand, Views.Home, Views.Perfil;

type
  TFrmPrincipal = class(TForm)
    retHeader: TRectangle;
    retFooter: TRectangle;
    txtFooter: TText;
    btnMenu: TSpeedButton;
    imgMenu: TPath;
    mvwPrincipal: TMultiView;
    vsbMenuMenu: TVertScrollBox;
    retMenuContent: TRectangle;
    retSair: TRectangle;
    imgSair: TPath;
    lblSair: TText;
    lineSeparator: TLine;
    retPerfil: TRectangle;
    retHome: TRectangle;
    imgHome: TPath;
    lblHome: TText;
    btnSair: TSpeedButton;
    btnHome: TSpeedButton;
    btnPerfil: TSpeedButton;
    imgPerfil: TPath;
    lblPerfil: TText;
    lytContent: TLayout;
    FrameStand: TFrameStand;
    StyleBook: TStyleBook;
    procedure btnHomeClick(Sender: TObject);
    procedure btnPerfilClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ChangeFrame<T: TFrame>;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}


procedure TFrmPrincipal.btnHomeClick(Sender: TObject);
begin
  ChangeFrame<TFrameHome>;
end;

procedure TFrmPrincipal.btnPerfilClick(Sender: TObject);
begin
  ChangeFrame<TFramePerfil>;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  ChangeFrame<TFrameHome>;
end;

procedure TFrmPrincipal.ChangeFrame<T>;
var
  LFrame: TFrameInfo<T>;
begin
  FrameStand.HideAndCloseAll();
  LFrame := FrameStand.New<T>;
  LFrame.Frame.Align := TAlignLayout.Client;
  LFrame.Show;
  mvwPrincipal.HideMaster;
end;

end.
