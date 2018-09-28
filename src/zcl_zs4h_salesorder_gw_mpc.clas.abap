class ZCL_ZS4H_SALESORDER_GW_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
    begin of TS_SEPM_I_BUSINESSPARTNERTYPE.
      include type SEPM_IBUPA.
      include type INCL_TRF_SNWD_BPA.
  types:
    end of TS_SEPM_I_BUSINESSPARTNERTYPE .
  types:
   TT_SEPM_I_BUSINESSPARTNERTYPE type standard table of TS_SEPM_I_BUSINESSPARTNERTYPE .
  types:
    begin of TS_SEPM_I_SALESORDERTYPE.
      include type SEPM_ISO.
      include type SNWD_SO_INCL_EEW_TR.
  types:
      generated_id type string,
    end of TS_SEPM_I_SALESORDERTYPE .
  types:
   TT_SEPM_I_SALESORDERTYPE type standard table of TS_SEPM_I_SALESORDERTYPE .
  types:
    begin of TS_SEPM_I_SALESORDERITEMTYPE.
      include type SEPM_ISOI.
      include type SNWD_SOI_INCL_EEW_TR.
  types:
      generated_id type string,
    end of TS_SEPM_I_SALESORDERITEMTYPE .
  types:
   TT_SEPM_I_SALESORDERITEMTYPE type standard table of TS_SEPM_I_SALESORDERITEMTYPE .

  constants GC_SEPM_I_BUSINESSPARTNERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_BusinessPartnerType' ##NO_TEXT.
  constants GC_SEPM_I_SALESORDERITEMTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_SalesOrderItemType' ##NO_TEXT.
  constants GC_SEPM_I_SALESORDERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_SalesOrderType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZS4H_SALESORDER_GW_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZS4H_SALESORDER_GW_SRV' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20180829171502'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20180829091505'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20180829091519'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_BUSINESSPARTNER" binding="SEPM_I_BUSINESSPARTNER" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_SALESORDER" binding="SEPM_I_SALESORDER" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_SALESORDERITEM" binding="SEPM_I_SALESORDERITEM" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="SEPM_I_BusinessPartner" dataSource="SEPM_I_BUSINESSPARTNER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_SalesOrder" dataSource="SEPM_I_SALESORDER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CUSTOMER" binding="_CUSTOMER" target="SEPM_I_BusinessPartner" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ITEM" binding="_ITEM" target="SEPM_I_SalesOrderItem" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_SalesOrderItem" dataSource="SEPM_I_SALESORDERITEM" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZS4H_SALESORDER_GW' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
