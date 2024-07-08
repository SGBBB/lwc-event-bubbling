import { LightningElement } from 'lwc';

export default class ComponentB extends LightningElement {
    username=''
    handleClick(event){
        this.username=event.detail;
        console.log('testFlag12',event);

    }
}