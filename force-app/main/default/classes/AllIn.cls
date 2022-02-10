public class AllIn {
        public Map<string,schema.SObjectType> ObjMap{set;get;}
        public Map<string,schema.SObjectField>fldMap{set;get;}
        public string selected{set;get;}
        public string selected1{set;get;}
        public list<string> selected2{set;get;}
        public list<string> selected3{set;get;}
        //public list<string> selected4{set;get;}
       //public list<string> selected5{set;get;}
        public  List<selectOption> op1{set;get;}
        public list<selectOption> op2{set;get;}
        public list<selectOption>op3{set;get;}
        public list<selectOption>op4{set;get;}
        public list<selectOption>op5{set;get;}
        public List<selectOption> st{set;get;}
        public list<wrapper> wrp{set;get;}
        public list<sobject> sobj{set;get;}
        public list<string> s{set;get;}
        public Map<string,list<string>> accMap{set;get;}
        public integer count{set;get;}
        public string condition{set;get;}
    public list<schema.SObjectType> childObject{set;get;}
        public AllIn(){
            count=0;
            selected2=new list<string>();
            selected3=new list<string>();
          //selected4=new list<string>();
          //selected5=new list<string>();
            childObject=new list<schema.SObjectType>();
            op1=new list<selectOption>();
            op2=new list<selectOption>();
            op3=new list<selectOption>();
             op4=new list<selectOption>();
            op5=new list<selectOption>();
            wrp=new list<wrapper>();
            objMap=schema.getGlobalDescribe();
            accMap=new map<string,list<string>>();
            set<string> objNames=objMap.keySet();
            List<string> custom=new list<string>();
            list<string> standard=new list<string>();
            for(string s:objNames){
                if(s.endsWith('__c')){
                    custom.add(s);
                   
                }else{
                   
                    standard.add(s);
                }
            }
           // system.debug(custom);
           // system.debug(standard);
            accMap.put('Standard Objects', standard);
            accMap.put('Custom Objects', Custom);
            selectOption ss=new selectOption('None','-None-');
            op1.add(ss);
            op2.add(ss);
           
           // op5.add(ss);
            list<string> s1=new list<string>{'Standard Objects','Custom Objects'};
                for(string s2:s1){
                    selectOption so=new selectOption(s2,s2);
                    op1.add(so);
                }
           
           
           invoke5();
           selectoption o1=new SelectOption('=','Equals to');
            op5.add(o1);
            selectoption o2=new SelectOption('!=','Not Equals to');
             op5.add(o2);
        }
        public void invoke(){
            op2.clear();
            selectOption ss=new selectOption('None','-None');
            op2.add(ss);
            if(selected!='None'){
               list<string> f2=accMap.get(selected);
                for(string s3:f2){
                    selectOption op=new selectOption(s3,s3);
                    op2.add(op);
                }
            }
        }
       
        public void invoke2(){
            op3.clear();
            selectOption ss=new selectOption('None','-None-');
            fldMap= objMAp.get(selected1).getDescribe().fields.getMap();
            set<string> feilds=fldmap.keyset();
            for(string f:feilds){
                selectOption s5=new selectOption(f,f);
                op3.add(s5);
               
            }
           
        }
       
        public void Invoke3(){
           
           // list<integer> y=new list<integer>();
            for(string s:selected2){
                selectOption sl=new selectOption(s,s);
                op4.add(sl);
                 integer x=op3.indexOf(sl);
                op3.remove(x);
            }
       
        }
       
        public void invoke4(){
                for(string s:selected3){
                    selectOption s5=new selectOption(s,s);
                    op3.add(s5);
                    integer x=op4.indexOf(s5);
                       op4.remove(x);
                   
                }
            }
        public void invoke5(){
            count++;
            if(wrp.size()==2){
                apexpages.Message msg=new apexpages.Message(apexpages.Severity.ERROR,'Only two Conditions are Allowed');
                apexpages.addMessage(msg);
            }else{
            wrapper we=new wrapper();
            we.field=op4;
            we.operator=op5;
           
            wrp.add(we);
            }
            }
        public void remove(){
           
            wrp.remove(wrp.size()-1);
        }
        public void invoke6(){
            if(condition=='A and B' || condition=='AandB' || condition=='' ){
           string query='Select id';
           s=new list<string>();
            for(selectOPtion o:op4){
                s.add(o.getValue());
            }
            for(string s1:s){
                query=query+','+s1;
            }
            query=query+' from '+selected1+' where ';
            //integer count=0;
            for(wrapper w:wrp){
               
                query=query+w.selected4+w.selected5+'\''+w.value+'\'';
                if(wrp.size()>1 && wrp.indexOf(w)!=wrp.size()-1){
                    query=query+' and ';
                }
               
            }
           
           
            sobj=database.query(query);
            }else if (condition=='A OR B' || condition=='aorb' ){
                string query='Select id';
           s=new list<string>();
            for(selectOPtion o:op4){
                s.add(o.getValue());
            }
            for(string s1:s){
                query=query+','+s1;
            }
            query=query+' from '+selected1+' where ';
            //integer count=0;
            for(wrapper w:wrp){
               
                query=query+w.selected4+w.selected5+'\''+w.value+'\'';
                if(wrp.size()>1 && wrp.indexOf(w)!=wrp.size()-1){
                    query=query+' or ';
                }
               
            }
           
           
            sobj=database.query(query);
               
               
            }
        }
   
    public void test(){
       
       
list<schema.SObjectType> childObject=new list<schema.SObjectType>();
schema.SObjectType Convert=schema.getGlobalDescribe().get('Account');
        schema.DescribeSObjectResult r=convert.getDescribe();
        list<schema.ChildRelationship> c=r.getChildRelationships();
        for(schema.ChildRelationship c1:c){
         //   if(c1.isAccessible() && c1.isUpdateable() && c1.isDeleteable()){
            childobject.add(c1.getChildSObject());
            system.debug(c1.getchildsObject());
        }
        //}
    }
       
       
            public class wrapper{
            public list<selectOption> field{set;get;}
            public List<Selectoption> operator{set;get;}
            public string value{set;get;}
                public string Selected4{set;get;}    
                public string selected5{set;get;}
                public wrapper(){
                 field=new list <selectOption>();
                 operator=new list <selectOption>();  
                   
                   
                }
            }
       
        }