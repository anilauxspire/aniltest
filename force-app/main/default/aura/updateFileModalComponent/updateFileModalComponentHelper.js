({
    associateFileAndCreateTask: function(component, uploadedFiles, recordId) {
        var action = component.get("c.createTaskAndAssociateFiles");
        action.setParams({
            uploadedFiles: uploadedFiles,
            opportunityId: recordId
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("Task created and files associated successfully.");
                alert("Task Created");
            } else {
                console.error("Failed to create task and associate files.");
            }
        });
        
        $A.enqueueAction(action);
    }
})