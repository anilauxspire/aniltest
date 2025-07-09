trigger CreateContactonAccount on Account (after insert,after update) {  
    if (Trigger.isAfter && Trigger.isInsert) {
        AccountHandler.createContactOnAccountInsert(Trigger.new);

    }
    if (Trigger.isAfter && Trigger.isUpdate){
          AccountHandler.updateContactOnAccountUpdate(Trigger.new);
    }
}