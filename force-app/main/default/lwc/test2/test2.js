import { LightningElement } from 'lwc';

export default class Test2 extends LightningElement {

    handleClick() {
        var temp = 'https://bhavikjain238-dev-ed.lightning.force.com/c/LightningForSubtabApp.app';
        window.location.href = temp;
    }
}