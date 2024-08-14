public class casetriggerutilhandeler {
    public static void appendCaseNoInAccount(List<Case>caseList){
        List<Account>accList = new List<Account>();
        
        for(Case cl:caseList){
            Account acc =  new Account();
            acc.id = cl.accountId;
            acc.Latest_Case_Number__c =  cl.CaseNumber;
            accList.add(acc);
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
    }
}