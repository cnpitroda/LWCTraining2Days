public with sharing class ApexCalculator {
	
    public Integer calculate(Integer num1,Integer num2){
        Integer result = num1+num2;
        return result;
    }
    
    public integer subtract(Integer num1,Integer num2){
        Integer result = num1-num2;
        return result;
    }
    
    public integer doCalculation(Integer num1,Integer num2,String Operation){
        Integer result;
        switch on Operation{
            when '+'{
                result = num1+num2;
            }
            when '-'{
                result = num1-num2;
            }
            when '*'{
                result = num1*num2;
            }
            when '/'{
                if(num2!=0){
                    result = num1/num2;
                }else{
                    result=0;
                }
            }
        }
        return result;
    }
    
}