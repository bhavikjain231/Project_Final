trigger newCourseEmail on Course__c (after insert) {
list<string> emailid = new list<string>();
list<Candidate_Enquiry__c> address1 = [select Candidate_Name__c, Email__c from Candidate_Enquiry__c];
 list<Messaging.SingleEmailMessage> singleEmailMessageList = new list<Messaging.SingleEmailMessage>();
    for(Candidate_Enquiry__c c : address1){
        if(c.Email__c !=null){
            emailid.add(c.Email__c);
        }
    }
    for(Course__c obj : trigger.new){
        Messaging.SingleEmailMessage m = new Messaging.SingleEmailMessage();
        m.setToAddresses(emailid);
        m.setSubject(obj.Course_Name__c+'is starting');
        m.setPlainTextBody('Dear'+'Candidate'+', The following course is starting shortly in our institute.'+'' + 'Course Name :'+obj.Course_Name__c +
                          'Course Starting Date :'+obj.Course_Starting_Date__c + 'Course Closing Date :'+obj.Course_Closing_Date__c+'Course Duration :'+
                          obj.Course_Duration__c +'Faculty :'+obj.Faculty__c+''+ 'Regards, Bhavik.');
        singleEmailMessageList.add(m);
    }    
    if(singleEmailMessageList != null && singleEmailMessageList.size() >0){
        Messaging.sendEmail(singleEmailMessageList);
    }
  
}