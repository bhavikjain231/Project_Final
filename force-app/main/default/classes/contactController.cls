public class contactController{
    @AuraEnabled
    public static list <Contact> fetchContact() {
        try{
        List<Contact> conlist = new List<Contact>();
        conlist = [Select Id,FirstName,LastName from Contact limit 2000]; 
        return conlist ;
        }
        
        catch(Exception e){
            system.debug(e.getMessage());
            return null;
        }
   
    }
}