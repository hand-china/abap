@AbapCatalog.sqlViewName: 'ZVVBAP_LIPS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo for VBAP & LIPS'
define view ZS4H_VBAP_LIPS
  as select
    key v.vbeln,
    key v.posnr,
    v.matnr,
    k.vkorg,
    k.kunnr,
    @Semantics.quantity.unitOfMeasure: 'MEINS' v.kwmeng,
    @Semantics.unitOfMeasure: true v.meins,
    @Semantics.quantity.unitOfMeasure: 'MEINS' sum( l.lfimg ) as lfimg
  from              vbap as v
    inner join      vbak as k on v.vbeln = k.vbeln
    left outer join lips as l on  v.vbeln = l.vgbel
                              and v.posnr = l.vgpos
  group by
    v.vbeln,
    v.posnr,
    v.matnr,
    k.vkorg,
    k.kunnr,
    v.kwmeng,
    v.meins
