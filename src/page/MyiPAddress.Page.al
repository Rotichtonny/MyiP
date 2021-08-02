page 50100 "My iP Address"
{

    Caption = 'My iP Address';
    PageType = Card;
    Editable = false;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(IP; GetMyIP())
            {
                Caption = 'My IP Address';
                ApplicationArea = All;
            }
        }
    }
    procedure GetMyIP(): Text
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        J: JsonObject;
        ResponseTxt: Text;
    begin
        // 'https://api.ipify.org?format=json'
        if Client.Get('https://api.ipify.org?format=json', Response) then begin
            if Response.IsSuccessStatusCode() then begin
                Response.Content.ReadAs(ResponseTxt);
                J.ReadFrom(ResponseTxt);
                exit(GetJsonTextField(J, 'ip'));
            end;
        end;
    end;

    procedure GetJsonTextField(J: JsonObject; arg: Text): Text
    var
        Result: JsonToken;
    begin
        if J.Get(arg, Result) then begin
            exit(Result.AsValue().AsText());
        end;
    end;

}
