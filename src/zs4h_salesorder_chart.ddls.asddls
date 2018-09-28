@AbapCatalog.sqlViewName: 'ZS4H_SO_CT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Chart for Sales Order'
@UI.chart: {
    title: 'Gross Amount by Customer',
    description: 'Line-chart displaying the gross amount by customer',
    chartType: #LINE,
    dimensions: [ 'CompanyName' ],  -- Reference to one element
    measures: [ 'GrossAmount' ]     -- Reference to one or more elements
}
@OData: {
    publish: true
}
define view ZS4H_SALESORDER_CHART as select from sepm_cds_sales_order as so {
  key so.sales_order_id as SalesOrder,
  
  so.customer.company_name as CompanyName,
  
  so.currency_code as CurrencyCode, 
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  so.gross_amount as GrossAmount
}
