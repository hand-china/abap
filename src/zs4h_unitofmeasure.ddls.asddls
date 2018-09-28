@AbapCatalog.sqlViewName: 'ZS4H_C_UNIT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Unit of Measure'
@OData: {
    publish: true
}
define view ZS4H_UnitOfMeasure as select from t006 as UnitOfMeasure
    association [0..*] to I_UnitOfMeasureText as _Text 
        on $projection.UnitOfMeasure = _Text.UnitOfMeasure
  {
    @ObjectModel.text.association: '_Text'
    key UnitOfMeasure.msehi as UnitOfMeasure,
    _Text
  }
