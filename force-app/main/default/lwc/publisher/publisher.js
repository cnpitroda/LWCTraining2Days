import { LightningElement,wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
export default class Publisher extends LightningElement {

    message = 'Greetings';

    @wire(CurrentPageReference) pageRef;

    handleChange(event){
        this.message = event.target.value;
        console.log('this.message'+this.message);
    }

    handleClick(event){
        console.log('fireEvent'+this.message);
        console.log('fireEvent'+event.target.name);
        fireEvent(this.pageRef,'pubsubevent',this.message);
    }
}