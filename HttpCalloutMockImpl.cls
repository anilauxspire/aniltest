@istest
global class HttpCalloutMockImpl implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        /*if (this.isMockResponseSuccessful) {
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"RIMSUniqueId" : "test","Status" : "Stage 2 : Initial Contact" , "StatusUpdated" : "2022-04-08" }');
            res.setStatusCode(200);  
        }
        else{
            res.setStatusCode(400);
            res.setStatus('Bad request');
        }*/
         res.setHeader('Content-Type', 'application/json');
            res.setBody('{"Message" : "test","Status" : "Stage 2 : Initial Contact" , "StatusUpdated" : "2022-04-08" }');
            res.setStatusCode(200);  

        return res;
        // Create a fake response.
        // Set response values, and 
        // return response.
    }
}