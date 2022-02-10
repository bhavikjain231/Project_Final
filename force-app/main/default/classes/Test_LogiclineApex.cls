@isTest
public class Test_LogiclineApex {
    @isTest static void testApex(){
        List<Account> accList=new List<Account>();
        
        Account acc=new Account();
        acc.Name='Hello';
        accList.add(acc);
        insert accList;
        date dt=system.today();
        LogiclineApex.saveChildRecord(accList, dt,80, 'Closed Won');
        LogiclineApex.fetchAccountWrapper();
        LogiclineApex.saveChildRecord(accList,dt,80, '');
    }
}