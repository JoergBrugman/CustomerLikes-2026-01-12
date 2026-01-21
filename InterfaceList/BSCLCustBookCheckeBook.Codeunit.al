codeunit 50202 "BSCL Cust. Book Check eBook" implements "BSB Cust. Book Check Step"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BSB Cust Book Check Pipeline", OnRegisterCustBookCheckSteps, '', false, false)]
    local procedure "BSB Cust Book Check Pipeline_OnRegisterCustBookCheckSteps"(var Steps: List of [Interface "BSB Cust. Book Check Step"])
    begin
        Steps.Add(this);
    end;

    procedure Execute(Customer: Record Customer): Text
    begin
        if Customer."Credit Limit (LCY)" > 0 then
            exit(StrSubstNo('Customer %1 darf bei E-Book kein Kreditlimit %2 haben', Customer."No.", Customer."Credit Limit (LCY)"))
    end;

    procedure GetSequence(): Integer
    begin
        exit(50);
    end;

    procedure IsEnabled(Customer: Record Customer): Boolean
    var
        BSBBook: Record "BSB Book";
    begin
        if Customer."BSB Favorite Book No." = '' then
            exit(false);
        if not BSBBook.Get(Customer."BSB Favorite Book No.") then
            exit(false);
        exit(BSBBook.Type = "BSB Book Type"::eBook);
    end;
}