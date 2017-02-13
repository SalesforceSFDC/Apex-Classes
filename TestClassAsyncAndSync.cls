// test contains a single test method, which tests both the async and sync methods as the former calls the later

@isTest
private class Test_SMSUtils {

    @isTest
    private static void testSendSms() {
      Test.setMock (HttpCalloutMock.class, new SMSCalloutMock());
      Test.startTest();
        SMSUtils.sendSMSAsync('111', '222', 'Greetings!');
      Test.stopTest();
      // runs callout and check results
      List<SMS_Log__c> logs = [select msg__c from SMS_Log__c];
      System.assertEquals(1, logs.size());
      System.assertEquals('success', logs[0].msg__c);
    }
}
