public class AccountHandler {
    public static void createContactOnAccountInsert(List<Account> newAccounts) {
         List<Contact> newContacts = new List<Contact>();
      
        for(account acc:newAccounts){
            Contact newContact = new Contact();
            newContact.LastName = acc.Name;
            
            newContact.AccountId = acc.Id;
            newContacts.add(newContact);
            
        }
        
        insert newContacts;
    }
    public static void updateContactOnAccountUpdate(List<Account> newAccounts){
        
        set<id> accountids = new set<id>();
        map<id,account> mapAccount = new Map<id,account>();
        For(Account acc:newAccounts){
            accountids.add(acc.Id);
            mapAccount.put(acc.Id,acc);
        }
     List<Contact> allContacts = [Select id,Phone,AccountId From Contact WHERE AccountId In 
                                 :AccountIds];
       
        for(Contact c:allContacts){
            c.phone = mapAccount.get(c.Accountid).phone;
            
        }
        update allContacts;
        
        
       
        
        

    }
}