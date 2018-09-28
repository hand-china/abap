@AbapCatalog.sqlViewName: 'ZS4H_SOI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'List report for sales order items'
@OData.publish: true
define view ZS4H_SALES_ORDER_ITEM as select from SEPM_I_SalesOrderItem_E as Item  {
key Item.SalesOrder                          as SalesOrderID, 
    key Item.SalesOrderItem                      as ItemPosition, 
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
