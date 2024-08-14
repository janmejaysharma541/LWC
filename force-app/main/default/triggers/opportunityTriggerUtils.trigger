trigger opportunityTriggerUtils on Opportunity (after insert,after update,after delete) {
    if(trigger.isUpdate && trigger.isAfter){
            opportunity_Handler.updateOpportunityAmount(trigger.newMap,trigger.oldMap);

    }
}