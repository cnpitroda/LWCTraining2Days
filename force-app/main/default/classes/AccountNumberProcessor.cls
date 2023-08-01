global class AccountNumberProcessor implements Database.Batchable<sObject>,Schedulable {

    
    global void execute(SchedulableContext sc){
        Database.executeBatch(new AccountNumberProcessor(),1);
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Name,AccountNumber from Account');
    }
    
    public void execute(Database.BatchableContext info,List<Account> scope){
        List<Account> accUpdateList = new List<Account>();
        for(Account a:scope){
            if(String.isBlank(a.AccountNumber)){
                a.AccountNumber = String.valueof(System.Math.random()).right(12);
                accUpdateList.add(a);
            }
        }
        if(accUpdateList.size()>0){
            update accUpdateList;
        }
    }
    public void finish(Database.BatchableContext info){
        System.debug('Finshed Processing info'+info);
    }
}