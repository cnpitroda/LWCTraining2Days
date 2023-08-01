({
	getOpportunityList : function(component) {
		component.set('v.mycolumn',[
            {label:'Name',fieldName:'Name',type:'text'},
            {label:'Stage',fieldName:'StageName',type:'text'},
            {label:'Amount',fieldName:'Amount',type:'text'}
        ])
        var action = component.get("c.getOpportunity");
        action.setCallback(this,function(response){
            console.log('response'+JSON.stringify(response.getReturnValue()));
            component.set("v.data",response.getReturnValue());
        }         
        );
        $A.enqueueAction(action);
	}
})