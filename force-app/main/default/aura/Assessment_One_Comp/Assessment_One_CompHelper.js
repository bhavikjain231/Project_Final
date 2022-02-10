({
	 helperfetchacc : function(component, event,helper) {
        debugger;
        var action =component.get("c.getAcc");
        action.setCallback(this,function(data){
            var state=data.getState();
            if(state=="SUCCESS"){
                var returnval= data.getReturnValue();
                component.set("v.listofacc",returnval);
            }
        });
        $A.enqueueAction(action);
        
    },
    helpDelete : function(component,event,helper) {
        debugger;
        var recordId=event.getSource().get("v.value");
        alert(recordId);
        var action =component.get("c.deleteRecord");
        action.setParams({recId:recordId
                         })
        action.setCallback(this,function(data){
            var state=data.getState();
            if(state=="SUCCESS"){
                var returnval=data.getReturnValue();
                alert(returnval);
            }
        });
        $A.enqueueAction(action);
        
        window.location.reload();
        //helperfetchacc(component,event,helper);
        
    },
    helpEdit : function(component, event,helper){
        debugger;
        
        var recordId = event.getSource().get("v.value");
        alert(recordId);
        var action=component.get("c.editAcc");
        alert(action);
        action.setParams({'recId':recordId
                         });
        action.setCallback(this,function(data){
            var state=data.getState();
            if(state=="SUCCESS"){
                var returnval=data.getReturnValue();
                component.set("v.editdata",returnval);
                component.set("v.isEdit",true);
                
                component.set("v.truthy",false);
            }
            
        });
        $A.enqueueAction(action);
        
        
        //component.set("v.editdata",true);
    },
    helpupdate:function(component,event,helper){
        alert('saving....')
        var newdata=component.get("v.editdata");
        alert(newdata);
        var action=component.get("c.updateAcc");
        action.setParams({'acc': newdata});
        action.setCallback(this,function(res){
            var state=res.getState();
            if(state=="SUCCESS"){
                var retval=res.getReturnValue();
                alert(retval);
            }
        })
        $A.enqueueAction(action);
        window.location.reload();
        // helperfetchacc(component,event,helper);
        
        // component.set("v.truthy",false);
    },
    helpshow:function(component,event,helper){
        component.set("v.isView",true);
        component.set("v.truthy",false); 
        var show=event.getSource().get("v.value");
        var action = component.get("c.showAcc");
        action.setParams({'recId':show  });
        action.setCallback(this,function(res){
            var state=res.getState();
            if(state=="SUCCESS"){
                var retval=res.getReturnValue();
                component.set("v.viewrecord",retval);
            }
        });   
        $A.enqueueAction(action);
    }
})