/*
* @description : This class exposes an invocable method that takes in a list of GoogleAnalyticsRequest objects.
*                Each GoogleAnalyticsRequest object is serialized to JSON which is later used for calling out to Google Analytics Measurement Protocol.
*                For more information visit: 
*                https://developers.google.com/analytics/devguides/collection/protocol/ga4/sending-events
* @author      : Nicolae Dragu
*/
public class GAInvocableAction {
    @InvocableMethod(label = 'Callout to Google Analytics' description = 'This invocable action makes a callout to Google Analytics' category = 'Lead')
    public static void calloutToGA(List<GoogleAnalyticsRequest> reqList){

        if (reqList.isEmpty()){ 
            return; 
        }
        
        List<String> requests = new List<String>();

        for (GoogleAnalyticsRequest req : reqList){            
            String body = '{ "client_id": "' + req.clientId + '",';
            body += '"timestamp_micros" : "' + req.timestamp + '",';
            body += '"non_personalized_ads": false,';
            body += ' "events":[{"name":"' + req.eventName + '",';
            body += '"params": { "session_id":' + '"' + req.sessionId + '"';
            if (String.isNotEmpty(req.propName)){
                body += ',"' + req.propName + '":"' + req.propValue + '"';
            }
            body += '}}]}';
            requests.add(body);
        }

		System.enqueueJob(new GoogleAnalyticsCallout(requests));
    }
    
    public class GoogleAnalyticsRequest{
        @InvocableVariable (label='Client Id' required = true)
        public String clientId;
        
        @InvocableVariable (label='Event name' required = true)
        public String eventName;

        @InvocableVariable (label = 'Session Id' required = true)
        public String sessionId;

        @InvocableVariable (label = 'Timestamp' required = true)
        public String timestamp;
        
        @InvocableVariable (label='Property name')
        public String propName;
        
        @InvocableVariable (label='Property value')
        public String propValue;
    }
}