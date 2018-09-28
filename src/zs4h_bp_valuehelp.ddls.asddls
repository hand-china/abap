@AbapCatalog.sqlViewName: 'ZS4H_BP_VH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'BP Value Help'
@Search.searchable: true
define view ZS4H_BP_ValueHelp as select from SEPM_I_BusinessPartner_E {
    
    key BusinessPartner,    
    BusinessPartnerRole, 
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    CompanyName, 
    LegalForm, 
    EmailAddress
  }  
