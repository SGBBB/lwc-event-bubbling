import { LightningElement } from 'lwc';

export default class ComponentC extends LightningElement {
    fullName=''
    handleClick(event){
        console.log('inside handleClick()');
        this.fullName=this.refs.fullname.value;
         
         
        //When custom event is added its bubbled to parent root
        const customEvent=new CustomEvent('usernamechange',{
            bubbles:true,
            composed:true,
            detail:this.fullName
        }); //event name has to be in lowercase characters

        this.dispatchEvent(customEvent);

    }

}