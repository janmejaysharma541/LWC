import { LightningElement,api } from 'lwc';

export default class DynamicRecordsAndObject extends LightningElement {
    @api objectApiName;
    @api recordId;
}