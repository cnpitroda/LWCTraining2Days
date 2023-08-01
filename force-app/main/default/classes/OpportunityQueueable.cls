public class OpportunityQueueable implements queueable {
    private List<Opportunity> oppList;
    public OpportunityQueueable(List<Opportunity> oppList){
        this.oppList = oppList;
    }
    public void execute(QueueableContext context){
        for(Opportunity opp:oppList){
            if(opp.IsClosed==false && opp.CreatedDate<System.Date.today()-4){
                opp.StageName='Needs Analysis';
            }
        }
        update oppList;
    }
}