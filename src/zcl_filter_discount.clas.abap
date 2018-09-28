class zcl_filter_discount definition
  public
  final
  create public .

  public section.
  INTERFACES:
      if_sadl_exit_filter_transform.
  protected section.
  private section.
endclass.



class zcl_filter_discount implementation.
  METHOD if_sadl_exit_filter_transform~map_atom.
    IF iv_element <> 'GROSSAMOUNTWITHDISCOUNT'.
      "RAISE EXCEPTION TYPE zcx_filter_exit EXPORTING textid = zcx_filter_exit=>element_not_expected.
    ENDIF.

    DATA(lo_cfac) = cl_sadl_cond_prov_factory_pub=>create_basic_condition_factory( ).
    DATA(amount_le_1000) = lo_cfac->condition( name = 'CONVERTEDGROSSAMOUNT'  operator = 'LE'  low = '1000' ).
    DATA(amount_gt_1000) = lo_cfac->condition( name = 'CONVERTEDGROSSAMOUNT'  operator = 'GT'  low = '1000' ).
    DATA(lv_discountvalue) = 1000 + ( iv_value - 1000 ) / '0.9'.
    ro_condition = amount_le_1000->and( lo_cfac->condition( name = 'CONVERTEDGROSSAMOUNT'  operator =
                   CONV #( iv_operator )  low = iv_value ) )->or(
                   amount_gt_1000->and( lo_cfac->condition( name = 'CONVERTEDGROSSAMOUNT'  operator =
                   CONV #( iv_operator )  low = CONV #( lv_discountvalue ) ) ) ).
  ENDMETHOD.


endclass.
