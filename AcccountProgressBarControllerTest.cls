@isTest
private class AcccountProgressBarControllerTest {

    @testSetup
    static void setupTestData() {
        // Create a test Account with some populated fields
        Account acc = new Account(
            Name = 'Test Account',
            Description = 'Test Description',
            Phone = '123-456-7890'
            // Leave Site as null to simulate partial completion
        );
        insert acc;

        // Note: The Field Set must exist in your org with these fields added:
        // - Description
        // - Site
        // - Phone
        // for this test to be meaningful.

        // You can't create or modify Field Sets in Apex test code,
        // so ensure the Field Set `FSL__Emergency_Account_Fields` includes those fields.
    }

    @isTest
    static void testCalculatePercentagePartialFields() {
        // Get the test account
        Account testAcc = [SELECT Id FROM Account LIMIT 1];

        // Call the method
        Decimal result = AcccountProgressBarController.calculatePercentage(testAcc.Id);

        System.debug('Calculated Percentage: ' + result);

        // Assert result is between 0 and 100 (since 2 out of 3 fields are filled)
        System.assert(result > 0 && result < 100, 'Percentage should reflect partial completion');
    }

        

    
}