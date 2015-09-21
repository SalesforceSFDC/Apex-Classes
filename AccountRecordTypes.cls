public class AccountRecordTypes{

    private static RecordTypeContainer rtc = new RecordTypeContainer(Schema.SObjectType.Account);

    public static Id Test1{
        get{
            return rtc.getRecordTypeId('Test1');
        }
    }

    public static Id AnotherTest{
        get{
            return rtc.getRecordTypeId('Another test');
        }
    }
}
