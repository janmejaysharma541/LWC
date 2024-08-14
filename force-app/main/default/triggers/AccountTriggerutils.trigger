trigger AccountTriggerutils on Account (after insert,after update,before update,before delete) {
    
    /* Question
     * On Account create two checkbox fields labeled as Contact and Opportunity.Now when a new Account record is created and if a particular 
Contact or Opportunity checkbox is checked thencreate that related record. AlsoOpportunity record should be created only if
the Account record Active picklist is
populated with a Yes.*/

    if(trigger.isInsert && trigger.isAfter){
        AccountTriggerUtiHandeler.createRelatedOppAndAccounts(trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
        //   Question ----> the Account phone is updated then populate the phone number on all related Contacts (Home Phone field). [Using Map]
        AccountTriggerUtiHandeler.updateContactsPhone(trigger.newMap , trigger.oldMap);
        
 //---------------------------------END---------------------------------------------------------------------//
 //
        /* Question------>	Write a trigger on Account when Account Active field is updated from ‘Yes’
			to ‘No’ then check all opportunities associated with the account. Update all
			Opportunities Stage to close lost if stage not equal to close won.*/
        
        AccountTriggerUtiHandeler.updateOpportunity(trigger.newMap,trigger.oldMap);
        
        
 //---------------------------------END---------------------------------------------------------------------//        

        
 //Prevent account record from being edited if the record is created 7 days back.

        
        AccountTriggerUtiHandeler.preventEdit(trigger.oldMap,trigger.newMap);
    }
    
    if(trigger.isDelete && trigger.isBefore){
        AccountTriggerUtiHandeler.preventDeletionOfAccount(trigger.old);
    }
    
    
}