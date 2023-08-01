({
	add : function(component) {
		var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        console.log("num1"+num1);
        var sumResult = parseInt(num1) + parseInt(num2);
        component.set("v.result",sumResult);
	},
    sub : function(component) {
		var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        console.log("num1"+num1);
        var sumResult = parseInt(num1) - parseInt(num2);
        component.set("v.result",sumResult);
	},
    mul : function(component) {
		var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        console.log("num1"+num1);
        var sumResult = parseInt(num1) * parseInt(num2);
        component.set("v.result",sumResult);
	},
    div : function(component) {
		var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        console.log("num1"+num1);
        var sumResult = parseInt(num1) / parseInt(num2);
        component.set("v.result",sumResult);
	}
    
})