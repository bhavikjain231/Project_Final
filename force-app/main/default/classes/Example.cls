public class Example {
@auraEnabled
    public static list<Account> getAccounts(){
        List<Account> acclist = new List<Account>();
        acclist = [Select Id,Name,Rating,Industry from Account limit 10];
        return acclist;
        
    }
    
}