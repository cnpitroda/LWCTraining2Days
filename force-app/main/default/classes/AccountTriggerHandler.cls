public class AccountTriggerHandler {
	public static boolean firstRun=false;
    
    public static void processRecords(List<Account> accList){
        try{         
        
                for(Account a:accList){
                List<Opportunity> oppList = [Select Id,IsClosed,AccountID from Opportunity 
                                            WHERE IsClosed=false AND AccountID=:a.Id];
                system.debug('oppList'+oppList);
                if(oppList!=null && oppList.size()>0){
                    a.Name.AddError('There are Open Opportunities for Account');
                 }
                }
            
    		} catch(Exception e){
     			System.debug('e.getCause()'+e.getCause());   
                System.debug('e.getTypeName()'+e.getTypeName());   
          }
    }
}