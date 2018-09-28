@AbapCatalog.sqlViewName: 'ZS4H_SO_L'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order List'
@OData: {
    publish: true
}
@UI.headerInfo: {
    typeNamePlural: 'Sales Order',
    typeName: 'Sales Order',
    title: {
      label: 'Sales Order',
      value: 'SalesOrder' -- Reference to element in element list
    },
    description: {
      label: 'Customer',
      value: 'CompanyName'    -- Reference to element in element list
    }
}
@Search: {
    searchable: true
}
define view ZS4H_SALESORDER_LIST
  as select from sepm_cds_sales_order as so
  association [0..1] to sepm_cds_business_partner as _BusinessPartner on $projection.buyer_guid = _BusinessPartner.business_partner_key
{

      @UI.lineItem: [ {
      position: 20,
      label:'Business Partner',
      type: #WITH_NAVIGATION_PATH,
      targetElement: '_BusinessPartner'   -- Reference to association
      } ]

  key so.sales_order_id        as SalesOrder,

      so.buyer_guid,
      @Search: {
          defaultSearchElement: true
      }
      @UI.selectionField: [{
          position: 10
      }]
      @UI.lineItem:[{position: 20}]
      @UI.masked: true
      so.customer.company_name as CompanyName,

      @UI.lineItem:[{position: 30}]
      @UI.identification: [ { position: 40 } ]
      so.currency_code         as CurrencyCode,

      @UI.lineItem:[{position: 50}]
      @UI.hidden: true
      so.gross_amount          as GrossAmount,
      so.customer.web_address  as WebsiteUrl,
      _BusinessPartner

}
