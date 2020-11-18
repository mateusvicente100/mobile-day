unit Views.Cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Edit,
  Providers.Frames.Cliente, Services.Cliente;

type
  TFrmCliente = class(TForm)
    retHeader: TRectangle;
    btnAdd: TSpeedButton;
    imgAdd: TPath;
    retFooter: TRectangle;
    txtFooter: TText;
    lytContent: TLayout;
    tclCadastro: TTabControl;
    tabPesquisa: TTabItem;
    tabCadastro: TTabItem;
    Nome: TLabel;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    lblSobreNome: TLabel;
    edtEmail: TEdit;
    lblEmail: TLabel;
    retSalvar: TRectangle;
    btnSalvar: TSpeedButton;
    retCancelar: TRectangle;
    btnCancelar: TSpeedButton;
    lineEmail: TLine;
    lineNome: TLine;
    lineSobrenome: TLine;
    vsbPesquisa: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FService: TServiceCliente;
    procedure Salvar;
    procedure Listar;
    procedure Incluir;
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.fmx}

procedure TFrmCliente.btnAddClick(Sender: TObject);
begin
  Incluir;
end;

procedure TFrmCliente.btnCancelarClick(Sender: TObject);
begin
  tclCadastro.Previous();
end;

procedure TFrmCliente.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TFrmCliente.FormCreate(Sender: TObject);
begin
  FService := TServiceCliente.Create(Self);
end;

procedure TFrmCliente.FormDestroy(Sender: TObject);
begin
  FService.Free;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  tclCadastro.ActiveTab := tabPesquisa;
  Listar;
end;

procedure TFrmCliente.Incluir;
begin
  edtNome.Text := EmptyStr;
  edtSobrenome.Text := EmptyStr;
  edtEmail.Text := EmptyStr;
  tclCadastro.Next();
end;

procedure TFrmCliente.Listar;
var
  LFrame: TFrameCliente;
  I: Integer;
begin
  vsbPesquisa.BeginUpdate;
  try
    try
      for I := Pred(vsbPesquisa.Content.ControlsCount) downto 0 do
        vsbPesquisa.Content.Controls[I].DisposeOf;
      FService.Listar;
      FService.mtPesquisa.First;
      while not FService.mtPesquisa.Eof do
      begin
        LFrame := TFrameCliente.Create(vsbPesquisa);
        LFrame.Parent := vsbPesquisa;
        LFrame.Align := TAlignLayout.Top;
        LFrame.Position.X := vsbPesquisa.Content.ControlsCount * LFrame.Height;
        LFrame.Name := LFrame.ClassName + FService.mtPesquisaid.AsString;
        LFrame.lblNome.Text := Format('%s %s', [FService.mtPesquisanome.AsString, FService.mtPesquisasobrenome.AsString]);
        LFrame.lblEmail.Text := FService.mtPesquisaemail.AsString;
        FService.mtPesquisa.Next;
      end;
    except
      on E:Exception do
        ShowMessage(E.Message);
    end;
  finally
    vsbPesquisa.EndUpdate;
  end;
end;

procedure TFrmCliente.Salvar;
begin
  try
    FService.mtCadastro.EmptyDataSet;
    FService.mtCadastro.Append;
    FService.mtCadastronome.AsString := edtNome.Text;
    FService.mtCadastrosobrenome.AsString := edtSobrenome.Text;
    FService.mtCadastroemail.AsString := edtEmail.Text;
    FService.mtCadastro.Post;
    FService.Salvar;
    Listar;
    tclCadastro.Previous();
  except
    on E:Exception do
      ShowMessage(E.Message);
  end;
end;

end.
