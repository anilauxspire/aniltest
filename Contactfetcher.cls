public class Contactfetcher {

    public static List<Contact> fetchContacts(List<Contact>ContactList)  {
        
        
                List<Contact>ListofContacts = new List<Contact>();
        
        Map<String, Contact> dimensionstoContactMap= new Map<String, Contact>();
        List<String> dimensionCombinations= new List<String>();
        
        for (Contact cType : ContactList) {
            
            String dimensionComb = String.valueOf(cType.Length__c) + String.valueOf(cType.Width__c) + String.valueOf(cType.Height__c);
            dimensionstoContactMap.put(dimensionComb,cType);
            dimensionCombinations.add(dimensionComb);
        }
        
        Set <String> dimensionCombSet = new Set<String>();
        dimensionCombSet = dimensionstoContactMap.keySet();
        List<Contact> matchingContacts = new List<Contact>();
        
        matchingContacts= [SELECT Id,Length__c, Width__c, Height__c,Name,LBHCombination__c  FROM
                           Contact WHERE
                           LBHCombination__c IN :dimensionCombSet ];
        
        for(Contact matchingCType :matchingContacts) {
            
            dimensionstoContactMap.remove(matchingCType.LBHCombination__c);
        }
        
        List<Contact> ContactsTobeCreatedList = New List<Contact>();
        ContactsTobeCreatedList = dimensionstoContactMap.values();
        system.debug(ContactsTobeCreatedList);
        List<PackageType__c> PackageTypeList = new List<PackageType__c>();
        for(contact c:ContactsTobeCreatedList ){
            PackageType__c p = new PackageType__c();
            p.length__c = c.Length__c;
            p.width__c = c.Width__c;
            p.height__c = c.Height__c;
            PackageTypeList.add(p);
        }
        insert PackageTypeList;
        listOfContacts.addAll(contactsToBeCreatedList);
        listOfContacts.addAll(matchingContacts);

        return listOfContacts;
        
    }
    
}