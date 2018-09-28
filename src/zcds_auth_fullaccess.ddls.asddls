@AbapCatalog.sqlViewName: 'ZFULLACCESS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'demo'
define view zcds_auth_fullaccess as select from
    scarr
    {
      key carrid,
          carrname,
          currcode,
          url
    };  
