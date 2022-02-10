({
    doInit : function(component, event, helper) {
        var action = component.get("c.getsendObjectDetails");
        action.setParams({ objName : component.get("v.objName") });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                //console.log("SUCCESS");
                component.set("{!v.sObjects}", response.getReturnValue());
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        
        $A.enqueueAction(action);
    },
    
    /*    ({
    doInit : function(component, event, helper) {
        var action = component.get("c.getsendObjectDetails");
        action.setCallback(this,function(response){
                if (response.getState() === "SUCCESS"){
                    console.log(response.getReturnValue());
                    component.set("{!v.contacts}",response.getReturnValue());

                    var contacts = component.get("{!v.contacts}");
                    var fieldNames = component.get("{!v.fieldNames}");
                    var NewBody = "";
                    for (var i=0; i<contacts.length; i++){
                        for (var ii=0; ii<fieldNames.length; ii++){
                            NewBody += contacts[i][fieldNames[ii]];
                        }
                        NewBody += "\n";
                    }
                    console.log(NewBody);
                    $A.createComponent(
                        "ui:outputText",
                        {
                            "value" : NewBody
                        },
                        function(newComponent){
                            component.set("v.body",newComponent);
                        }
                    )
                }
            }
        );
        $A.enqueueAction(action);
    }
		})*/
})