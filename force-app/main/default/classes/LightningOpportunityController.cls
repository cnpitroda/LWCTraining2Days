public class LightningOpportunityController {
		
    @AuraEnabled(cacheable=true)
    public static list<Opportunity> getOpportunity(){
        return [Select Id,Name,StageName,Amount,CloseDate from Opportunity];
    }
    
    @AuraEnabled()
    public static string updateOpportunity(List<Opportunity> oppList){
        string result = 'false';
        if(oppList.size()>0){
            update oppList;
            result = 'true';
        }
        return result;
    }
}