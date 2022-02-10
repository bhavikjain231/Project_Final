({
    onChangeValueHelper : function(component,event,helper) {
       //alert("HELPER");
        var action = component.get("c.usdToEuro");
        action.setParams({
            amount : component.get("v.AmountinUsd")
        });
        action.setCallback(this, function(response) {
            var state=response.getState();
            if(state=="SUCCESS"){
                component.set("v.AmountinEuro", response.getReturnValue());
                //alert('currency data is:' + response.getReturnValue());
            }else{
                //alert("else part");
            }
        });
        
        $A.enqueueAction(action);  
        
    },
    setStageHelper : function(component,event,helper) {
        
       var temp = component.find("select").get("v.value");
         component.set("v.attStageName", temp);
    }  
})