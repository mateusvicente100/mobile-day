unit Services.Cliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, System.JSON, DataSet.Serialize;

type
  TServiceCliente = class(TDataModule)
    Connection: TFDConnection;
    qryCadastro: TFDQuery;
    qryPesquisa: TFDQuery;
    qryCadastroid: TFDAutoIncField;
    qryCadastronome: TStringField;
    qryCadastrosobrenome: TStringField;
    qryCadastroemail: TStringField;
    qryPesquisaid: TFDAutoIncField;
    qryPesquisanome: TStringField;
    qryPesquisasobrenome: TStringField;
    qryPesquisaemail: TStringField;
  public
    function ListAll: TFDQuery;
    function Append(const AJson: TJSONObject): Boolean;
    function GetById(const AId: string): TFDQuery;
    function Update(const AJson: TJSONObject): Boolean;
    function Delete: Boolean;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function TServiceCliente.Append(const AJson: TJSONObject): Boolean;
begin
  qryCadastro.SQL.Add('where 1 <> 1');
  qryCadastro.Open();
  qryCadastro.LoadFromJSON(AJson, False);
  Result := qryCadastro.ApplyUpdates(0) = 0;
end;

function TServiceCliente.Delete: Boolean;
begin
  qryCadastro.Delete;
  Result := qryCadastro.ApplyUpdates(0) = 0;
end;

function TServiceCliente.GetById(const AId: string): TFDQuery;
begin
  qryCadastro.SQL.Add('where id = :id');
  qryCadastro.ParamByName('id').AsInteger := AId.ToInteger;
  qryCadastro.Open();
  Result := qryCadastro;
end;

function TServiceCliente.ListAll: TFDQuery;
begin
  qryPesquisa.Open();
  Result := qryPesquisa;
end;

function TServiceCliente.Update(const AJson: TJSONObject): Boolean;
begin
  qryCadastro.MergeFromJSONObject(AJson, False);
  Result := qryCadastro.ApplyUpdates(0) = 0;
end;

end.
