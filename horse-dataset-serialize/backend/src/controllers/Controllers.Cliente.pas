unit Controllers.Cliente;

interface

procedure Registry;

implementation

uses Horse, Services.Cliente, DataSet.Serialize, System.JSON, Data.DB;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    Res.Send(LService.ListAll(Req.Query).ToJSONArray);
  finally
    LService.Free;
  end;
end;

procedure DoPost(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
  LData: TJSONObject;
begin
  LService := TServiceCliente.Create(nil);
  try
    LData := Req.Body<TJSONObject>;
    if LService.Append(LData) then
      Res.Send(LService.qryCadastro.ToJSONObject).Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;
end;

procedure DoGet(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LId: string;
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    LId := Req.Params.Items['id'];
    if LService.GetById(LId).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Not Found');
    Res.Send(LService.qryCadastro.ToJSONObject());
  finally
    LService.Free;
  end;
end;


procedure DoPut(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LId: string;
  LService: TServiceCliente;
  LData: TJSONObject;
begin
  LService := TServiceCliente.Create(nil);
  try
    LId := Req.Params.Items['id'];
    if LService.GetById(LId).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Not Found');
    LData := Req.Body<TJSONObject>;
    if LService.Update(LData) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure DoDelete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LId: string;
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    LId := Req.Params.Items['id'];
    if LService.GetById(LId).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Not Found');
    if LService.Delete then
    Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/clientes', DoList);
  THorse.Post('/clientes', DoPost);
  THorse.Get('/clientes/:id', DoGet);
  THorse.Put('/clientes/:id', DoPut);
  THorse.Delete('/clientes/:id', DoDelete);
end;

end.
