trigger RollUpSummary_Trigger on Opportunity (after insert,after update,after delete,after undelete) {
    if(trigger.isafter && (trigger.isinsert || trigger.isupdate || trigger.isundelete)){
    Opportunity_Amount_TriggerHandler.calculate(trigger.new);
    }
 if(trigger.isafter && trigger.isdelete){
    Opportunity_Amount_TriggerHandler.calculate(trigger.old);
    }
}