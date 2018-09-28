@AbapCatalog.sqlViewName: 'ZDEV_SO_TXC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales order for transactional apps'
@ObjectModel.semanticKey: 'SalesOrder'

// BOPF替代
@ObjectModel.transactionalProcessingDelegated: true

@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.updateEnabled: true
// Header
@UI.headerInfo: { typeName: 'Sales Order', typeNamePlural: 'Sales Orders' }
// Odata pbulish
@OData.publish: true
define view ZDEV_C_SALESORDER_TX as select from ZDEV_SALESORDER_TX as Document
{

      @UI.lineItem.position: 10
      @UI.identification.position: 10
    @UI.lineItem: 
    [
      { type: #FOR_ACTION, position: 1, dataAction: 'BOPF:SET_TO_PAID', label: 'Set to Paid' }
    ]           
    key Document.SalesOrder,

      @UI.lineItem.position: 20

      @UI.identification.position: 20
      Document.BusinessPartner,

      Document.CurrencyCode,

      @UI.lineItem.position: 50

      @UI.identification.position: 50
      Document.GrossAmount,

      @UI.lineItem.position: 60

      @UI.identification.position: 60
      Document.NetAmount,

      @UI.lineItem.position: 30
      @UI.selectionField.position: 30
      @UI.identification.position: 30
      Document.BillingStatus,

      @UI.lineItem.position: 40
      @UI.selectionField.position: 40
      @UI.identification.position: 40
      Document.OverallStatus,

      /* Exposing value via associations */
      @UI.lineItem:  { value: '.CompanyName', position: 15 }
      Document._BusinessPartner,

      Document._Currency,
      Document._BillingStatus,
      Document._OverallStatus

}
