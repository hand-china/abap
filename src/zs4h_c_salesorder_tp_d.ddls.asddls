@AbapCatalog.sqlViewName: 'ZS4H_C_SOH_V'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Sales Order Header - Consumption View'

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
define view ZS4H_C_SALESORDER_TP_D
  as select from ZS4H_SalesOrder_TP_D as SalesOrder
  /* Composition and cross BO associations  */
        association [0..*] to ZS4H_C_SalesOrderItem_TP_D as _Item on _Item.SalesOrderUUID = SalesOrder.SalesOrderUUID
  

{
      -- UUID-based key required
  key SalesOrder.SalesOrderUUID,

      @Search.defaultSearchElement: true
      SalesOrder.SalesOrder,


      SalesOrder.BusinessPartner,

      @Search.defaultSearchElement: true
      SalesOrder.OverallStatus,

      /* Exposing associations */
      SalesOrder._BusinessPartnerValueHelp,

      SalesOrder._OverallStatus,
      /* Exposing value via associations */ 
      @ObjectModel.association.type:  [ #TO_COMPOSITION_CHILD ]
    _Item
}
