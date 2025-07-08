public class AcccountProgressBarController {
    @AuraEnabled
     public static Decimal calculatePercentage(String customerProfileId) {
         
        Account c = [SELECT Id, Name, Description, Site,Phone FROM Account WHERE Id = :customerProfileId LIMIT 1];
        system.debug( 'accountC' + c);
         system.debug('Descriptions' + c.Description);
        if (c == null) {
            return 0;
            //test 2
            //test vs code new
        }

        Schema.FieldSet fieldSet = SObjectType.Account.FieldSets.FSL__Emergency_Account_Fields;
system.debug(fieldSet);
        List<String> fieldNames = new List<String>();
        for (Schema.FieldSetMember fieldSetMember : fieldSet.getFields()) {
            fieldNames.add(fieldSetMember.getFieldPath());
        }

        Decimal totalFields = fieldNames.size();
system.debug(totalFields);
        Decimal fieldsWithValues = 0;

        for (String fieldName : fieldNames) {
            if (c.get(fieldName) != null) {
                fieldsWithValues++;
            }
        }
system.debug(fieldsWithValues);
        Decimal percentage = 0;
         Decimal roundedPercentage = 0;
        if (totalFields > 0) {
            percentage = (fieldsWithValues / totalFields) * 100;
             roundedPercentage = percentage.setScale(2, RoundingMode.HALF_UP);
            system.debug((fieldsWithValues / totalFields) * 100);

        }
        return roundedPercentage;
    }

}