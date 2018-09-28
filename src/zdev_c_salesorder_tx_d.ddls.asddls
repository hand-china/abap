@AbapCatalog.sqlViewName: 'ZDEV_C_SOH_TXD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Apps with Draft table'
@Search.searchable: true

@Metadata.allowExtensions: true

@ObjectModel: {

    -- Annotations for transactional processing
    semanticKey: 'SalesOrder',
    compositionRoot: true,
    transactionalProcessingDelegated: true,
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true,

    -- Additional annotation for draft enablement
    draftEnabled: true
}
@OData.publish: true
define view ZDEV_C_SALESORDER_TX_D as   select from ZDEV_SALESORDER_TX_D as SalesOrder

{
      -- UUID-based key required
  key SalesOrder.SalesOrderUUID,

      @Search.defaultSearchElement: true
      SalesOrder.SalesOrder,


      SalesOrder.BusinessPartner,

      @Search.defaultSearchElement: true
      SalesOrder.OverallStatus,

      /* Exposing associations */
      SalesOrder._BusinessPartner,

      SalesOrder._OverallStatus

}
