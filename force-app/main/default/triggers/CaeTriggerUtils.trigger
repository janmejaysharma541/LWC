trigger CaeTriggerUtils on Case (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        casetriggerutilhandeler.appendCaseNoInAccount(trigger.new);
    }
}