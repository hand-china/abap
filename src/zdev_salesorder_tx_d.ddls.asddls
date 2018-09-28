@AbapCatalog.sqlViewName: 'ZDEV_SO_TX_D'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Apps with Draft table'
@Search.searchable: true

@ObjectModel: {
    -- Annotations for transactional processing
    semanticKey: 'SalesOrder',
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true,
    writeActivePersistence: 'ZDEV_SOH',

    -- Additional annotations for draft enablement
    draftEnabled: true,
    writeDraftPersistence: 'ZDEV_SOH_D'
}
define view ZDEV_SALESORDER_TX_D
  as select from zdev_soh as SalesOrder -- the sales order table is the data source for this view

  /* Cross BO associations       */
  association [0..1] to SEPM_I_BusinessPartner       as _BusinessPartner on $projection.BusinessPartner = _BusinessPartner.BusinessPartner
  /* Associations for value help */
  association [0..1] to Sepm_I_SalesOrdOverallStatus as _OverallStatus   on $projection.OverallStatus = _OverallStatus.SalesOrderOverallStatus

{
      -- UUID-based key is required to enable draft capabilities
  key SalesOrder.salesorderuuid           as SalesOrderUUID,

      @Search.defaultSearchElement: true
      SalesOrder.salesorder               as SalesOrder,

      SalesOrder.businesspartner          as BusinessPartner,

      @Search.defaultSearchElement: true
      @ObjectModel.foreignKey.association: '_OverallStatus'
      SalesOrder.overallstatus            as OverallStatus,

      /* Associations */
      /* Exposed associations */
      _BusinessPartner,
      _OverallStatus

}
