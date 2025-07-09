trigger ContactsTobeCreated on Contact (before insert,before update) {
     if (Trigger.isbefore && Trigger.isInsert) {
         List<contact> conList = trigger.New;
         ContactTriggerHandler.contactPhoneUpdation(conList);
        //ContactFetcher.fetchContacts(Trigger.new);
    
     
     }
    if (Trigger.isbefore && Trigger.isupdate) {
         List<contact> conList = trigger.New;
         ContactTriggerHandler.contactPhoneUpdation(conList);
        //ContactFetcher.fetchContacts(Trigger.new);

}
}