({
	handleSubmit : function(component, event, helper) {
		const fields = event.getParam('fields');
        component.find('myForm').submit(fields);
        alert('Record Saved');
	}
})