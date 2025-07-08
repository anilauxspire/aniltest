public class ContactTriggerHandler {
    
    public static void contactPhoneUpdation(List<Contact> conList) {
        system.debug(conlist+'conList inside class ');
        set<id> accountIds = new set<id>();
       system.debug('accountIds'+accountIds);
        
        for(contact g : conlist){
          accountIds.add(g.AccountId);   
        }
        
        Map<Id,account> accountmap = new Map<Id,Account>([Select ID,Name,phone from Account where id in :accountids]);
      // account a= [Select ID,Name,phone from Account where id = :c.AccountId]; 
       system.debug('accountmap'+accountmap);
        for(contact c : conList) {
            system.debug (c.Phone + 'c.Phone');
            if(c.Phone == null && c.AccountId != null) {
                //account a= [Select ID,Name,phone from Account where id = :c.AccountId];   
             c.Phone = accountmap.get(c.AccountId).phone;  
                system.debug(c.Phone + accountmap.get(c.AccountId).phone);
                
            } 
                
        }
        
        
        
    }

}