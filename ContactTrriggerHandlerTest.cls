@isTest
public class ContactTrriggerHandlerTest {
    
    @isTest
    static void contactPhoneUpdationTest(){
        //List<Contact> conlist = new  List<Contact>();
        Account a = new Account();
        a.Phone = '9999999999';
        a.name= 'asa';
        insert a;
        contact c = new contact();
       c.lastname = 'test';
        c.accountId = a.Id;
        insert c;
        contact updatedCon = [select id,phone from contact where id = :c.Id];
       
        System.assertEquals(updatedCon.Phone,'8888888888');
       
        //conlist.add(c);
        //ContactTriggerHandler.contactPhoneUpdation(conlist);
    }
    

}