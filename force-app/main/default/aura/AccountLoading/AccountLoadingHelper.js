({
	helperMethod : function() {
        var action = component.get("c.getAccounts");
         action.setCallback(this,function(a){
            var state = a.getState();
            if(state == "SUCCESS"){
               
                
                component.set("v.ListofAcc", a.getReturnValue());
            }
        })
        $A.enqueueAction(action);
		
	}
})