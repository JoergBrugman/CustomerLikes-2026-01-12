codeunit 50201 "BSCL Book Type eBook Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook()
    begin
        this.Deploy();
    end;

    procedure StartDeliverBook()
    begin
        Deliver();
    end;

    procedure Deploy()
    begin
        Message('PDF auf Kudenportal hochladen');
    end;

    procedure Deliver()
    begin
        Message('E-Mailbenachrichtigung an Kunden senden.');
    end;
}