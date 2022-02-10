public class Assessment_One {
 @AuraEnabled
    public static list<Account> getAcc(){
        list<Account> acc=[select id,AccountNumber,Name from Account];
        return acc;
    }
    @AuraEnabled
    public static string deleteRecord(string recId){
        try{
       system.debug('recId====='+recId);
        Account del=[select id,AccountNumber,Name from Account where Id=:recId];
         delete del;
        return 'Successfully deleted';
        }
        catch(Exception e)
        {
            return e.getMessage();
        }
    }
   @AuraEnabled
    public static Account editAcc(string recId ){
        Account acc=[select id ,AccountNumber,Name from Account where Id=:recId];
        return acc;
    }
    @AuraEnabled
    public static string updateAcc(Account acc){
       //fi=data ;
        upsert acc;
       return 'success';
    }
    @AuraEnabled
   public static Account showAcc(string recId){
   Account acc = [select Id,AccountNumber,Name,Industry,Phone,ShippingAddress from Account where Id=:recId];
        return acc;
   }

}