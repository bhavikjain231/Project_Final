public class ApplicationTriggerHandler {
    public static void updateBlackListPhone(Map<Id, String> idAndPhoneMap){
        list<blacklist__c> blpancard = [select name,pancard__c,Phone__c from blacklist__c where Id IN:idAndPhoneMap.KeySet()];
        for(blacklist__c blck :blpancard){
            blck.Phone__c = idAndPhoneMap.get(blck.Id);            
        }
        Update blpancard;
        System.debug('Update Done');
    }          
}