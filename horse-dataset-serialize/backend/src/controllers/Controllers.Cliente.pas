unit Controllers.Cliente;

interface

procedure Registry;

implementation

uses Horse, Services.Cliente, DataSet.Serialize, System.JSON;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    Res.Send(LService.ListAll.ToJSONArray);
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

procedure Registry;
begin
  THorse.Get('/clientes', DoList);
  THorse.Post('/clientes', DoPost);
end;

end.
