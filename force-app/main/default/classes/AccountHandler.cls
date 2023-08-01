public class AccountHandler {
    
    
    public void fetchAccounts(){
        Map<Id,List<Contact>> accContactMap = new Map<Id,List<Contact>>();
        List<Account> accConList  = [Select Id,Name,Rating,
                                     (Select Id,FirstName,LastName,Title from contacts where Title='CEO')
                                     from Account ];
        
        for(Account ac:accConList){
            accContactMap.put(ac.Id,ac.Contacts);            
        }
       System.debug('accContactMap'+accContactMap);
    }
    
    public void fetchOpportunities(string stage){
        List<Opportunity> opportunityList = [Select Id,Name,Amount,StageName,CloseDate from Opportunity
                                            Where StageName=:stage AND Amount!=null Order By CloseDate desc];
        System.debug('OpportunityList==='+opportunityList);
    }
    
    public Map<Id,Integer> fetchContactCount(){
        Map<Id,Integer> accContactMap = new Map<Id,Integer>();
        List<Account> accList = [Select Id,Name from Account];
        for(Account acc:accList){
            Integer Count = [Select count() from Contact where AccountId=:acc.Id];
            accContactMap.put(acc.Id,Count);
        }
        return accContactMap;
    }
    
    public Map<Id,Integer> fetchOpportunityCount(){
        Map<Id,Integer> accOppMap = new Map<Id,Integer>();
        List<Account> accList = [Select Id,Name from Account];
        for(Account a:accList){
            Integer Count = [Select count() from Opportunity where AccountId=:a.Id];
            accOppMap.put(a.Id,Count);
        }
        return accOppMap;
    }
    
    public void searchContacts(string name1,String name2){
        String searchString = name1 + ' OR ' + name2;
        List<List<sobject>> searchList = [FIND:searchString IN ALL FIELDS 
                                          RETURNING Contact(Id,FirstName,LastName,Title)];
        Contact[] searchContacts = (Contact[]) searchList[0];
        for(Contact c:searchContacts){
            System.debug('c'+c);
        }
    }
    
}