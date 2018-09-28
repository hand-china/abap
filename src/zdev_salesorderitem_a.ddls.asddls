@AbapCatalog.sqlViewName: 'ZDEV_SO_AD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Search and Filter for Sales Order items'
// 抬头信息
@UI.headerInfo: { typeName: 'Sales Order Item', typeNamePlural: 'Sales Order Items' }
// 搜索
@Search.searchable: true
// Odata 服务
@OData.publish: true
define view ZDEV_SALESORDERITEM_A as select from SEPM_I_SalesOrderItem_E as Item 
    {

        @UI.lineItem: { label: 'Sales Order', position: 10, importance: #HIGH }
        @UI.selectionField.position: 10
        @UI.identification: { label: 'Sales Order', position: 10, importance: #HIGH }
        
    key Item.SalesOrder                         as SalesOrderID, 
    
        @UI.hidden: true
    key Item.SalesOrderItem                     as ItemPosition, 
    
        @UI.lineItem.position: 20
        @UI.selectionField.position: 20
        @Search: { defaultSearchElement: true, fuzzinessThreshold: 0.7 }
        @UI.identification: { label: 'Company Name', position: 20, importance: #HIGH }
        Item._SalesOrder._Customer.CompanyName  as CompanyName,
        
        @UI.lineItem.position: 30
        @Search:{defaultSearchElement: true,fuzzinessThreshold: 0.8 }
        @UI.identification.position: 30
        Item.Product                            as Product, 
        
        @Semantics.currencyCode: true
        Item.TransactionCurrency                as CurrencyCode,
         
        @UI.lineItem: { position: 40, importance: #HIGH } 
        @Semantics.amount.currencyCode: 'CurrencyCode'
        @UI.identification: { position: 40, importance: #HIGH } 
        @DefaultAggregation: #SUM
        Item.GrossAmountInTransacCurrency       as GrossAmount, 
        
        
        @UI.lineItem.position: 50      
        @Semantics.amount.currencyCode: 'CurrencyCode'
        @UI.identification.position: 50       
        @DefaultAggregation: #SUM
        Item.NetAmountInTransactionCurrency     as NetAmount, 

        @UI.lineItem.position: 60      
        @Semantics.amount.currencyCode: 'CurrencyCode'
        @UI.identification.position: 60          
        @DefaultAggregation: #SUM
        Item.TaxAmountInTransactionCurrency     as TaxAmount,
        
        Item.ProductAvailabilityStatus          as ProductAvailabilityStatus,
        
        @Semantics.currencyCode: true
        cast( 'EUR' as abap.cuky ) as TargetCurrency,

        @UI.lineItem:{ label: 'Gross Amount in EUR', position: 45 }
        @DefaultAggregation: #SUM
        
        @Semantics.amount.currencyCode: 'TargetCurrency'
        
        CURRENCY_CONVERSION(
            amount             => Item.GrossAmountInTransacCurrency,
            source_currency    => Item.TransactionCurrency,
            target_currency    => cast( 'EUR' as abap.cuky ),
            exchange_rate_date => cast( '20160101' as abap.dats ),
            error_handling     => 'SET_TO_NULL' )          as ConvertedGrossAmount 
        
    }                 
