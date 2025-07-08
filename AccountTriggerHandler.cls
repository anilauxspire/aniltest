public class AccountTriggerHandler{
public static void handleUpdate (List<Account> newAccounts, Map<Id, Account> oldMap){
    List<Contact> contactsToUpdate = new List<Contact>();

    // Collect all updated accounts
    Set<Id> updatedAccountIds = new Set<Id>();
    for (Account updatedAccount : newAccounts) {
        Account oldAccount = oldMap.get(updatedAccount.Id);
        // Check if the phone number has changed
        if (oldAccount.Phone != updatedAccount.Phone) {
            updatedAccountIds.add(updatedAccount.Id);
        }
    }

    // Query related contacts
    Map<Id, Account> accountMap = new Map<Id, Account>(
        [SELECT Id,Phone, (SELECT Id, Phone FROM Contacts) FROM Account WHERE Id IN :updatedAccountIds]
    );
List<Contact> conList = [Select id,Phone,accountId FROM Contact where Accountid IN :updatedAccountIds];
    for(Contact con:conList){
        con.phone = accountMap.get(con.AccountId).phone;
        contactsToUpdate.add(con);
    }
    update contactsToUpdate;
    
    // Update related contacts' phone numbers
   /* for (Account acc : relatedContactsMap.values()) {
        for (Contact con : acc.Contacts) {
            con.Phone = acc.Phone;
            contactsToUpdate.add(con);
        }
    }*/

    // Update contacts
   /* if (!contactsToUpdate.isEmpty()) {
        try {
            update contactsToUpdate;
        } catch (Exception e) {
            System.debug('Error updating contacts: ' + e.getMessage());
            // Handle the exception as per your requirements */
        }
    }