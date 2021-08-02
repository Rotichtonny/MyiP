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
                J.ReadFrom(ResponseTxt)
            end;
        end;
    end;

}
