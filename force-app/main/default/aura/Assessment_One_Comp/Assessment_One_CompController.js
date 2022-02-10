({
	
	fetchacc : function(component, event, helper) {
       helper.helperfetchacc(component,event,helper);
	},
    deleteFunc:function(component,event,helper){
        helper.helpDelete(component,event,helper);
    },
    editFunn:function(component,event,helper){
        helper.helpEdit(component,event,helper);
   },
    saveFunct:function(component,event,helper){
        helper.helpupdate(component,event,helper);
    },
    showdetail:function(component,event,helper){
        component.set("v.isOpen", true);
        helper.helpshow(component,event,helper);
    },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
      component.set("v.truthy",true);
      helper.helperfetchacc(component,event,helper);
   },
})