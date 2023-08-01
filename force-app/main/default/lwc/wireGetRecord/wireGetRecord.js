import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement,api,wire } from 'lwc';

const FIELDS = ['Contact.Name','Contact.Title','Contact.Email','Contact.Phone'];

export default class WireGetRecord extends LightningElement {

    @api recordId;

    @wire(getRecord,{recordId:'$recordId',fields:FIELDS}) contact;


    get name(){
        return this.contact.data.fields.Name.value;
    }

    
    get title(){
        return this.contact.data.fields.Title.value;
    }

    
    get email(){
        return this.contact.data.fields.Email.value;
    }
    
    get phone(){
        return this.contact.data.fields.Phone.value;
    }
  
}