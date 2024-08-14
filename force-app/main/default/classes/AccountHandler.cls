public class AccountHandler {
    
 /*   public static void updatePhoneNo(List<Account>newAccountList,Map<id,Account>oldAccountMap){
    //                                   ↓                ↓ 
   //                                    ↓                ↓         
  // dusra tareeka hai  ki mai upar hi Map<id,Account>newAccountList Pass kr deta  trigger se hi  to mujhe nice alg se map nahi bnana padta kyoki bina loop 
 // kiye  iterate map hi krega
        
        /*
         
         
        Here I am creating  MAP/Set so that I can filter if any duplicate record is present if any Map/set will prevent the duplication
        and just adding account triggered by trigger.new 
		

		*//*
        
        Map<id,Account>accountIdSet = new Map<Id,Account>();
        
        // check if list is null or empty
        if(!newAccountList.isEmpty() ){
            for(Account acc:newAccountList){
                //compare if update has happened or not?
                if(acc.Phone != oldAccountMap.get(acc.id).Phone){
                    accountIdSet.put(acc.Id,acc);
                }  
            }
        }
        
        // get list of contact related to that account  
        List<Contact>getContactList = [Select id,AccountId,Phone from Contact where AccountId=:accountIdSet.keySet()];
        //Create a listof contact to add updated value of phone 
        List<Contact>UpdatedPhoneContactList = new List<Contact>();
        
        // PHELA DOUBT HAI KI WAHA SE LIST PASS KRENGE TO MAP MAI   account ka phone kese get krenge?    
        for(Contact Con : getContactList){
            con.Phone = accountIdSet.get(con.AccountId).Phone;
            UpdatedPhoneContactList.add(con);
        }
        
        if(!UpdatedPhoneContactList.isEmpty()){
            update UpdatedPhoneContactList;
        }
        
        
    }
    */
    // method 2
    public static void updatePhoneNomethod2(Map<Id,Account>newMapAccountList,Map<id,Account>oldAccountMap){
       
        
        if(!newMapAccountList.isEmpty()){
            List <Contact> UpdatedPhone =[Select id,AccountId,Phone from Contact where AccountId=:newMapAccountList.keySet()];
            List<Contact>UpdatedPhonecontact = new List<Contact>();
            for(Contact con :UpdatedPhone){
                if(newMapAccountList.get(con.AccountId).phone!= oldAccountMap.get(con.AccountId).Phone){
                    con.Phone = newMapAccountList.get(con.AccountId).phone;
                    UpdatedPhonecontact.add(con);
                }
               
            }
            if(!UpdatedPhonecontact.isEmpty()){
                update UpdatedPhonecontact;
            }
        }

    }
}