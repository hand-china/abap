@AbapCatalog.sqlViewName: 'ZS4H_PU'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Text and fuzzy search'
@Search.searchable : true 
@OData.publish: true
define view ZS4H_C_Puducts as select from snwd_pd as Product 
    left outer join snwd_texts as ProductDescription 
        on Product.desc_guid = ProductDescription.node_key 
  {
     @Search.defaultSearchElement : true    
    @Search.fuzzinessThreshold : 0.8        
    @Search.ranking : #HIGH  
    @ObjectModel.text.element: ['Category']   
    key Product.product_id as ID,
    
    @Search.defaultSearchElement : false 
    ProductDescription.language as Language,
    
    @Search.defaultSearchElement : true    
    @Search.fuzzinessThreshold : 0.8        
    @Search.ranking : #HIGH                 
    ProductDescription.text as Name,
    
    @Search.defaultSearchElement : true    
    @Search.fuzzinessThreshold : 0.7          
    @Search.ranking : #LOW             
    Product.category as Category
  }
