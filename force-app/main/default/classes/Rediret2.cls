public class Rediret2 {
    public Candidate_Enquiry__c cc{set;get;}
    
    public Rediret2(apexpages.StandardController controller){
        list<string> fields=new list<string>{'Address_for_Correspondence__c', 'Age__c',
            'Candidate_Name__c', 'Community__c', 'Course__c', 'Date_Of_Birth__c',
            'Education_Qualification__c',
            'Email__c', 
            'Family_Annual_Income__c', 'Father_s_Mobile_No__c' ,
            'Father_Occupation__c', 'Gender__c', 'Guardian__c', 'Guardian_Name__c',
            'Interested_Course_1__c', 'Interested_Course_2__c',
            'Mobile_No__c', 'Mother_Occupation__c', 'Other_Interested_Course__c',
            'Passed_out_Organization__c',
            'Passport_No__c', 'Permanent_Address__c', 'Proofs_Submitted__c', 'Year_Of_Pass__c'
            };
                controller.addFields(fields);
        cc=(Candidate_Enquiry__c)controller.getRecord();        
        
    }
    
    public pagereference CreateStudent(){
        pageReference p;
        list<student__c> s1=new list<student__c>();
        //course__c course=[select id from course__c  ];
        Candidate_Enquiry__c c=[select id, Address_for_Correspondence__c, Age__c,
                                Candidate_Name__c, Community__c, Course__c, Date_Of_Birth__c,
                                Education_Qualification__c,
                                Email__c, 
                                Family_Annual_Income__c, Father_s_Mobile_No__c ,
                                Father_Occupation__c, Gender__c, Guardian__c, Guardian_Name__c,
                                Interested_Course_1__c, Interested_Course_2__c,
                                Mobile_No__c, Mother_Occupation__c, Other_Interested_Course__c,
                                Passed_out_Organization__c,
                                Passport_No__c, Permanent_Address__c, Proofs_Submitted__c, Year_of_Pass__c from
                                Candidate_Enquiry__c where id=:apexpages.currentPage().getParameters().get('ID') limit 1];
        
        
        student__c std=new student__c(Name=c.Candidate_Name__c,
                                      Address_For_Correspondence__c=c.Address_for_Correspondence__c,
                                      Community__c=c.Community__c,
                                      course__c=c.Course__c,
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
                                      Year_Of_Pass__c=c.Year_Of_Pass__c,
                                      Passport_No__c=c.Passport_No__c, 
                                      Proofs_Submitted__c=c.Proofs_Submitted__c,
                                      Interested_Course_2__c=c.Interested_Course_2__c,
                                      Other_Interested_Course__c=c.Other_Interested_Course__c,
                                      Mobile_No__c=c.Mobile_No__c, 
                                      Mother_Occupation__c=c.Mother_Occupation__c,
                                      Passed_Out_Organization__c=c.Passed_out_Organization__c );
        s1.add(std);
        
        insert s1;
        
        delete c;
        p=new pageReference('/'+std.Id);
        
        return p;
        
    }
    
}