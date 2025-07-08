@RestResource(urlMapping='/createAccount/*')
global with sharing class AccountWebService {
    
    @HttpPost
    global static String createAccount(String name) {
        // Create a new Account with the provided name
        Account newAccount = new Account(Name = name);
        
        try {
            insert newAccount; // Insert the account into Salesforce
            return 'Account Created: ' + newAccount.Id + ' with Name: ' + newAccount.Name;
        } catch (Exception e) {
            return 'Error: ' + e.getMessage();
        }
    }
}