public class Opportunity_Amount_TriggerHandler {
    public static void calculate(list<opportunity> optylist){
        list<id> accids=new list<id>();
        for(opportunity op:optylist){
            accids.add(op.AccountId);
        }
        list<Account> acclist=[select id,Opportunity_Amount__c ,(select id,name,amount from opportunities) from Account where id in:accids];
        for(Account a:acclist){
            decimal sum=0;
            for(opportunity o:a.opportunities){
                sum+=o.Amount;
                            a.Opportunity_Amount__c=sum;
            }
                update acclist;
           
        }
       
    } }