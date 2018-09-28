class ZCL_S4H_D_CALC_AMOUNT definition
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



CLASS ZCL_S4H_D_CALC_AMOUNT IMPLEMENTATION.


  method /BOBF/IF_FRW_DETERMINATION~EXECUTE.
  " Read data with the given keys (typed with combined type table)
    DATA lt_item TYPE  zts4h_salesorderitem_tp_d.

    io_read->retrieve(
      EXPORTING
        iv_node                 =  is_ctx-node_key
        it_key                  =  it_key
      IMPORTING
        eo_message              =  eo_message
        et_data                 =  lt_item
        et_failed_key           =  et_failed_key
    ).

    " Read price-relevant product data from EPM product table SNWD_PD
    SELECT FROM snwd_pd FIELDS
        product_id AS product,
        price,
        currency_code
        FOR ALL ENTRIES IN @lt_item
        WHERE product_id = @lt_item-product
        INTO TABLE @DATA(lt_prices).

    SORT lt_prices BY product.

    " Calculate amount and update if needed.
    LOOP AT lt_item REFERENCE INTO DATA(lr_item).
      IF lr_item->product IS NOT INITIAL AND lr_item->quantity > 0.
        READ TABLE lt_prices WITH KEY product = lr_item->product ASSIGNING FIELD-SYMBOL(<ls_price>) BINARY SEARCH.
        IF sy-subrc = 0.
          DATA(lv_new_amount) = lr_item->quantity * <ls_price>-price.
          IF lv_new_amount <> lr_item->grossamount.
            lr_item->grossamount = lv_new_amount.
            lr_item->currencycode = <ls_price>-currency_code.
            io_modify->update(
              EXPORTING
                iv_node           =  is_ctx-node_key
                iv_key            =  lr_item->key
                is_data           =  lr_item
                it_changed_fields =  VALUE #( ( zif_s4h_salesorder_tp_d_c=>sc_node_attribute-zs4h_salesorderitem_tp_d-grossamount )
                ( zif_s4h_salesorder_tp_d_c=>sc_node_attribute-zs4h_salesorderitem_tp_d-currencycode ) )
                ).
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.
  endmethod.
ENDCLASS.
