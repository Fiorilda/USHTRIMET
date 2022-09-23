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
    BufferingDataProvider
  ) {

    function CustomerViewModel() {      
      this._initAllIds();
      this._initAllLabels();
      this._initAllObservables();
    };
    
    CustomerViewModel.prototype._initAllObservables=function (){
      this.inputFirstNameValue=ko.observable(null);
      this.inputLastNameValue=ko.observable(null);
      this.inputAgeValue=ko.observable(null);
      this.inputBirthPlaceValue=ko.observable(null);
      this.inputBirthDateValue=ko.observable(null);
      this.inputGenderValue=ko.observable(null);
      
        this.deptArray = JSON.parse(null);
              this.deptObservableArray = ko.observableArray(this.deptArray);
              this.dataprovider = new BufferingDataProvider(new ArrayDataProvider(this.deptObservableArray, {
                  keyAttributes: 'Name'
      }));

      this.dataProvider1=ko.observable();

      //this.NRFemer;
      this.array=[
        {
          id: 0,
          series: "Male",
          group: "Group A",
          value: 23
        }, 
        {
          id: 1,
          series: "Female",
          group: "Group A",
          value: 55
        }
      ];

      this.deptObservableArray = ko.observableArray(this.array);
      this.dataProvider1= new ArrayDataProvider(this.deptObservableArray, {
        keyAttributes: "id",
      });

      console.log(this.array[1].value);
      console.log(this.NRFemer);

      // this.dataProvider1=ko.observable( new ArrayDataProvider([
      //   {
      //     id: 0,
      //     series: "Series 1",
      //     group: "Group A",
      //     value: this.inputAgeValue()
      //   }, 
      //   {
      //     id: 1,
      //     series: "Series 2",
      //     group: "Group A",
      //     value: 55
      //   }
      // ], {
      //     keyAttributes: "label",
      // }));

      
      //Data Provider
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

      this.onSaveButtonClick=this._onSaveButtonClick.bind(this);

 };

    CustomerViewModel.prototype._onSaveButtonClick=function (){
      const ClientData = {
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

      
      // console.log(ClientData.Gender);
      //    if(ClientData.Gender=='Female'){
      //       this.NRFemer++;
      //    }
      // console.log("nr femer"+this.NRFemer);

      // this.array[1].value=this.NRFemer;
      // console.log(this.array[1].value);

      // const array=[
      //   {
      //     id: 0,
      //     series: "Series 1",
      //     group: "Group A",
      //     value: this.inputAgeValue()
      //   }, 
      //   {
      //     id: 1,
      //     series: "Series 2",
      //     group: "Group A",
      //     value: 55
      //   }
      // ]; 
    };

    CustomerViewModel.prototype._initAllIds=function (){
       this.inputFirstNameId=CoreUtils.generateUniqueId();
       this.inputLastNameId=CoreUtils.generateUniqueId();      
    };

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


