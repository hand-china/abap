@AbapCatalog.sqlViewName: 'ZS4H_C_SO_F'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order for Field and Action Contral '
@ObjectModel.semanticKey: 'SalesOrder'

@ObjectModel.transactionalProcessingDelegated: true

@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: false
@ObjectModel.updateEnabled: true

@UI.headerInfo: { typeName: 'Sales Order', typeNamePlural: 'Sales Orders' }

@OData.publish: true
define view ZS4H_C_SO_FIELD
  as select from ZS4H_SO_FIELD as Document
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
      @ObjectModel.readOnly: true
      Document.GrossAmount,

      @UI.lineItem.position: 60
      @UI.identification.position: 60
      @ObjectModel.readOnly: true
      Document.NetAmount,

      @UI.lineItem.position: 30
      @UI.selectionField.position: 30
      @UI.identification.position: 30
      @ObjectModel.readOnly: false
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
