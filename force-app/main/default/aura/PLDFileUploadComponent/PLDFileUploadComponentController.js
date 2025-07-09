({
    handleChange: function (component, event) {
        alert(event.getParam('value'));
    },
    
    handleClick : function (cmp, event, helper) {
        alert("You clicked: " + event.getSource().get("v.label"));
    },
    
     openModal: function(component, event, helper) {
        component.set("v.isModalOpen", true);
    }
});