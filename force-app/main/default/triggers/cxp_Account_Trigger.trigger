trigger cxp_Account_Trigger on Account (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        cxp_Account_Trigger_Handeler.updatePhoneContacts(trigger.new);
    }
}