({
    init: function(component, event, helper) {
        // Initialization logic if needed
    },
    
    closeModal: function(component, event, helper) {
        component.set("v.isOpen", false);
    },
    
    handleUploadFinished: function(component, event, helper) {
        // Handle file upload finished event, if needed
        var uploadedFiles = event.getParam("files");
        console.log("Uploaded files: " + JSON.stringify(uploadedFiles));
        // You can process uploaded files here
        component.set("v.uploadedFiles", uploadedFiles);
        component.set("v.showFileUploadProgress", true);
        // Close the modal after file upload if needed
        component.set("v.isOpen", false);
    },
    
finishUpload: function(component, event, helper) {
    var uploadedFiles = component.get("v.uploadedFiles");
    var recordId = component.get("v.recordId");
    
    if (uploadedFiles && uploadedFiles.length > 0) {
        // Call helper function to associate file and create task
        helper.associateFileAndCreateTask(component, uploadedFiles, recordId);
    }
    
    // Close the modal
    component.set("v.isOpen", false);

    // Check the first checkbox in the parent component
    var parent = component.get("v.parentComponent");
    if (parent) {
        var currentValues = parent.get("v.value") || [];
        if (!currentValues.includes('option1')) {
            currentValues.push('option1');
        }
        parent.set("v.value", currentValues);
    }
}
})