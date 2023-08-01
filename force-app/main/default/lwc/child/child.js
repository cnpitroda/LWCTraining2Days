import { LightningElement,api, track } from 'lwc';

export default class Child extends LightningElement {

    firstName='James';
    lastName='Howk';
    @api companyName='Cognizant';


    get uppercasedFullName(){
        return this.firstName.toUpperCase() + ' ' + this.lastName.toUpperCase();
    }

    handleChange(event){
        if(event.target.name=='firstName'){
            this.firstName = event.target.value;
        }
        if(event.target.name=='lastName'){
            this.lastName = event.target.value;
        }
    }

    @api
    updateCompanyName(newName){
        console.log('Child Component Method');
        this.companyName = newName;
    }


   @track fullName = {firstName:'first Name',lastName:'last Name'};

    handleClick(event){
        this.fullName.firstName = 'SFDC';
        this.fullName.lastName = 'Folks';
    }


    handledispatchEvent(event){
        console.log ('handledispatchEvent');
        let eventDetails = {fN : this.firstName, lN : this.lastName};
        let evt = new CustomEvent ('sampleevent', {detail : eventDetails}); 
        this.dispatchEvent (evt); 
    }

}