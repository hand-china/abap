@AbapCatalog.sqlViewName: 'ZS4H_UNIT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Unit of Measure Text'
@ObjectModel.dataCategory: #TEXT
define view ZS4H_UnitOfMeasureText as select from t006a        as TextProvider
  {
    key TextProvider.msehi          as UnitOfMeasure,
    @Semantics.language: true       -- identifies the language  
    key TextProvider.spras          as Language,
    @Semantics.text: true            -- identifies the first text field for names
    TextProvider.mseht              as UnitName,
    @Semantics.text: true            -- identifies the second text field
    TextProvider.msehl              as UnitLongName
  }
