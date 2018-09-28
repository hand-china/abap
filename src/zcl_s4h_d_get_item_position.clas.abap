class zcl_s4h_d_get_item_position definition
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



class zcl_s4h_d_get_item_position implementation.


  method /bobf/if_frw_determination~execute.
    " Find the highest used item number in both active and draft data (draft table)
    select single
        from zs4h_sohid
        fields max( salesorderitem ) as salesorderitem
    into @data(lv_max_salesorderitem).

    " If there are no entries, set a start value
    if lv_max_salesorderitem is initial.
      lv_max_salesorderitem = '0000000000'.
    endif.

    "Read data with the given keys (typed with combined type table)
    data lt_data type zts4h_salesorderitem_tp_d.

    io_read->retrieve(
      exporting
        iv_node                 = is_ctx-node_key   " uuid of node name
        it_key                  = it_key            " keys given to the determination
      importing
        eo_message              = eo_message        " pass message object
        et_data                 = lt_data           " itab with node data
        et_failed_key           = et_failed_key     " pass failures
    ).


    " Assign numbers to each newly created item and trigger the modification in BOPF
    loop at lt_data reference into data(lr_data).
      if lr_data->salesorderitem is initial.
        add 10 to lv_max_salesorderitem.
        lr_data->salesorderitem = lv_max_salesorderitem.

        io_modify->update(
          exporting
            iv_node           = is_ctx-node_key    " uuid of node
            iv_key            = lr_data->key   " key of line
            is_data           = lr_data            " ref to modified data
            it_changed_fields = value #( ( zif_s4h_salesorder_tp_d_c=>sc_node_attribute-zs4h_salesorderitem_tp_d-salesorderitem ) )
        ).
      endif.
    endloop.

  endmethod.
endclass.
