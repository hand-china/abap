@AbapCatalog.sqlViewName: 'ZS4H_INV_T'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoice for Dynamic Fields'
@ObjectModel: {

    -- Annotations for transactional processing
---    semanticKey: ['Invoice'],
    compositionRoot: true,  
    transactionalProcessingEnabled: true, 
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true,
    writeActivePersistence: 'ZS4H_INV' 
}
define view ZS4H_INVOICE_TP as 
 select from zs4h_inv as Invoice
{    
    key Invoice.invoiceid   as Invoiceid,           
    
    @ObjectModel.readOnly: false              -- for a static field
    Invoice.paid            as Paid,                
    
    @ObjectModel.readOnly: 'EXTERNAL_CALCULATION' -- for a dynamic field
    Invoice.comments        as Comments            
    
}

