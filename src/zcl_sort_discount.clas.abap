class zcl_sort_discount definition
  public
  final
  create public .

  public section.
  INTERFACES:
      if_sadl_exit_sort_transform.
  protected section.
  private section.
endclass.



class zcl_sort_discount implementation.
METHOD if_sadl_exit_sort_transform~map_element.
    IF iv_element <> 'GROSSAMOUNTWITHDISCOUNT'.
      "RAISE EXCEPTION TYPE zcx_sorting_exit EXPORTING textid = zcx_sorting_exit=>element_not_expected.
    ENDIF.
      APPEND value #( name = `CONVERTEDGROSSAMOUNT` ) TO et_sort_elements.
  ENDMETHOD.

endclass.
