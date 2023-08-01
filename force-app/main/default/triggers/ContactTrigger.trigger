trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {
     
      if(Trigger.isafter){
        if(Trigger.isinsert || Trigger.isundelete){
            AccountContactrollupHelper.processRecords(Trigger.new);
        }
        if(Trigger.isUpdate){
           AccountContactrollupHelper.processRecords(Trigger.new);
           AccountContactrollupHelper.processRecords(Trigger.old);
        }
        if(Trigger.isdelete){
           AccountContactrollupHelper.processRecords(Trigger.old);
        }
    }        
   
}