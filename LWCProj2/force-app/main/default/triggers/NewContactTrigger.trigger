trigger NewContactTrigger on Contact (after insert) {
    if (!Trigger.new.isEmpty()) { //if there are incoming contacts, then come inside
        //Gather AccountIds
        Set<Id> accIds = new Set<Id>();
        for (Contact curContact : Trigger.new) {
            if (curContact.AccountId!=null) { //lets ensure that accoundid is atleast not null
                accIds.add(curContact.AccountId);
            }
        }

        if(!accIds.isEmpty()){ // if we collected accIds, come inside
            //Creating a maopp to gather recently added contact.
            Map<Id,Contact> contactToAcc = new Map<Id,Contact> ( [ select Id,AccountId,name from Contact 
            where AccountId in : accIds 
            order by CreatedDate desc
            
            limit 1] );
            List<Contact> contactToUpdate = new List<Contact>();
            List<Contact> contactList = [select id,AccountId,newContact__c from Contact where AccountId  in : accIds];
            for (Contact curContact : contactList) {
                
                if (contactToAcc.containsKey(curContact.Id)) { //if the contact is contained, check the checkbox
                    curContact.newContact__c=true;
                }
                else {
                    curContact.newContact__c=false;
                }
                contactToUpdate.add(curContact);
            }
            if (!contactToUpdate.isEmpty()) {
                UPDATE contactToUpdate;
            }

        }

    }
}