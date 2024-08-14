import { LightningElement,wire } from 'lwc';
import AccountList from "@salesforce/apex/AccountHandeler.getAccountList"
const getColumns = [
    { label:'Account Name', fieldName:'Name' },
    { label:'Account Rating' , fieldName:'Rating' },
    { label:'Phone Number' , fieldName:'Phone' }
];
export default class WireServicesWithProperty extends LightningElement {
   displayColumns = getColumns;
    @wire (AccountList) getAccounts; 
}