@AbapCatalog.sqlViewName: 'ZVVBAP_MAKT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo for VBAP with MAKT'
define view ZS4H_VBAP_MAKT 
    with parameters
    i_langu : syst_langu @<Environment.systemField: #SYSTEM_LANGUAGE
// as select from ZS4H_VBAP_LIPS as v
as select from ZS4H_VBAP_LIPS2 as v
association [1] to makt as _mt
    on  v.matnr = _mt.matnr {
    key v.vbeln,
    key v.posnr,
    v.matnr, 
    _mt[1:spras = $parameters.i_langu].maktx as maktx,
    v.kunnr, 
    v.vkorg,
    @Semantics.quantity.unitOfMeasure: 'MEINS' v.kwmeng,
    @Semantics.unitOfMeasure: true v.meins,
    @Semantics.quantity.unitOfMeasure: 'MEINS' v.lfimg
}
