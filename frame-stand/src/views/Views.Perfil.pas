unit Views.Perfil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Effects, FMX.Filter.Effects,
  FMX.Layouts, FMX.Controls.Presentation;

type
  TFramePerfil = class(TFrame)
    retContent: TRectangle;
    lytEmail: TLayout;
    lblEmailTitle: TLabel;
    lblEmail: TLabel;
    lytEndereco: TLayout;
    lblEnderecoTitle: TLabel;
    lblEndereco: TLabel;
    lblCEP: TLabel;
    lblCidade: TLabel;
    lytTelefone: TLayout;
    lblTelefoneTitle: TLabel;
    lblTelefone: TLabel;
    lytInformacoes: TLayout;
    retInformacoes: TRectangle;
    lblInformacoes: TLabel;
    retDadosUsuário: TRectangle;
    txtCargo: TText;
    lytFoto: TLayout;
    imgUsuario: TCircle;
    lytOpcoes: TLayout;
    ActionGridPanelLayout: TGridPanelLayout;
    lytLeftGrid: TLayout;
    crlLeftGrid: TCircle;
    lytCenterGrid: TLayout;
    lytRightGrid: TLayout;
    crlRigthGrid: TCircle;
    UserLayout: TLayout;
    lblNomeTitle: TLabel;
    lblNome: TLabel;
    crlCenterGrid: TCircle;
    imgTelefone: TPath;
    imgCamera: TPath;
    imgEmail: TPath;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
