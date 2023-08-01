import { LightningElement,wire } from 'lwc';
import getOpportunity from '@salesforce/apex/LightningOpportunityController.getOpportunity';
import updateOpportunity from '@salesforce/apex/LightningOpportunityController.updateOpportunity';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ApexMethodCalls extends LightningElement {

    columns = [
        {label:"Id", fieldName:"Id",type:"text"},
        {label:"Name", fieldName:"Name",type:"text"},
        {label:"Stage", fieldName:"StageName",type:"text",editable:true},
        {label:"Amount", fieldName:"Amount",type:"number"},
        {label:"CloseDate", fieldName:"CloseDate",type:"date"}
    ];


    oppotunitydata;
    err;

    @wire(getOpportunity)
    Opportunities({error,data}){
        if(data){
            this.oppotunitydata=data;
        }
        if(error){
            this.err = error;
        }
    }

    handleSave(event){

        var draft = event.detail.draftValues;

        updateOpportunity({oppList:draft})
        .then(()=> {
            this.dispatchEvent( new ShowToastEvent({title:'Sucess',message:'List updated',variant:'success'}));
        }).catch(error=>{
            this.dispatchEvent( new ShowToastEvent({title:'Failure',message:error.body.message,variant:'error'}));
        });

    }

}