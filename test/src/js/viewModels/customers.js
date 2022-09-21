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
        "ojs/ojinputtext",
        "ojs/ojformlayout",
        "ojs/ojinputnumber",
        "ojs/ojdatetimepicker"
      ],


 function(
    ko,
    CoreUtils
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
      this.inputBirthPlaceValue=ko.observable(null);
    };

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
    }


    return CustomerViewModel;



  }
);
