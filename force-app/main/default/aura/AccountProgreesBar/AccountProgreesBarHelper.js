({
    calculateProgress: function (component) {
         var shippingProfileId = component.get('v.shippingProfileId');
         var action = component.get("c.calculatePercentage"); 
         var percentage = component.get('v.percentage');
            action.setParams({ customerProfileId: shippingProfileId });
            
            action.setCallback(this,function(response){
                
                if (response.getState() === "SUCCESS") {
                    percentage = response.getReturnValue();
                    alert(response.getReturnValue());
                    if(percentage.length !== 0) {
                        component.set("v.percentage",percentage);
                    }
                }
            });
            $A.enqueueAction(action);

         component.set("v.widthStyle", 'width:' + percentage + '%');
    }
})