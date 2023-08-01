trigger OpportunityTrigger on Opportunity (before insert,before update) {
    for(Opportunity o:Trigger.new){
     //   o.CloseDate=System.date.today();
    }
}