import { LightningElement, track } from 'lwc';

export default class Calc extends LightningElement {
    num1;
    num2;
    @track
    result=0;

    handleChange(event){

        if(event.target.name=="num1"){
            this.num1 = parseInt(event.target.value);
        }
        if(event.target.name=="num2"){
            this.num2 = parseInt(event.target.value);
        }
    }

    handleClick(event){
       
        if(event.target.name=="+"){
            this.result = this.num1 + this.num2;
        }
        if(event.target.name=="-"){
            this.result = this.num1 - this.num2;
        }
        if(event.target.name=="*"){
            this.result = this.num1 * this.num2;
        }
        if(event.target.name=="/"){
            this.result = this.num1 / this.num2;
        }
    }

}