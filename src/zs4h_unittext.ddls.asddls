@AbapCatalog.sqlViewName: 'ZS4H_UNIT_T'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'UnitOfMeasure'             
@Search.searchable: true
define view ZS4H_UNITText as select from t006a       as TextProvider
  {
    key TextProvider.msehi          as UnitOfMeasure,
    @Semantics.language: true       -- identifies the language  
    key TextProvider.spras          as Language,
    @Semantics.text: true            -- identifies the text field
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8    
    TextProvider.mseht              as Name
  }
