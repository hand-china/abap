class ZCL_S4H_INV_A_SET_TO_PAID definition
  public
  inheriting from /BOBF/CL_LIB_A_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_ACTION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_S4H_INV_A_SET_TO_PAID IMPLEMENTATION.


  method /BOBF/IF_FRW_ACTION~EXECUTE.
  " The invoice's data is typed with BO node's combined table type
    data lt_invoice_data type zts4h_invoice_tp.

    " READING BO data ----------------------------------------------

    " Retrieve the data of the requested node instance
    io_read->retrieve(
      EXPORTING
        iv_node         = is_ctx-node_key
        it_key          = it_key
      IMPORTING
        et_data         = lt_invoice_data ).

    " WRITING BO data ---------------------------------------------

    LOOP AT lt_invoice_data ASSIGNING FIELD-SYMBOL(<s_invoice>).

    " Set the attribue paid to new value
    <s_invoice>-paid = abap_true.  " PAID


    " Update the changed data (payment status) of the relevant node instance
    io_modify->update(
        iv_node               = is_ctx-node_key
        iv_key                = <s_invoice>-key
        iv_root_key           = <s_invoice>-root_key
        is_data               = REF #( <s_invoice>-node_data )
        it_changed_fields     = VALUE #(
          ( zif_s4h_invoice_tp_c=>sc_node_attribute-zs4h_invoice_tp-paid )
        )
      ).
    ENDLOOP.
  endmethod.
ENDCLASS.
