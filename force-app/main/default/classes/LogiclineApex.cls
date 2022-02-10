public class LogiclineApex {

    @AuraEnabled
    public static Double usdToEuro(decimal amount)
    {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.exchangeratesapi.io/latest?base=USD');
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        Map < String,Object > resultsMap = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
        object eurValue=(( (Map<String,Object>)resultsMap.get('rates')).get('EUR'));
        try{
            Double amounts=amount*(double)eurValue;
            return  amounts;
           
           
        }
        catch(Exception e)
        {
            return 0.0;
        }
       
    }
 
    
        @AuraEnabled 
    public static List<accountListWrapper> fetchAccountWrapper(){     
        List<accountListWrapper> lstaccountListWrapper = new List<accountListWrapper>();
        // query account records and create 'accountListWrapper' class instance for each record. 
        for(Account acc : [Select id,Name,Type,Phone From Account  Limit 1000])
        {
            // by default checkbox should be false 
            lstaccountListWrapper.add(new accountListWrapper(false,acc));
        } 
        // return the 'lstaccountListWrapper' list 
        return lstaccountListWrapper; 
    }
    
    /* wrapper class */  
    public class accountListWrapper {
        @AuraEnabled public boolean isChecked {get;set;}
        @AuraEnabled public  account objAccount{get;set;}
        public accountListWrapper(boolean isChecked, account objAccount){
            this.isChecked = isChecked;
            this.objAccount = objAccount;
        }
    }
    
    @AuraEnabled
    public static void saveChildRecord(list<Account> account,date oCd,decimal ousd,string oStage){   
        list<Opportunity> opp=new list<Opportunity>();
        for(Account acc:account)
        {
            Opportunity op=new Opportunity();
            op.AccountId=acc.Id;
            op.StageName=oStage;
            op.Name='New auto opportunity create for'+acc.Name;
            op.Amount=ousd;
            op.CloseDate=oCd;
            opp.add(op);
           
        }
        insert opp;
       
    
    }
}