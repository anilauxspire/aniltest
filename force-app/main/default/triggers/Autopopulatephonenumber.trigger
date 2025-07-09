trigger Autopopulatephonenumber on Account (before insert) {
    handlerClassAutopopulation.beforeInsertHandler(Trigger.new);
    }