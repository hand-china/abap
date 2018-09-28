@AbapCatalog.sqlViewName: 'ZS4H_C_SOI_VH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Value Help for Sales Order Item'
@OData: {
    publish: true
}
define view ZS4H_C_SORDERITEM_VH as select from ekpo as Item 
    association [0..1] to ZS4H_UNIT_VH as _QuantityUnitValueHelp
         on $projection.QuantityUnitCode = _QuantityUnitValueHelp.UnitOfMeasure
{
    key Item.ebeln, 
    key Item.ebelp, 
    Item.matnr,
    Item.ktmng,
    @Semantics.unitOfMeasure: true
    @ObjectModel.foreignKey.association: '_QuantityUnitValueHelp'
    Item.meins as QuantityUnitCode,
    _QuantityUnitValueHelp

}
