@AbapCatalog.sqlViewName: 'ZVVBAP_LIPS2'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo for VBAP & LIPS with Asso'
define view ZS4H_VBAP_LIPS2
  as select from    vbap as v
    left outer join lips as l on  v.vbeln = l.vgbel
                              and v.posnr = l.vgpos
  association [1] to vbak as _vk on v.vbeln = _vk.vbeln
{
  key v.vbeln,
  key v.posnr,
  v.matnr, // Make association public
  _vk.vkorg,
  _vk.kunnr,
    @Semantics.quantity.unitOfMeasure: 'MEINS' v.kwmeng,
    @Semantics.unitOfMeasure: true v.meins,
    @Semantics.quantity.unitOfMeasure: 'MEINS' sum( l.lfimg ) as lfimg
}
group by
  v.vbeln,
  v.posnr,
  v.matnr, // Make association public
  _vk.vkorg,
  _vk.kunnr,
  v.kwmeng,
  v.meins
