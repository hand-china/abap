class zcl_calculation_discount definition
  public
  final
  create public .

  public section.
    interfaces:
      if_sadl_exit_calc_element_read.
  protected section.
  private section.
endclass.



class zcl_calculation_discount implementation.
  method if_sadl_exit_calc_element_read~get_calculation_info.
    if iv_entity <> 'ZDEMO_C_SORDERITEM_VF'.
      "raise exception type zcx_calc_exit exporting textid = zcx_calc_exit=>entity_not_known.
    endif.
    if line_exists( it_requested_calc_elements[ table_line = 'GROSSAMOUNTWITHDISCOUNT' ] ).
      append 'CONVERTEDGROSSAMOUNT' to et_requested_orig_elements.
    endif.
  endmethod.


  method if_sadl_exit_calc_element_read~calculate.

    check not it_original_data is initial.

    data lt_calculated_data type standard table of zs4h_c_sorderitem_vf with default key.
    move-corresponding it_original_data to lt_calculated_data.

    loop at lt_calculated_data assigning field-symbol(<ls_calculated_data>).
      <ls_calculated_data>-grossamountwithdiscount =
      cond #( when <ls_calculated_data>-convertedgrossamount > '1000'
      then 1000 + ( <ls_calculated_data>-convertedgrossamount - 1000 ) * '0.9'
          else <ls_calculated_data>-convertedgrossamount ).
    endloop.
    move-corresponding lt_calculated_data to ct_calculated_data.

  endmethod.

endclass.
