trigger UpdateContactPhoneOnAccountPhoneChange on Account (after update) {
    if (Trigger.isUpdate) {
        AccountTriggerHandler.handleUpdate(Trigger.new, Trigger.oldMap);
    }
}