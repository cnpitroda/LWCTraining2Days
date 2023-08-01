({
	sendMessage : function(component, event, helper) {
        var appEvent = $A.get("e.c:SampleApplicationEvent");
        appEvent.setParams({"message":"Its Friday"});
        appEvent.fire();
	}
})