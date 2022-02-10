({
    helpergetContactList : function(component, event) {
        //call apex class method
            
		component.set("v.flag1", !component.get("v.flag1"));
        var action = component.get('c.fetchContact');
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                //var spinner = component.find("spinnerId");
                //  $A.util.toggleClass(spinner, "slds-hide");
                //set response value in ListOfContact attribute on component.
                component.set("v.flag", !component.get("v.flag"));
                component.set("v.flag1", !component.get("v.flag1"));
                component.set("v.ListOfContact", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
  
})