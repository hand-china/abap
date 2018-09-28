/* DDL文件名:    ZVFXXX3_DDL
         源系统:       S4H
         创建日期:      2018年6月19日 上午11:17:28
         创建者:       HAND 2967 Email: xxxx@xxxx.com
         功能描述: 详细描述实现的功能和被调用的程序
         修改历史记录:
    No.  User     Date          ChangeContent
    1.   2967     2018年6月19日    初始版本
*/
// SQL视图名与 视图名称前面一致，大写字符，无需 _DDL 最长不超过16个字符
@AbapCatalog.sqlViewName: 'ZVFXXX3'
@AbapCatalog.compiler.compareFilter: true
// 访问控制权限检查注解  #CHECK 检查/#NOT_REQUIRED 不需要/#NOT_ALLOWED 不允许/#PRIVILEGED_ONLY  默认#CHECK
@AccessControl.authorizationCheck: #CHECK
// 视图描述 描述清楚 简单明了 最长不超过60个字符
@EndUserText.label: 'Demo'
// 缓冲类型 #SINGLE单条记录/#GENERIC一般/#FULL完全/#NONE无 , 默认#NONE
@AbapCatalog.buffering.type: #NONE
// 默认000 , 大于1 小于主键(key)数量
@AbapCatalog.buffering.numberOfKeyFields: 000
// 缓冲状态 #NOT ALLOWED/#ACTIVE/#SWITCHED_OFF 默认  SWITCHED_OFF
@AbapCatalog.buffering.status: #SWITCHED_OFF
// 视图名称和 数据定义文件(Data Definitions)文件名一致,最长不超过30个字符
define view ZVFXXX3_DDL
  // 视图参数 ，如不带参数，请删除
  // 参数格式    i_xxxxx : 参数类型     系统环境默认值  ,
  with parameters
    // 客户端 ， 默认 当前客户端 sy-mandt
    i_mandt  : syst_mandt @<Environment.systemField: #CLIENT,
    // 语言， 默认当前登录语言  sy-langu
    i_langu  : syst_langu @<Environment.systemField: #SYSTEM_LANGUAGE,
    // 日期， 默认当前日期  sy-datum
    i_datum  : syst_datum @<Environment.systemField: #SYSTEM_DATE,
    // 时间， 默认当前时间 sy-uzeit
    i_uzeit  : syst_uzeit @<Environment.systemField: #SYSTEM_TIME,
    // 用户名， 默认当前用户 sy-uname
    i_uname  : syst_uname @<Environment.systemField: #USER,
    // ABAP基本类型  可使用类型如下:
    //  abap.char( len )     ABAP类型 字符串  CHAR 长度 len
    //  abap.clnt            ABAP类型  客户端  CLNT
    //  abap.cuky(5)         ABAP类型  货币  CUKY 长度5
    //  abap.curr(len,dec)   ABAP类型 金额 CURR 长len , 精确度 dec
    //  abap.dats            ABAP类型 日期 DATS
    //  abap.dec(len,dec)    ABAP类型 小数 DEC 长度 len ,精确度 dec
    //  abap.fltp            ABAP类型 浮点数  FLTP
    //  abap.int1            ABAP类型 整数 INT1
    //  abap.int2            ABAP类型 整数 INT2
    //  abap.int4            ABAP类型 整数 INT4
    //  abap.int8            ABAP类型 整数 INT8
    //  abap.lang            ABAP类型 语言 LANG
    //  abap.numc(len)       ABAP类型 数字 NUMC 长度 len
    //  abap.quan(len,dec)   ABAP类型 数量 QUAN 长度 len ,精确度 dec
    //  abap.raw(len)        ABAP类型 二进制 RAW 长度 len
    //  abap.sstring(len)    ABAP类型 SSTRING 长度 len
    //  abap.tims            ABAP类型 时间 TIMS
    //  abap.unit(3)         ABAP类型 单位 UNIT 长度3
    @EndUserText.label: '航空公司编码'
    i_carrid : abap.char(4)
  as
  // 如果是CDS视图,选择使用用ZVXXXXX_DDL的名称
  // 如果CDS视图存在参数，调用格式格式 CDS视图名( 参数1 : 输入参数a  [, 参数2 : 输入参数b ] ) as 表别名
  select from ZVFXXX2_DDL( i_mandt : $parameters.i_mandt ,
                           i_langu : $parameters.i_langu ,
                           i_datum : $parameters.i_datum ,
                           i_uzeit : $parameters.i_uzeit ,
                           i_uname : $parameters.i_uname ,
                           i_carrid : $parameters.i_carrid ) as f
  // 其他表连接和关联，具体语法参考基本视图
  /* inner join xxxx as x on f.xxxx = x.xxxx
     association [min..max] to yyyy as _yyyy on  f.field = _yyyy.field
  */
  // 在此列明 选择字段， 优先 关键字段 key ,其次为其他字段
{
      // 关键字段列表 ,  mandt无需明确列示
      // 格式 (key 关键字段列明  [as 别名],)
  key f.carrid,
  key f.connid,
  key f.fldate,
      // 其他字段 列名   [as 别名], 其他字段语法 参考基本视图

      // 其他字段 列名   [as 别名], 其他字段语法 参考基本视图
      @Semantics.currencyCode: true
      f.currency,
      @Semantics.amount.currencyCode: 'CURRENCY'
      f.paymentsum,

      // 其他可访问关联表字段 列名   [as 别名], 其他字段语法 参考基本视图
      f._sbook.customid,
      f._sbook.passname,
      f._spfli.cityfrom,
      f._spfli.cityto
}
// <条件> 字段 比较符 值 多个条件，采用 and ，or等连接
where
  f.carrid = $parameters.i_carrid
