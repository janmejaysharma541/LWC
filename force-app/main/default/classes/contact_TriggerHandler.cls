public class contact_TriggerHandler {
    
    public static void updateAccountDescription(Map<id,Contact>OldContactList,Map<id,Contact>newContactList){
        //
        Set<Id>AccountSetId = new Set<Id>();
        
        
        // we will itereate    through map and insert it in set
        for(Contact con :newContactList.values()){
            if(newContactList.get(con.id).Description!=null &&  OldContactList.get(con.id).description !=newContactList.get(con.id).description){
                AccountSetId.add(con.AccountId);
            }
        }
        
        Map<Id,Account>AccountMap =  new Map<Id,Account>([Select id,Description from Account where id IN:AccountSetId]);       
        List<Account>UpdatedDescription = new List<Account>();
        
        for(Contact con:newContactList.Values()){
            if(con.Description!=null){
                Account acc = AccountMap.get(con.AccountId);
                acc.Description = con.Description;
                UpdatedDescription.add(acc);
            }
            
        }
        if(!UpdatedDescription.isEmpty()){
            update UpdatedDescription;
        }
        
        
        
        
    }
    
    public static void InsertUndeleteContact(List<Contact>NewcontactList){
        
    }
}