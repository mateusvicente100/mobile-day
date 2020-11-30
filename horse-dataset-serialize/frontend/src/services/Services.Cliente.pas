unit Services.Cliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RESTRequest4D.Request, DataSet.Serialize;

type
  TServiceCliente = class(TDataModule)
    mtCadastro: TFDMemTable;
    mtCadastroid: TIntegerField;
    mtCadastronome: TStringField;
    mtCadastrosobrenome: TStringField;
    mtCadastroemail: TStringField;
    mtPesquisa: TFDMemTable;
    mtPesquisaid: TIntegerField;
    mtPesquisanome: TStringField;
    mtPesquisasobrenome: TStringField;
    mtPesquisaemail: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  public
    procedure Salvar;
    procedure Listar;
    procedure Delete(const AId: string);
    procedure GetById(const AId: string);
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TServiceCliente.DataModuleCreate(Sender: TObject);
begin
  mtCadastro.Open;
  mtPesquisa.Open;
end;

procedure TServiceCliente.Delete(const AId: string);
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New
    .BaseURL('http://localhost:9000')
    .Resource('clientes')
    .ResourceSuffix(AId)
    .Delete;
  if not (LResponse.StatusCode = 204) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
end;

procedure TServiceCliente.GetById(const AId: string);
var
  LResponse: IResponse;
begin
  mtCadastro.EmptyDataSet;
  LResponse := TRequest.New
    .BaseURL('http://localhost:9000')
    .Resource('clientes')
    .ResourceSuffix(AId)
    .DataSetAdapter(mtCadastro)
    .Get;
  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
end;

procedure TServiceCliente.Listar;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New
    .BaseURL('http://localhost:9000')
    .Resource('clientes')
    .DataSetAdapter(mtPesquisa)
    .Get;
  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
end;

procedure TServiceCliente.Salvar;
var
  LRequest: IRequest;
  LResponse: IResponse;
begin
  LRequest := TRequest.New
    .BaseURL('http://localhost:9000')
    .Resource('clientes')
    .AddBody(mtCadastro.ToJSONObject);
  if (mtCadastroid.AsInteger > 0) then
    LResponse := LRequest.ResourceSuffix(mtCadastroid.AsString).Put
  else
    LResponse := LRequest.Post;
  if not (LResponse.StatusCode in [201, 204]) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
  mtCadastro.EmptyDataSet;
end;

end.
