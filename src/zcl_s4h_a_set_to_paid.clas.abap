class zcl_s4h_a_set_to_paid definition
  public
  inheriting from /bobf/cl_lib_a_supercl_simple
  final
  create public .

  public section.

    methods /bobf/if_frw_action~execute
        redefinition .
  protected section.
  private section.
endclass.



class zcl_s4h_a_set_to_paid implementation.


  method /bobf/if_frw_action~execute.
    " Typed with node's combined table type
    data(lt_sales_order) = value zts4h_salesorder_tx( ).

    " READING BO data ----------------------------------------------

    " Retrieve the data of the requested node instance
    io_read->retrieve(
      exporting
        iv_node         = is_ctx-node_key
        it_key          = it_key
      importing
        et_data         = lt_sales_order
    ).

    " WRITING BO data ---------------------------------------------

    loop at lt_sales_order assigning field-symbol(<s_sales_order>).

      " Set the attribue billing_status to new value
      <s_sales_order>-billingstatus = 'P'.  " PAID

      " Set the attribue overall_status to new value
      if
          <s_sales_order>-overallstatus = 'N' or <s_sales_order>-overallstatus = ' '.
        <s_sales_order>-overallstatus  = 'P'.  " PAID
      endif.

      " Update the changed data (billig_status) of the node instance
      io_modify->update(
        exporting
          iv_node               = is_ctx-node_key
          iv_key                = <s_sales_order>-key
          iv_root_key           = <s_sales_order>-root_key
          is_data               = ref #( <s_sales_order>-node_data )
          it_changed_fields     = value #(
            ( zif_s4h_salesorder_tx_c=>sc_node_attribute-zs4h_salesorder_tx-billingstatus )
            ( zif_s4h_salesorder_tx_c=>sc_node_attribute-zs4h_salesorder_tx-overallstatus )
          )
        ).
    endloop.
  endmethod.
endclass.
