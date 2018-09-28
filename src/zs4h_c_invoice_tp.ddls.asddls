@AbapCatalog.sqlViewName: 'ZS4H_C_INV_T'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoice for Dynamic Fields Consume'
@ObjectModel.transactionalProcessingDelegated: true

@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.updateEnabled: true

@UI.headerInfo: { typeName: 'Invoices', typeNamePlural: 'Invoices' }

@OData.publish: true
define view ZS4H_C_INVOICE_TP as 
 select from ZS4H_INVOICE_TP as Invoice {
      @UI.lineItem.position: 10
      @UI.identification.position: 10
          @UI.lineItem: 
    [
      { type: #FOR_ACTION, position: 1, dataAction: 'BOPF:SET_TO_PAID', label: 'Set to Paid' }
    ]
      key Invoice.Invoiceid, 
      @UI.lineItem.position: 20
      @UI.identification.position: 20
      Invoice.Paid, 
      @UI.lineItem.position: 30
      @UI.identification.position: 30
      @EndUserText: {
          label: 'Comments'
      }
      Invoice.Comments
    
}
