import { LightningElement,api,wire } from 'lwc';
import {getRecord} from "lightning/uiRecordApi";
import GET_ACCOUNT_NUMBER from "@salesforce/schema/Account.AccountNumber";
import GET_ACCOUNT_NAME from "@salesforce/schema/Account.Name";
import GET_ACCOUNT_REVENUE from "@salesforce/schema/Account.AnnualRevenue";

export default class GetRecord_uiRecordApi extends LightningElement {
    @api recordId;
    accountRevenue;accountName;accountNumber;
    @wire(getRecord,{ 
        recordId :"$recordId",
        fields:[GET_ACCOUNT_NUMBER,GET_ACCOUNT_NAME,GET_ACCOUNT_REVENUE]
    })
    outputFunction({data,error}){
        if(data){
            console.log(data);
            this.accountNumber = data.fields.AccountNumber.value;
            this.accountName = data.fields.Name.value;
            this.accountRevenue = data.fields.AnnualRevenue.value;
        }
        else if(error){
            
            console.log("ERROR IS "+error);
        }
    }
  
}