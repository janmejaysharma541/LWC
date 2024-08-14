public with sharing class AccountHandeler {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        system.debug('jii haa');
        return [Select id,Name,Rating,Phone FROM Account LIMIT 15];
       
    }
 
}