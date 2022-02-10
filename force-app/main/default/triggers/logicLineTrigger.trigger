trigger logicLineTrigger on Opportunity (before insert) {
 for(Opportunity opp:Trigger.New)
    {
        opp.Amount_in_Euro__c=LogiclineApex.usdToEuro(opp.Amount);
    }
}