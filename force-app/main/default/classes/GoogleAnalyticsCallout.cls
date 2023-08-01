/*
* @description : This class receives a list of strings (JSON request bodies) to be used for calling out to Google Analytics Measurement Protocol.
*                Each list element results in a callout. As long as we have elements in the list and we are not exceeding the callout limit
*                per transaction, we are making callouts. If we still have elements in the list, but have reached the callout limit, 
*                we chain another queueable job with the remaining items until we process all elements in the list.
* @author      : Nicolae Dragu
*/
public class GoogleAnalyticsCallout implements Queueable, Database.AllowsCallouts{
    private List<String> requests;

    public GoogleAnalyticsCallout(List<String> requests){
        this.requests = requests;
    }

    public void execute(QueueableContext context){
		Integer numCallouts = 0;
        
        while (requests.size() > 0 && numCallouts < Limits.getLimitCallouts()){
            makeCallout(requests.remove(0));
			numCallouts++;
        }

        if (!requests.isEmpty()){
            System.enqueueJob(this);
        }
    }

    private static void makeCallout(String body){ 
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Google_Analytics_Credential');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        req.setBody(body);
        
        HttpResponse res;
        
        try {
            res = h.send(req);
        } catch(Exception e){
            System.debug(e);
        }
    }
}