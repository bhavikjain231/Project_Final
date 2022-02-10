public class redirect_student {
    String recordId;
    public redirect_student() {
    }
    public redirect_student(ApexPages.StandardController controller)
    {
        //recordId = controller.getId();
    }
    public static void records()
    {
        saveRecord();
        PageReference save;
    }
    public static void saveRecord(){
   List <Candidate_Enquiry__c> ce =[select id, Address_for_Correspondence__c, Age__c, Candidate_Name__c, Community__c, Course__c, Date_Of_Birth__c, 
                                          Education_Qualification__c, Email__c, Family_Annual_Income__c, Father_s_Mobile_No__c, Father_Occupation__c, 
                                         Gender__c, Guardian__c, Guardian_Name__c, Interested_Course_1__c, Interested_Course_2__c, Mobile_No__c, 
                                         Mother_Occupation__c, Other_Interested_Course__c, Passed_Out_Organization__c, Passport_No__c, 
                                         Permanent_Address__c, Proofs_Submitted__c, Year_of_Pass__c from Candidate_Enquiry__c 
                                         where id=:ApexPages.currentPage().getParameters().get('ID')];
        
        List<Student__c> stu=new List<Student__c>();
        Student__c s;
        for(Candidate_Enquiry__c c : ce)
        {
            s = new Student__c(Name=c.Candidate_Name__c, 
                               Address_For_Correspondence__c=c.Address_for_Correspondence__c, 
                               Community__c=c.Community__c, 
                               Course__c=c.Course__c, 
                               Date_Of_Birth__c=c.Date_Of_Birth__c,
                               Education_Qualification__c=c.Education_Qualification__c, 
                               Email__c=c.Email__c,
                               Family_Annual_Income__c=c.Family_Annual_Income__c,
                               Father_s_Mobile_No__c=c.Father_s_Mobile_No__c,
                               Father_Occupation__c=c.Father_Occupation__c, 
                               Gender__c=c.Gender__c,
                               Guardian__c=c.Guardian__c,
                               Guardian_Name__c=c.Guardian_Name__c,
                               Interested_Course_1__c=c.Interested_Course_1__c,
                               Permanent_Address__c=c.Permanent_Address__c, 
                               Year_of_Pass__c=c.Year_of_Pass__c,
                               Passport_No__c=c.Passport_No__c, 
                               Proofs_Submitted__c=c.Proofs_Submitted__c,
                               Interested_Course_2__c=c.Interested_Course_2__c,
                               Other_Interested_Course__c=c.Other_Interested_Course__c,
                               Mobile_No__c=c.Mobile_No__c, 
                               Mother_Occupation__c=c.Mother_Occupation__c,
                               Passed_Out_Organization__c=c.Passed_Out_Organization__c );
                               
            stu.add(s);
            database.insert(stu);
            delete ce;
        }
    }
    public PageReference redirect()
    {
        try {
            PageReference customPage = new PageReference
                ('https://ap1.salesforce.com/a00?fcf=00B90000004OTGB');
            customPage.setRedirect(true);
            // customPage.getParameters().put('id', recordId);
            return customPage;
        }
        catch (DMLException e)
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error creating new account.'));
            return null;
        }
    }
}