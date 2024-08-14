public class userHandeler {
	
    
    public static void assignPermissionSet(List<user>Users){
        Set<Id>getUserId = new Set<Id>();
        for(User u :Users){
            getUserId.add(u.id);
        }
        
        runFutureForPermission(getUserId);
    }
    
    
    @future
    Public static void runFutureForPermission(Set<id>Users){     
             
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        List<User>getUser = [Select id,LastName,ProfileId from user where id=:Users ];
         Profile salesProfile = [Select Id From Profile Where Name = 'Solution Manager' LIMIT 1];
 	    for(user u : getUser){
            if(u.LastName != null && u.ProfileId == salesProfile.Id){
                PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = '0PSdL000005MkED', AssigneeId = u.Id);
                permissionSetList.add(psa);
				system.debug('jj LastName'+u.LastName);	
                system.debug('jj ProfileId'+u.ProfileId);	
            }
        }
        
        if(!permissionSetList.isEmpty()){
             system.debug('jj permissionSetList'+permissionSetList);
            insert permissionSetList;
        }
    }
}