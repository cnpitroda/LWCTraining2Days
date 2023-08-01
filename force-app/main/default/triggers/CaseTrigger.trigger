trigger CaseTrigger on Case (before insert,before update) {
		
    for(Case c:Trigger.new){
        if(c.status=='Closed'){
            c.Custom_Closed_Date_Time__c = System.Datetime.now();
        }
    }
    
}