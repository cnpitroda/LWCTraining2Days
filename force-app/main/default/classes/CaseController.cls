public class CaseController {
    
    public ApexPages.StandardSetController getCaseDetails{
        get{
            if(getCaseDetails==null){
                getCaseDetails = new ApexPages.StandardSetController(
                Database.getQueryLocator([Select CaseNumber,Status,Origin,Account.Name,Account.AnnualRevenue from Case]));
            }
            return getCaseDetails;
        }
        set;
    }

    public List<Case> getCases(){
        return (List<Case>)getCaseDetails.getRecords();
    }
}