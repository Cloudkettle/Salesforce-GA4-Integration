@isTest
public class GAInvocableActionTest {
    @isTest
    public static void testInvocableAction() {
        GAInvocableAction.GoogleAnalyticsRequest req = new GAInvocableAction.GoogleAnalyticsRequest();
        req.clientId = '615247351.2947109819';
        req.eventName = 'lead';
        req.propName = 'lead_status';
        req.propValue = 'nurture';

        List<GAInvocableAction.GoogleAnalyticsRequest> reqList = new List<GAInvocableAction.GoogleAnalyticsRequest>();
        reqList.add(req);

        Test.startTest();
        GAInvocableAction.calloutToGA(reqList);
        AsyncApexJob[] jobs = [SELECT Id FROM AsyncApexJob WHERE ApexClass.Name = 'GoogleAnalyticsCallout'];
        Test.stopTest();

        Assert.isFalse(jobs.isEmpty(), 'There should be one queueable job scheduled to execute');
    }
}