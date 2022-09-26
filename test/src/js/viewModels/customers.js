/**
 * @license
 * Copyright (c) 2014, 2022, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/*
 * Your customer ViewModel code goes here
 */
define([
  "knockout",
  "utils/Core",
  "ojs/ojarraydataprovider",
  "ojs/ojbufferingdataprovider",
  "ojs/ojasyncvalidator-length",
  "ojs/ojinputtext",
  "ojs/ojformlayout",
  "ojs/ojinputnumber",
  "ojs/ojdatetimepicker",
  "ojs/ojselectsingle",
  "ojs/ojbutton",
  "ojs/ojtable",
  "ojs/ojchart"   
],
function(
  ko,
  CoreUtils,
  ArrayDataProvider,
  BufferingDataProvider,
  AsyncLengthValidator,
  girlCount=0,
  boyCount=0,
  array=[]
){


function CustomerViewModel() {   
  this._initAllIds();
  this._initAllLabels();
  this._initAllObservables();
  this._initValidators();
  this._initVariables();
  this.onInputFirstNameRawValueChange=this._onInputFirstNameRawValueChange.bind(this);

  this.deptArray=[];
  this.deptObservableArray = ko.observableArray(this.deptArray);
  this.dataprovider = new BufferingDataProvider(new ArrayDataProvider(this.deptObservableArray, {
                      keyAttributes: 'Name'
  }));   

  array=[
    {
      id: 0,
      series: "Male",
      group: "Group A",
      value: girlCount
    }, 
    {
      id: 1,
      series: "Female",
      group: "Group A",
      value: boyCount
    }
  ];
    //console.log("mdjsn"+ this.array[0].value);
    var chartData = ko.observableArray(array);
    this.dataProvider1= new ArrayDataProvider(chartData, {
    keyAttributes: "id",
    });

    this.onSaveButtonClick=()=>{
      let  ClientData = {
      Name: this.inputFirstNameValue(),
      LastName: this.inputLastNameValue(),
      Birthday: this.inputBirthDateValue(),
      Gender: this.inputGenderValue(),
      Birthplace:this.inputBirthPlaceValue(),
      Age:this.inputAgeValue()
      };
      this.dataprovider.addItem({
      metadata: { key: ClientData.Name},  
      data:ClientData
    });

    if(this.inputGenderValue() == "Female"){
        girlCount++;
    }else if (this.inputGenderValue() == "Male"){
         boyCount++;
    }
      //console.log(girlCount);

    array[0].value=girlCount;
    array[1].value=boyCount;

    valueCache={};
    chartData(array);

};

};

/*
 @function ._initValidators
 @description Initializes all observable values 
 */
CustomerViewModel.prototype._initAllObservables=function (){
  this.inputFirstNameValue=ko.observable(null);
  this.inputLastNameValue=ko.observable(null);
  this.inputAgeValue=ko.observable(null);
  this.inputBirthPlaceValue=ko.observable(null);
  this.inputBirthDateValue=ko.observable(null);
  this.inputGenderValue=ko.observable(null);
  this.isInputLastNameDisable=ko.observable(true);
 
  this.isInputLastNameDisable=ko.computed(function(){
    if(this.inputFirstNameValue()){
      return false; 
    }
      return true;
  },this);

//Data Provider for gender dropDown
this.inputGenderDataProvider=ko.observable( new ArrayDataProvider([
  {
    value:1,
    label:"Female"        
  },
  {
    value:1,
    label:"Male"  
  },
  ], {
    keyAttributes: "label",
  }));

};


/*
 @function _onInputFirstNameRawValueChange
 @description customizes the First Name
 */
CustomerViewModel.prototype._onInputFirstNameRawValueChange=function (event){
  if(event.detail.value){
  event.currentTarget.validate();
  }
}

/*
 @function ._initValidators
 @description Initializes all variables
 */
CustomerViewModel.prototype._initVariables=function (){
  var currentDate=(new Date).toISOString().substring(0,10);
  this.inputBirthdayMaxValue=currentDate;

  //console.log((new Date).toISOString());
  //console.log(currentDate);   
}

/*
 @function _initValidators
 @description Initializes all the validators.
 */
CustomerViewModel.prototype._initValidators=function (){ 
  this.inputFirstNameValidators = ko.observableArray([
    new AsyncLengthValidator({
        min: 1,
        max: 35,
        countBy: "codeUnit",
        hint: {
            inRange: "Value must not have more then {max} characters",
        },
        messageSummary: {
            tooLong: "Custom: Too many characters",
            tooShort: "Custom: Too few characters",
        },
        messageDetail: {
            tooLong: "Custom: Number of characters is too high. Enter at most {max} characters",
            tooShort: "Custom: Number of characters is too low. Enter at least {min} characters.",
        },
    }),
  ]);
};

/*
 @function _onSaveButtonClick
 @description Executed when the user click the Save button.
 */

/*
 @function _initAllIds
 @description Initializes all the Ids.
 */
CustomerViewModel.prototype._initAllIds=function (){
  this.inputFirstNameId=CoreUtils.generateUniqueId();
  this.inputLastNameId=CoreUtils.generateUniqueId();      
};

/*
 @function _initAllLabels
 @description Initializes all Labels
 */
CustomerViewModel.prototype._initAllLabels=function (){
  this.inputFirstNameLabel="First Name";
  this.inputLastNameLabel="Last Name";
  this.inputAgeLabel="Age";
  this.inputBirthPlaceLabel="BirthPlace";
  this.inputBirthDateLabel="BirthDay";
  this.inputGenderLabel="Gender";
}

  return CustomerViewModel;

}

);

