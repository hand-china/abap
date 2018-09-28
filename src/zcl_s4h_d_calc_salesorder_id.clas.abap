class zcl_s4h_d_calc_salesorder_id definition
  public
  inheriting from /bobf/cl_lib_d_supercl_simple
  final
  create public .

  public section.

    methods /bobf/if_frw_determination~execute
        redefinition .
  protected section.
  private section.
endclass.



class zcl_s4h_d_calc_salesorder_id implementation.


  method /bobf/if_frw_determination~execute.
    "Find the highest used sales order number in both active and draft data

    with +both as ( select salesorder from zs4h_soh   "active data
        union all
        select salesorder from zs4h_soh_d )          "draft data
    select single
        from +both
        fields max( salesorder ) as salesorder
        into @data(lv_max_salesorder).

    "If there are no entries, set a start value
    if lv_max_salesorder is initial.
      lv_max_salesorder = '0700000000'.
    endif.

    "Read data with the given keys
    data lt_data type zts4h_salesorder_tp_d.

    io_read->retrieve(
        exporting
            iv_node                 = is_ctx-node_key   " uuid of node name
            it_key                  = it_key            " keys given to the determination
        importing
            eo_message              = eo_message        " pass message object
            et_data                 = lt_data           " itab with node data
            et_failed_key           = et_failed_key     " pass failures
    ).


    "Assign numbers to each newly created line and tell BOPF about the modification
    loop at lt_data reference into data(lr_data).
      if lr_data->salesorder is initial.
        add 1 to lv_max_salesorder.
        lr_data->salesorder = lv_max_salesorder.

        call function 'CONVERSION_EXIT_ALPHA_INPUT'
          exporting
            input  = lr_data->salesorder
          importing
            output = lr_data->salesorder.

        io_modify->update(
          exporting
            iv_node           = is_ctx-node_key    " uuid of node
            iv_key            = lr_data->key    " key of line
            is_data           = lr_data            " ref to modified data
            it_changed_fields = value #( ( zif_s4h_salesorder_tp_d_c=>sc_node_attribute-zs4h_salesorder_tp_d-salesorder ) )
        ).
      endif.
    endloop.
  endmethod.
endclass.
