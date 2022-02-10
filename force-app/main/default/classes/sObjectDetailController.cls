public class sObjectDetailController {
	
    @AuraEnabled
    public static List<sobject> getsendObjectDetails(String objName) {
        
        String query = 'Select Id, Name, Owner.Name FROM '+objName+' LIMIT 10';
        return Database.query(query);
    }
}