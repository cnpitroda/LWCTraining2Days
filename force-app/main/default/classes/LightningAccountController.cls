public class LightningAccountController {
		
    @AuraEnabled(cacheable=true)
    Public static List<Account> getAccounts(string rating){
    	List<Account> accList = [Select Id,Name,Rating,Industry from Account where Rating=:rating ];
        return accList;
    }
}