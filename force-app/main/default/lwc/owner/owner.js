import { LightningElement } from 'lwc';

export default class Owner extends LightningElement {
    companyName;
    eventDetails = {};
    handleChange(event){
        this.companyName = event.target.value;
    }

    handleClick(event){
        this.template.querySelector('c-child').updateCompanyName(this.companyName);
    }

    handleSampleevent(event){
        console.log('handleSampleevent'+JSON.stringify(event));
        this.eventDetails = event.detail;
        console.log('this.eventDetails'+this.eventDetails);
    }
}