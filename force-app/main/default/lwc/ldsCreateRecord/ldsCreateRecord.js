import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LdsCreateRecord extends LightningElement {

    accountId;
    name = '';

    handleChange(event){
        this.name = event.target.value;
        this.accountId = undefined;
    }

    createAccount(){
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.name;

        const recordInput = {apiName:ACCOUNT_OBJECT.objectApiName,fields};

        createRecord(recordInput)
            .then(account=>{
                    this.accountId = account.id;
                    this.dispatchEvent( 
                        new ShowToastEvent({title:'Success', message:'Account Created',variant:'Success'}),
                    );
            })
            .catch(error=> {
                this.dispatchEvent( 
                    new ShowToastEvent({title:'Error', message:error.body.message,variant:'error'}),
                );
            });
            
    }
}