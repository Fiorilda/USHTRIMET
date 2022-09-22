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
        "ojs/ojinputtext",
        "ojs/ojformlayout",
        "ojs/ojinputnumber",
        "ojs/ojdatetimepicker",
        "ojs/ojselectsingle",
        "ojs/ojbutton",
        "ojs/ojtable",
        "ojs/ojbufferingdataprovider"
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
     // this._initVariables();
    };

    var dept=[];
    
    CustomerViewModel.prototype._initAllObservables=function (){
      this.inputFirstNameValue=ko.observable(null);
      this.inputLastNameValue=ko.observable(null);
      this.inputAgeValue=ko.observable(null);
      this.inputBirthPlaceValue=ko.observable(null);
      this.inputBirthDateValue=ko.observable(null);
      this.inputBirthPlaceValue=ko.observable(null);
      this.inputGenderValue=ko.observable(null);

      this.dataprovider = new BufferingDataProvider( new ArrayDataProvider(dept, {
        keyAttributes: "departmentId",
      }));

  //   this.dataprovider = new BufferingDataProvider(new ArrayDataProvider(this.deptObservableArray, {
  //     keyAttributes: 'DepartmentId'
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
          keyAttributes: "value",
      }));
      

     // this.onSaveButtonClick=this._onSaveButtonClick.bind(this);

      this.onSaveButtonClick = () => {
            const dept = {
                DepartmentId: "nmgjk",
                DepartmentName: "hjbfv",
                LocationId: "hjbfv",
                ManagerId: "hjbfv"
            };
            this.dataprovider.addItem({
                metadata: { key: dept.DepartmentId },
                data: dept
            }); 
      };
       //data="[[dataprovider]]"
  
      // var array=[
      //             {emer:this.inputFirstNameValue=ko.observable(null),mbiemer:"bla",datelindje:"34",mosha:34},
      //             {emer:"fiori",mbiemer:"bla",datelindje:"34",mosha:34}
      //           ];


      

      // this.dataprovider=ko.observable( new ArrayDataProvider([

      //   {emer:"bushi",mbiemer:"bla",datelindje:"34",mosha:34},
      //   {emer:"fiori",mbiemer:"bla",datelindje:"34",mosha:34}

      // ], {
      //     keyAttributes: "value",
      // }));

    };



    // CustomerViewModel.prototype._initVariables= function (){
    //  // this.inputBirthdayMinValue=
    //  // this.inputBirthdayMaxValue=
    // }
      
  //   CustomerViewModel.prototype._onSaveButtonClick=function (){
  //     this.dataprovider=ko.observable( new ArrayDataProvider([

  //       {emer:"bushi",mbiemer:"bla",datelindje:"34",mosha:34},
  //       {emer:"fiori",mbiemer:"bla",datelindje:"34",mosha:34}

  //     ], {
  //         keyAttributes: "value",
  //     }));
  //     alert("vfhbvgfkbvg")
     
  //  };

    CustomerViewModel.prototype._initAllIds=function (){
       this.inputFirstNameId=CoreUtils.generateUniqueId();
       this.inputLastNameId=CoreUtils.generateUniqueId();      
    };

    CustomerViewModel.prototype._initAllLabels=function (){
      this.inputFirstNameLabel="First Name";
      this.inputLastNameLabel="Last Name";
      this.inputAgeLabel="Age";
      this.inputBirthPlaceLabel="Birth Place";
      this.inputBirthDateLabel="BirthDay";
      this.inputGenderLabel="Gender";
    }


    return CustomerViewModel;

  }
);
