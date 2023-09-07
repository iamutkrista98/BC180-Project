codeunit 50102 "Json Tools"
{
    procedure Json2Rec(JO: JsonObject; var Rec: Variant): Variant
    var
        Ref: RecordRef;
    begin
        Ref.GetTable(Rec);
        exit(Json2Rec(JO, Ref.Number()));


    end;

    procedure Json2Rec(JO: JsonObject; TableNo: Integer): Variant
    var
        Ref: RecordRef;
    begin
        Ref.Open(TableNo);

    end;

}
