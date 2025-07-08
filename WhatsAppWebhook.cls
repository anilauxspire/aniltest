@RestResource(urlMapping='/whatsappWebhook')
global with sharing class WhatsAppWebhook {
    
    // Verification Method (GET request)
    @HttpGet
    global static String verifyWebhook() {
        // Retrieve 'hub.challenge' parameter sent from WhatsApp
        RestRequest req = RestContext.request;
        String challenge = req.params.get('hub.challenge');
        
        // Retrieve your pre-configured token for verification
        String verifyToken = 'WHATSAPPTOKEN';
        String receivedToken = req.params.get('hub.verify_token');

        // Compare received token with your configured token
        if (verifyToken == receivedToken) {
            return challenge; // Return challenge parameter for verification
        } else {
            RestContext.response.statusCode = 403; // Forbidden
            return 'Verification failed!';
        }
    }
    
    // Create Lead (POST request)
    @HttpPost
    global static void receiveMessage() {
        try {
            // Parse the incoming request body
            RestRequest req = RestContext.request;
            String requestBody = req.requestBody.toString();
            
            // Deserialize JSON payload
            Map<String, Object> payload = (Map<String, Object>) JSON.deserializeUntyped(requestBody);
            List<Object> messages = (List<Object>) payload.get('messages');
            
            if (messages != null && !messages.isEmpty()) {
                Map<String, Object> message = (Map<String, Object>) messages[0];
                String phoneNumber = (String) message.get('from');
                String messageBody = (String) message.get('text');

                // Create a new Lead in Salesforce
                Lead newLead = new Lead();
                newLead.LastName = 'WhatsApp Lead'; // Default name
                newLead.Company = 'WhatsApp Integration'; // Default company name
                newLead.Phone = phoneNumber;
                newLead.Description = messageBody;

                insert newLead;
            }
        } catch (Exception ex) {
            System.debug('Error: ' + ex.getMessage());
            RestContext.response.statusCode = 500;
        }
    }
}