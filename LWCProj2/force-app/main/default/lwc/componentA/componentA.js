import { LightningElement } from 'lwc';

export default class ComponentA extends LightningElement {
    username=''
    handleClick(event){
        this.username=event.detail;
        console.log('testFlag12Gparent',event);

    }
}