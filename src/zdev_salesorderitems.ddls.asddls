@AbapCatalog.sqlViewName: 'ZDEV_SO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo for List Report'
// CDS publish Odata
@OData.publish: true

define view ZDEV_SALESORDERITEMS
  as select from SEPM_I_SalesOrderItem_E as Item
{
  key Item.SalesOrder                             as SalesOrderID,
  key Item.SalesOrderItem                         as ItemPosition,
      Item._SalesOrder._Customer.CompanyName      as CompanyName,
      Item.Product                                as Product,
      @Semantics.currencyCode: true
      Item.TransactionCurrency                    as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Item.GrossAmountInTransacCurrency           as GrossAmount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Item.NetAmountInTransactionCurrency         as NetAmount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Item.TaxAmountInTransactionCurrency         as TaxAmount,
      Item.ProductAvailabilityStatus              as ProductAvailabilityStatus
}
