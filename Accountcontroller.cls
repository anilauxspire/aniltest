public class Accountcontroller {
    @AuraEnabled
    public static void creatAccount(String name) {
        try { 
            account a = new account();
            a.name=name;
            insert a;
            
        } catch (exception e) {
            system.debug(e.getmessage());
        }
    
        
    }
    
}