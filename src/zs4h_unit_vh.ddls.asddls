@AbapCatalog.sqlViewName: 'ZS4H_UNIT_V'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Unit Value Help'
define view ZS4H_UNIT_VH as select from t006     as ValueProvider 
    association [0..*] to ZS4H_UNITText as _Text
        on $projection.UnitOfMeasure = _Text.UnitOfMeasure
  {
    @ObjectModel.text.association: '_Text'
    @Search.defaultSearchElement: true
    key msehi   as UnitOfMeasure,
    -- association 
    _Text
  }
