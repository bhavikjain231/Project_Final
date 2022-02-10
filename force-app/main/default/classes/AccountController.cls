public class AccountController {
@auraEnabled
    public static list<Account> getAccounts(){
       
        try{
             List<Account> acclistone = new List<Account>();
             acclistone = [Select Id,Name,Rating,Industry from Account order by createdDate DESC limit 10];
        return acclistone;
        }
        
        catch(Exception e){
           system.debug(e.getMessage()); 
       return null;
        }
       
    }
    
}