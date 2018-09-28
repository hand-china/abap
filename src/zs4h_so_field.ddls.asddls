@AbapCatalog.sqlViewName: 'ZS4H_SO_F'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order for Field and Action Contral'

@ObjectModel.semanticKey: 'SalesOrder'
                
@ObjectModel.modelCategory: #BUSINESS_OBJECT 
@ObjectModel.compositionRoot: true  
@ObjectModel.transactionalProcessingEnabled: true  
@ObjectModel.writeActivePersistence: 'ZS4H_SO'
                
@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: false 
@ObjectModel.updateEnabled: true
define view ZS4H_SO_FIELD as select from
 zs4h_so as SalesOrder  -- the sales order table is the data source for this view
                
    association [0..1] to SEPM_I_BusinessPartner            as _BusinessPartner on $projection.BusinessPartner = _BusinessPartner.BusinessPartner
                
    association [0..1] to SEPM_I_Currency                   as _Currency        on $projection.CurrencyCode     = _Currency.Currency
                
    association [0..1] to SEPM_I_SalesOrderBillingStatus    as _BillingStatus   on $projection.BillingStatus    = _BillingStatus.SalesOrderBillingStatus
                
    association [0..1] to Sepm_I_SalesOrdOverallStatus      as _OverallStatus   on $projection.OverallStatus    = _OverallStatus.SalesOrderOverallStatus    
                
{       @ObjectModel.mandatory: true
    key SalesOrder.salesorder           as SalesOrder, 
                
    @ObjectModel.foreignKey.association: '_BusinessPartner'
    @ObjectModel.readOnly: true 
    SalesOrder.businesspartner          as BusinessPartner,       
                
    @ObjectModel.foreignKey.association: '_Currency'  
    @Semantics.currencyCode: false
    SalesOrder.currencycode             as CurrencyCode, 
                
    @Semantics.amount.currencyCode: 'CurrencyCode'
    @ObjectModel.readOnly: false            
    SalesOrder.grossamount              as GrossAmount, 
                
    @Semantics.amount.currencyCode: 'CurrencyCode'
    @ObjectModel.readOnly: false
    SalesOrder.netamount                as NetAmount, 
                
    @ObjectModel.foreignKey.association: '_BillingStatus'
    @ObjectModel.readOnly: true 
    SalesOrder.billingstatus            as BillingStatus, 
                
    @ObjectModel.foreignKey.association: '_OverallStatus'
    SalesOrder.overallstatus            as OverallStatus,
                
                
    /* Associations */ 
    _BusinessPartner,
    _Currency,
    _BillingStatus, 
    _OverallStatus     
}
