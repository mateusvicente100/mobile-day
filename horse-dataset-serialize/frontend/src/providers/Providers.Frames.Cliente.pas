unit Providers.Frames.Cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, Providers.Types,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TFrameCliente = class(TFrame)
    retContent: TRectangle;
    lblEmail: TLabel;
    lblNome: TLabel;
    crlDelete: TCircle;
    imgDelete: TPath;
    lineSeparator: TLine;
    crlEdit: TCircle;
    imgEdit: TPath;
    procedure crlEditClick(Sender: TObject);
    procedure crlDeleteClick(Sender: TObject);
    procedure crlDeleteTap(Sender: TObject; const Point: TPointF);
    procedure crlEditTap(Sender: TObject; const Point: TPointF);
  private
    FId: string;
    FOnDelete: TEventCallBack;
    FOnUpdate: TEventCallBack;
  public
    property Id: string read FId write FId;
    property OnDelete: TEventCallBack read FOnDelete write FOnDelete;
    property OnUpdate: TEventCallBack read FOnUpdate write FOnUpdate;
  end;

implementation

{$R *.fmx}

procedure TFrameCliente.crlDeleteClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  if Assigned(FOnDelete) then
    FOnDelete(Self, FId);
{$ENDIF}
end;

procedure TFrameCliente.crlDeleteTap(Sender: TObject; const Point: TPointF);
begin
{$IFNDEF MSWINDOWS}
  if Assigned(FOnDelete) then
    FOnDelete(Self, FId);
{$ENDIF}
end;

procedure TFrameCliente.crlEditClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  if Assigned(FOnUpdate) then
    FOnUpdate(Self, FId);
{$ENDIF}
end;

procedure TFrameCliente.crlEditTap(Sender: TObject; const Point: TPointF);
begin
{$IFNDEF MSWINDOWS}
  if Assigned(FOnUpdate) then
    FOnUpdate(Self, FId);
{$ENDIF}
end;

end.
