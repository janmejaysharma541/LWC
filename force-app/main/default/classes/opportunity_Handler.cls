public class opportunity_Handler {
		
    public static void  updateOpportunityAmount(Map<Id,Opportunity>newMap ,Map<Id,Opportunity>oldMap){
        
        Set<Id>accountList = new Set<Id>();
        // to ensure  only one account exsists for many opp
        
        for(Opportunity opp:newMap.Values()){
            if(opp.AccountId!=null && newMap.get(opp.id).Amount!=oldMap.get(opp.id).Amount){
                accountList.add(opp.AccountId);
            }
        }
        
        List<AggregateResult>aggr = [SELECT AccountId ids,sum(Amount)totalAmount from Opportunity WHERE AccountId IN :accountList group by AccountId ];
        //											Alias               Alias                                        have to group aggregate query
     
        Map<Id,Account>AccountMapTotal = new Map<Id,Account>();
        if(!aggr.isEmpty()){
            for(AggregateResult ag :aggr){
                Account acc =  new Account();
                
                acc.id = (Id)ag.get('ids');
                acc.Opportunity_Amount__c = (Decimal)ag.get('totalAmount');
                AccountMapTotal.put(acc.id,acc);
            }
        }
        
        if(!AccountMapTotal.isEmpty()){
            update AccountMapTotal.values();
        }
       
        
    }
    
    
    
    
    
    
}