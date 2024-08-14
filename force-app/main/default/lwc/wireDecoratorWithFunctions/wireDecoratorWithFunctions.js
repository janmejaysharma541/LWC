import { LightningElement,wire } from 'lwc';
import getAccountList from "@salesforce/apex/AccountHandeler.getAccountList";
const getColumns = [
    { label:'Account Name', fieldName:'Name' },
    { label:'Account Rating' , fieldName:'Rating' },
    { label:'Phone Number' , fieldName:'Phone' }
];
export default class WireDecoratorWithFunctions extends LightningElement {
    accounts;
    errors;
    displayColumns = getColumns;
    @wire(getAccountList) accountList({data,error}){
        if(data){
            console.log(data);
            

            
         let updatedAccounts =  data.map((currentItems)=>{
            let updatedObject={};
             if(!currentItems.hasOwnProperty('Rating')){
                    updatedObject={...currentItems,Rating:"Hot"};
             }else{
                updatedObject = {...currentItems};
             }
             return updatedObject;
           });
           this.accounts =[...updatedAccounts];
           this.errors = null;
           console.log('updated acounts',updatedAccounts);
        }else if(error){
            console.log("ERROR IS "+error);
            this.errors =error;
            this.accounts = null;
        }
       
        }
    }