trigger AccountTrigger on Account (before delete) {
	
    if(AccountTriggerHandler.firstRun==false){
        AccountTriggerHandler.firstRun=true;
        AccountTriggerHandler.processRecords(Trigger.old);
    }
   
}