public class AccountContactrollupHelper {
 public static void processRecords(List<Contact> genericList){
        List<Account> accountUpdateList = new List<Account>();
        List<Account> accountdeleteList = new List<Account>();
         Set<Id> accountIds = new Set<Id>();
        for(Contact c:genericList){
                if(c.AccountId!=null){
                    accountIds.add(c.AccountId);
                }
            }
        List<AggregateResult> aggregatelist = [SELECT COUNT(id)contactcount,AccountId FROM Contact where AccountId in:accountIds group by AccountId];
        if(aggregatelist != null && aggregatelist.size() > 0){
             for(AggregateResult aggr:aggregatelist){  
                Account acc = new Account();
                acc.id = (id)aggr.get('AccountId');
                acc.ContactCount__c = (decimal)aggr.get('contactcount');
                accountUpdateList.add(acc);
            }
      }
        else{ 
          for(Id I:accountIds) 
            {    
                     Account acc = new Account();            
                      acc.Id = I;            
                      acc.ContactCount__c = null;                
                      accountdeleteList.add(acc);           
            }
         }  
      if(accountUpdateList.size()>0){
            update accountUpdateList;
        }
      if(accountdeleteList.size()>0){
            update accountdeleteList;
        } 
   }

}