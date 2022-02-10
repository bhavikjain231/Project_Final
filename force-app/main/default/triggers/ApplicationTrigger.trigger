trigger ApplicationTrigger on Application__c (before insert) {
    List<Application__c> apList = New List<Application__c>();
    List<BlackList__c> blList  = [select name,pancard__c,Phone__c from blacklist__c];
    Map<Id, String> IdAndBlackListPhoneMap = New Map<Id, String>();
    for(Application__c ap : trigger.new){
        for(BlackList__c bl : blList){
            if(bl.Pancard__c == ap.Pancard__c){
                bl.Phone__c = ap.Phone__c;
                IdAndBlackListPhoneMap.put(bl.Id, bl.Phone__c);
                apList.add(ap);
            }
        }
        if(apList.size() > 0){
            ApplicationTriggerHandler.updateBlackListPhone(IdAndBlackListPhoneMap);
			for(Application__c newAppRecord : apList){
			newAppRecord.adderror('applicant is in blacklist');
			}         }

    }
}