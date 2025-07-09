trigger AccountTriggerTest on Account (before insert,before update,after insert) {
    
    if(trigger.isbefore && trigger.isInsert){
        
         List<account> abcde = trigger.new;
    for(account a:abcde){
        a.phone = '8888888888';
        
    }
        
    }
     if(trigger.isbefore && trigger.isupdate){
         List<account> abcde = trigger.new;
    for(account a:abcde){
        a.phone = '9999999999';
        
    }
    }
    if(trigger.isAfter && trigger.isInsert){
        
    }
    
   
    

}