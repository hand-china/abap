class zcl_demo_amdp_tf definition
  public
  final
  create public .

  public section.
***    标识此类为AMDP实现方式
    interfaces if_amdp_marker_hdb.
***  class-methods 方法
    class-methods: get_data for table function zvtf_xxxx.
  protected section.
  private section.
endclass.



class zcl_demo_amdp_tf implementation.

  method get_data by database function
      for hdb language sqlscript
      options read-only
*** method中将要使用到的表，视图和方法
      using spfli .
-- 在方法内部通过SQL -- 标识进行注释和说明

-- 查询结果临时存储变量
    et_result = select mandt,
                       carrid,
                       connid,
                       cityfrom,
                       cityto
                       from spfli
                       where mandt = :i_mandt
                        and  carrid = :i_carrid
                        and  connid = :i_connid ;
--  通过Return 语句返回与CDS定义类型&顺序一致的结果集
     return :et_result ;
  endmethod.
endclass.
