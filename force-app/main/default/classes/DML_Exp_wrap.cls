public class DML_Exp_wrap {
    public List<LeadWraper> leads{set;get;}
    public list<selectOption> options{set;get;}
    public string selected{set;get;}
   
    public DML_Exp_wrap(){
        leads=new List<LeadWraper>();
        options=new list<selectOption>();
        list<string> ratings = new list<string>{'-none-','cold','warm','hot'};
        for(string r:ratings){
            selectOption sp=new selectOption(r,r);
            options.add(sp);
           
        }
        List<Lead> myList =[select id,lastName,firstName,rating,industry,phone from lead limit 10];
        //create wrapper record for lead record
        for(Lead l: myList){
            LeadWraper lw=new LeadWraper();
            lw.newlead=l;
            lw.flag=false;
            leads.add(lw);
        }
       
       
    }
   
    public void Onclikmethod(){
       
        for(leadwraper ll:leads){
           
            ll.flag=true;
        }
       
    }
   
    public void updateRating(){
        list<Lead> mylist = new list<Lead>();
        for(LeadWraper lw: leads){
            if(lw.flag==true){
                lw.newlead.rating=selected;
                mylist.add(lw.newlead);
            }
           
        }
       
    }
   
   

public class LeadWraper{
    public lead newlead{set;get;}
    public boolean flag{set;get;}
   
   
}
}