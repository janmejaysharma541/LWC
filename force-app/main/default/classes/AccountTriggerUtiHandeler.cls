public class AccountTriggerUtiHandeler {
    
    public static void  createRelatedOppAndAccounts(List<Account>accList){
        
        List<Contact>conList = new List<Contact>();
        List<Opportunity>oppList = new List<Opportunity>();
        for(Account acc:accList){
            if(acc.Contact__c==true && acc.id!=null){
                Contact con =  new Contact();
                con.LastName = 'Sharma';
                con.AccountId = acc.Id;
                conList.add(con);
            }
           if(acc.Opportunity__c==true && acc.Active__c=='Yes' && acc.id!=null){
                Opportunity opp = new Opportunity();
                opp.CloseDate = system.today()+3;
                opp.StageName = '	Prospecting';
                opp.Name = 'testJJ';
                opp.AccountId = acc.id;
                oppList.add(opp);
            }
        }
        
        if(!oppList.isEmpty()){
            insert oppList;
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    
    public static void updateContactsPhone(Map<id,Account>newMapAccountList,Map<id,Account>oldMapAccountList){
        
        List <Contact>conListPhone = new List<Contact>();
        List<Contact>getContacts = [SELECT id,AccountId,Phone,LastName from Contact where Accountid =:newMapAccountList.keySet()];
        
        for(Contact con :getContacts){
            if(newMapAccountList.get(con.AccountId).Phone != oldMapAccountList.get(con.AccountId).Phone){
                con.AccountId = newMapAccountList.get(con.AccountId).id;
                con.Phone = newMapAccountList.get(con.AccountId).Phone;
                conListPhone.add(con);
            }  
        }
        
        if(!conListPhone.isEmpty()){
            update conListPhone;
        }
    }
    
	public static void updateOpportunity(Map<id,Account>newMapAccountList, Map<id,Account>OldMapAccountList){
    //  List<Opportunity> updatedOpportunity =  new List<Opportunity>();
      List<Opportunity>oppList =  [SELECT id,AccountId,StageName from Opportunity WHERE AccountId =:newMapAccountList.keySet()];
        
        for(Opportunity opp :oppList){
            if(newMapAccountList.get(opp.AccountId).Active__c != OldMapAccountList.get(opp.AccountId).Active__c){
                opp.AccountId = newMapAccountList.get(opp.AccountId).id;
                if(opp.StageName!='Closed Won' && newMapAccountList.get(opp.AccountId).Active__c =='No' &&  OldMapAccountList.get(opp.AccountId).Active__c!=''){
                    opp.StageName = 'Closed Lost';
                }
                
              
            }
          //  updatedOpportunity.add(opp);
        }
        
        if(!oppList.isEmpty()){
            update oppList;
        }
    }
    
    public static void preventDeletionOfAccount(List<Account>accountList){
        
        for(Account acc:accountList){
            if(acc.Active__c=='Yes'){
                acc.addError('Cannot delete Active Account');
            }
        }
    }
    
    public static void preventEdit(Map<Id,Account>oldAccountMap,Map<Id,Account>NewAccountMap){
       
        for(Account acc:NewAccountMap.values()){
            if(acc.CreatedDate<system.today()-6){
           // acc.addError('no no no');
        }
        }
    }
    
}