import { LightningElement,wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

export default class Subscriber extends LightningElement {
        eventMessage;

        @wire(CurrentPageReference) pageRef;

        connectedCallback(){
            console.log('Connected Callback');
            registerListener('pubsubevent',this.handleEvent,this);
        }

        handleEvent(payload){
            console.log('inside Handle Event');
            this.eventMessage = payload;
        }

        disconnectedCallback(){
            console.log('disconnectedCallback');
            unregisterAllListeners(this);
        }
}