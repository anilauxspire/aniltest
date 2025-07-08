public class EventScheduler {
 public static List<Planned_Event__c> findAvailableTimeSlots(List<Planned_Event__c> plannedEvents, Date startDate, Date endDate, Time duration) {
 List<Planned_Event__c> availableTimeSlots = new List<Planned_Event__c>();
 DateTime currentDateTime = DateTime.newInstance(startDate, Time.newInstance(0, 0, 0, 0));

system.debug(currentDateTime);
     
    
         
     
   
 while (currentDateTime < DateTime.newInstance(endDate, Time.newInstance(0, 0, 0, 0))) {
 DateTime nextDateTime = currentDateTime.addhours(duration.hour());
 
 // Check if the next time slot is within the specified date range
 if (nextDateTime.date() > endDate) {
 break;
 }


 Boolean isSlotAvailable = true;


 // Check if any planned events overlap with the time slot
 for (Planned_Event__c event : plannedEvents) {
 if (event.event_start_time__c < nextDateTime && event.event_end_time__c > currentDateTime) {
 isSlotAvailable = false;
 break;
 }
 }


 if (isSlotAvailable) {
     List<String> satsun = new List<string>{'Sat','Sun'};
     String dayOfWeek = currentDateTime.format('E');
     system.debug(dayOfWeek);
     if(!satsun.contains(dayOfWeek)){
         if(currentDateTime.time() < Time.newInstance(17, 0, 0, 0) && currentDateTime.time() >= Time.newInstance(9, 0, 0, 0))  {
         
          availableTimeSlots.add(new Planned_Event__c(
name = 'through code',
 event_start_time__c = currentDateTime,
 event_end_time__c = nextDateTime
 ));
         
     }  
     }

    

 }


 currentDateTime = nextDateTime;
 }
     
     system.debug(currentDateTime);

insert availableTimeSlots;
 return availableTimeSlots;
 }
}