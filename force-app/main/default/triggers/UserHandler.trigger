trigger UserHandler on User (after insert) {
    
    
    
    if(Trigger.isInsert && Trigger.isAfter){
       userHandeler.assignPermissionSet(trigger.new);
    }

}