@isTest
public class ExternalServiceTest {
   @isTest
    public static void makeCalloutTest (){
        Test.setMock(HttpCalloutMock.class, new HttpCalloutMockImpl());
        ExternalService.makeCallout('Execute','Get');
        
    }
    
    @isTest
    public static void accountCreationTest() {
        ExternalService.accountCreation('Anil');
    }

}