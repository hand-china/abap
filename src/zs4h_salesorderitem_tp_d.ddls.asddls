@AbapCatalog.sqlViewName: 'ZS4H_I_SOI_V'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Sales Order Items - subnode BO view'

@Search.searchable:       true

@ObjectModel: {

    semanticKey:  [ 'SalesOrder', 'SalesOrderItem' ],
    writeActivePersistence: 'ZS4H_SOHI',
//    transactionalProcessingEnabled: true,
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true,

    writeDraftPersistence: 'ZS4H_SOHID'      -- Draft persistence
}
define view ZS4H_SalesOrderItem_TP_D
  as select from zs4h_sohi as SalesOrderItem

  /* Compositional associations    */
  association [1..1] to ZS4H_SalesOrder_TP_D as SalesOrder on $projection.SalesOrderUUID = SalesOrder.SalesOrderUUID

  /* Cross BO associations         */
  association [0..1] to SEPM_I_Product_E     as _Product    on $projection.Product = _Product.Product

  /* Associations for value help   */
  association [0..1] to SEPM_I_Currency      as _Currency   on $projection.CurrencyCode = _Currency.Currency
{

      @ObjectModel.readOnly: true
  key SalesOrderItem.salesorderitemuuid                       as SalesOrderItemUUID,

      @ObjectModel.readOnly: true
      SalesOrderItem.salesorderuuid                           as SalesOrderUUID,

      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      SalesOrderItem.salesorderitem                           as SalesOrderItem,

      @ObjectModel.foreignKey.association: '_Product'
      @ObjectModel.mandatory: true
      SalesOrderItem.product                                  as Product,

      @ObjectModel.foreignKey.association: '_Currency'
      @Semantics.currencyCode: true
      SalesOrderItem.currencycode                             as CurrencyCode,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      SalesOrderItem.grossamount                              as GrossAmount,

      SalesOrderItem.quantity                                 as Quantity,
      
      SalesOrderItem.unit as QuantityUnit,

      /*  Exposed associations  */
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      SalesOrder ,

      _Product,

      _Currency
}
