({
	fetchAccounts : function(component) {
		component.set('v.mycolumn',[
            {label:'Name',fieldName:'Name',type:'text'},
            {label:'Rating',fieldName:'Rating',type:'text'},
            {label:'Industry',fieldName:'Industry',type:'text'}
        ])
        var accRating = component.get("v.rating");
        var action = component.get("c.getAccounts");
        action.setParams({rating:accRating});
        action.setCallback(this,function(response){
            console.log('response'+JSON.stringify(response.getReturnValue()));
            var len = response.getReturnValue().length;
            component.set("v.data",response.getReturnValue());
            var compEvent = component.getEvent("sampleComponentEvent");
            compEvent.setParams({"searchSize":len});
            compEvent.fire();
        }         
        );
        $A.enqueueAction(action);
	},
})