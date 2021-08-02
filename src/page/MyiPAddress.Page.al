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
    begin
        Error('Procedure GetMyIP not implemented.');
    end;

}
