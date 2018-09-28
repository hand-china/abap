class ZCL_D_S4H_INVOICE_TP_ACTION_AN definition
  public
  inheriting from /BOBF/CL_LIB_D_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_DETERMINATION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_D_S4H_INVOICE_TP_ACTION_AN IMPLEMENTATION.


  method /BOBF/IF_FRW_DETERMINATION~EXECUTE.
  " The invoice's data is typed with BO node's combined table type
    data lt_invoice_data type zts4h_invoice_tp.

    " (1) Retrieve the data of the invoice's node instance
    io_read->retrieve(
      EXPORTING
        iv_node  = is_ctx-node_key      " uuid of the node instance
        it_key   = it_key               " keys given to the determination
      IMPORTING
        et_data = lt_invoice_data ).    " itab with invoice’s node data


    " (2) Create a property helper object
    data(lo_property_helper) = new /bobf/cl_lib_h_set_property( io_modify = io_modify
                                                    is_context = is_ctx ).


    " (3 ) Set the attribute "comments" to read-only for all paid invoices
    loop at lt_invoice_data into data(ls_invoice_data)
                                where paid = abap_true.

     lo_property_helper->set_attribute_read_only(
          iv_attribute_name = zif_s4h_invoice_tp_c=>sc_node_attribute-zs4h_invoice_tp-comments
          iv_key            = ls_invoice_data-key ).

    endloop.

    " The invoice's data is typed with BO node's combined table type
    "data lt_invoice_data type ztdemo_i_invoice_tp.
    data lv_action_enabled type abap_bool.

    " (1) Retrieve the data of the invoice's node instance
    "io_read->retrieve(
    "  EXPORTING
    "    iv_node  = is_ctx-node_key
    "    it_key   = it_key
    "  IMPORTING
    "    et_data = lt_invoice_data ).


    " (2) Create a property helper object
    "data lo_property_helper type ref to /bobf/cl_lib_h_set_property.
    "create object lo_property_helper
    "  EXPORTING
    "    io_modify = io_modify
    "    is_context = is_ctx.

    "data(lo_property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify  = io_modify
    "                                                        is_context = is_ctx ).



    " (3) Action not enabled when invoice is set to PAID
    loop at lt_invoice_data ASSIGNING FIELD-SYMBOL(<s_invoice>).

      if <s_invoice>-paid = abap_true.
        lv_action_enabled = abap_false.
      else.
        lv_action_enabled = abap_true.
      endif.

      lo_property_helper->set_action_enabled(
            iv_action_key = zif_s4h_invoice_tp_c=>sc_action-zs4h_invoice_tp-set_to_paid
            iv_key        = <s_invoice>-key
            iv_value      = lv_action_enabled ).

   endloop.



  endmethod.
ENDCLASS.
