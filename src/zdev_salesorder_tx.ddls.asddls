@AbapCatalog.sqlViewName: 'ZDEV_SO_TX'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales order for transactional apps'

// Search 
@ObjectModel.semanticKey: 'SalesOrder'
 
//          
@ObjectModel.modelCategory: #BUSINESS_OBJECT 
@ObjectModel.compositionRoot: true  
@ObjectModel.transactionalProcessingEnabled: true  
@ObjectModel.writeActivePersistence: 'ZDEV_SOT'
                
@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true 
@ObjectModel.updateEnabled: true
define view ZDEV_SALESORDER_TX as select from zdev_sot as SalesOrder  -- the sales order table is the data source for this view
                
    association [0..1] to SEPM_I_BusinessPartner            as _BusinessPartner on $projection.BusinessPartner = _BusinessPartner.BusinessPartner
                
    association [0..1] to SEPM_I_Currency                   as _Currency        on $projection.CurrencyCode     = _Currency.Currency
                
    association [0..1] to SEPM_I_SalesOrderBillingStatus    as _BillingStatus   on $projection.BillingStatus    = _BillingStatus.SalesOrderBillingStatus
                
    association [0..1] to Sepm_I_SalesOrdOverallStatus      as _OverallStatus   on $projection.OverallStatus    = _OverallStatus.SalesOrderOverallStatus    
                
{        
    key SalesOrder.salesorder           as SalesOrder, 
                
    @ObjectModel.foreignKey.association: '_BusinessPartner'
    SalesOrder.businesspartner          as BusinessPartner,       
                
    @ObjectModel.foreignKey.association: '_Currency'  
    @Semantics.currencyCode: true
    SalesOrder.currencycode             as CurrencyCode, 
                
    @Semantics.amount.currencyCode: 'CurrencyCode'
                
    SalesOrder.grossamount              as GrossAmount, 
                
    @Semantics.amount.currencyCode: 'CurrencyCode'
    SalesOrder.netamount                as NetAmount, 
                
    @ObjectModel.foreignKey.association: '_BillingStatus'
    SalesOrder.billingstatus            as BillingStatus, 
                
    @ObjectModel.foreignKey.association: '_OverallStatus'
    SalesOrder.overallstatus            as OverallStatus,
                
                
    /* Associations */ 
    _BusinessPartner,
    _Currency,
    _BillingStatus, 
    _OverallStatus     
}
