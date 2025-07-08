public class ExternalService {
    
    @future (callout=true)
    public static void makeCallout(String endpoint,string setMethod) {
        // Create the HTTP request to call an external API
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod (setMethod);
        //req.setTimeout(120000); // Optional: Set timeout for the callout

        Http http = new Http();
        HttpResponse res = http.send(req);
        system.debug(res);

        // Process the response from the external service
        if (res.getStatusCode() == 200) {
            // Do something with the response
            System.debug('Response: ' + res.getBody());
        } else {
            System.debug('Error with response: ' + res.getStatusCode());
        }
    }
    
    public static void accountCreation(String name) {
        Account a = new account();
        a.name = name;
        insert a;
        
    }
}