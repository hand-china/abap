@AbapCatalog.sqlViewName: 'ZS4H_SOH_V'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Sales order for transactional app'

@Search.searchable: true

@ObjectModel: {
    -- Annotations for transactional processing
    semanticKey: 'SalesOrder',
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true,
    writeActivePersistence: 'ZS4H_SOH',

    -- Additional annotations for draft enablement
    draftEnabled: true,
    writeDraftPersistence: 'ZS4H_SOH_D'
}
define view ZS4H_SalesOrder_TP_D
  as select from zs4h_soh as SalesOrder -- the sales order table is the data source for this view

  /* Cross BO associations       */
  association [0..1] to ZS4H_BP_ValueHelp as _BusinessPartnerValueHelp
        on $projection.BusinessPartner = _BusinessPartnerValueHelp.BusinessPartner
  /* Associations for value help */
  association [0..1] to Sepm_I_SalesOrdOverallStatus as _OverallStatus   on $projection.OverallStatus = _OverallStatus.SalesOrderOverallStatus

  association [0..*] to ZS4H_SalesOrderItem_TP_D     as _Item            on $projection.SalesOrderUUID = _Item.SalesOrderUUID

{
      -- UUID-based key is required to enable draft capabilities
      @ObjectModel.readOnly: true
  key SalesOrder.salesorderuuid           as SalesOrderUUID,

      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      SalesOrder.salesorder               as SalesOrder,

      @Consumption.valueHelp: '_BusinessPartnerValueHelp'
      SalesOrder.businesspartner          as BusinessPartner,

      @Search.defaultSearchElement: true
      @ObjectModel.foreignKey.association: '_OverallStatus'
      SalesOrder.overallstatus            as OverallStatus,

      /* Associations */
      /* Exposed associations */
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Item,
      _BusinessPartnerValueHelp,
      _OverallStatus

}
