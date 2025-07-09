({
    handleButtonClick : function(component, event, helper) {
        var buttonLabel = event.getSource().get("v.label");
        alert("You clicked: " + buttonLabel);
    }
})