/* DDL文件名:    ZVFXXX2_DDL
         源系统:       S4H
         创建日期:      2018年6月19日 上午11:16:20
         创建者:       HAND 2967 Email: xxxx@xxxx.com
         功能描述: 详细描述实现的功能和被调用的程序
         修改历史记录:
    No.  User     Date          ChangeContent
    1.   2967     2018年6月19日    初始版本
*/
// SQL视图名与 视图名称前面一致，大写字符，无需 _DDL 最长不超过16个字符
@AbapCatalog.sqlViewName: 'ZVFXXX2'
@AbapCatalog.compiler.compareFilter: true
// 访问控制权限检查注解  #CHECK 检查/#NOT_REQUIRED 不需要/#NOT_ALLOWED 不允许/#PRIVILEGED_ONLY  默认#CHECK
@AccessControl.authorizationCheck: #CHECK
// 视图描述 描述清楚 简单明了 最长不超过60个字符
@EndUserText.label: 'demo'
// 缓冲类型 #SINGLE单条记录/#GENERIC一般/#FULL完全/#NONE无 , 默认#NONE
@AbapCatalog.buffering.type: #NONE
// 默认000 , 大于1 小于主键(key)数量
@AbapCatalog.buffering.numberOfKeyFields: 000
// 缓冲状态 #NOT ALLOWED/#ACTIVE/#SWITCHED_OFF 默认  SWITCHED_OFF
@AbapCatalog.buffering.status: #SWITCHED_OFF
// 视图名称和 数据定义文件(Data Definitions)文件名一致,最长不超过30个字符
define view ZVFXXX2_DDL
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
  // 查询主表名/主视图名   [as 别名] , 如果是CDS视图,选择使用用ZVXXXXX_DDL的名称
  select from sflight as f
  // 关联语法  association [min..max] to 表名/视图   as _别名(下划线_ + 表名)
  // min 大于等于 0 ,不能为* ， max 必须大于等于1,可以为 *
  // 可简写成 association[max] ,如果min 为0，min 默认为0
  // on连接条件 按字段顺序 使用 and 连接多个字段，mandt字段无需在此明确显示
  association [0..*] to sbook as _sbook on  f.carrid = _sbook.carrid
                                        and f.connid = _sbook.connid
                                        and f.fldate = _sbook.fldate
  association [0..1] to spfli as _spfli on  f.carrid = _spfli.carrid
                                        and f.connid = _spfli.connid
  association [0..1] to tcurt as _tcurt on  f.currency = _tcurt.waers
  // 在此列明 选择字段， 优先 关键字段 key ,其次为其他字段
{
      // 关键字段列表 ,  mandt无需明确列示
      // 格式 (key 关键字段列明  [as 别名],)
  key f.carrid,
  key f.connid,
  key f.fldate,

      // 其他字段 列名   [as 别名], 其他字段语法 参考基本视图
      @Semantics.currencyCode: true
      f.currency,
      @Semantics.amount.currencyCode: 'CURRENCY'
      f.paymentsum,

      // 关联 ， 使整个关联字段可被外部SQL访问
      _sbook,
      _spfli,

      // 关联字段和过滤
      _sbook.customid,
      _sbook.passname,
      _spfli.airpfrom,
      _spfli.airpto,

      // 关联字段过滤  适合主数据文本描述处理
      // 格式   _assoc[列名  符号  表达式].列名   as 列别名 ,
      @EndUserText.label: '货币短文本'
      _tcurt[spras = $parameters.i_langu].ktext as ktext,
      @EndUserText.label: '货币描述'
      _tcurt[spras = $parameters.i_langu].ltext as ltext
}
// <条件> 字段 比较符 值 多个条件，采用 and ，or等连接
where
  f.carrid = $parameters.i_carrid
