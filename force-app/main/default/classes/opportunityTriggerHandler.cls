public class opportunityTriggerHandler {
    
    public static void InsertAmountonOpportunity(List<Opportunity>NewList){
        Set<id>AccountSet  =  new Set<Id>();
        
        if(!NewList.isEmpty()){
            for(Opportunity opp:NewList){
                AccountSet.add(opp.AccountId);
                // prevents duplicates
            }
        }
        List<AggregateResult>getSumOfAmount = [Select AccountId id,Sum(Amount)oppAmount from Opportunity where AccountId IN: AccountSet group by AccountId];
        
    }
    public static void UndeleteAmountonOpportunity(List<Opportunity>NewList){}
    public static void UpdateAmountonOpportunity(List<Opportunity>NewList){}
    public static void deleteAmountonOpportunity(List<Opportunity>NewList){}
    
}