/* DDL文件名:    ZVFXXX1_DDL
         源系统:       S4H
         创建日期:      2018年6月19日 上午11:13:58
         创建者:       HAND 2967 Email: xxxx@xxxx.com
         功能描述: 详细描述实现的功能和被调用的程序大致信息
         修改历史记录:
    No.  User     Date          ChangeContent
    1.   2967     2018年6月19日    初始版本
*/
// SQL视图名与 视图名称前面一致，大写字符，无需 _DDL 最长不超过16个字符
@AbapCatalog.sqlViewName: 'ZVFXXX1'
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
define view ZVFXXX1_DDL
  // 视图参数 ，如不带参数，请删除
  // 参数格式    i_xxxxx : 参数类型     系统环境默认值  ,
  with parameters
    // 客户端 ， 默认 当前客户端 sy-mandt
    i_mandt    : syst_mandt @<Environment.systemField: #CLIENT,
    // 语言， 默认当前登录语言  sy-langu
    i_langu    : syst_langu @<Environment.systemField: #SYSTEM_LANGUAGE,
    // 日期， 默认当前日期  sy-datum
    i_datum    : syst_datum @<Environment.systemField: #SYSTEM_DATE,
    // 时间， 默认当前时间 sy-uzeit
    i_uzeit    : syst_uzeit @<Environment.systemField: #SYSTEM_TIME,
    // 用户名， 默认当前用户 sy-uname
    i_uname    : syst_uname @<Environment.systemField: #USER,
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
    i_carrid   : abap.char(4),
    // 如 折扣
    @EndUserText.label: '折扣'
    i_discount : abap.dec( 3, 2 ),
    // 数据字典中定义的类型    如 s_conn_id
    @EndUserText.label: '航班号'
    i_connid   : s_conn_id
  as
  // 查询主表名/主视图名   [as 别名] , 如果是CDS视图,选择使用用ZVXXXXX_DDL的名称
  select from           sbook   as b
  // 连接类型 内连接(inner join)/左外连接(left outer join)
  // 右外连接(right outer join)/交叉连接(cross join)
    inner join
    // 使用括号明确声明连接顺序  嵌套 Join ，无法采用子查询，如需要子查询，请使用创建多个CDS视图实现
(
                        sflight as f
        left outer join spfli   as p
        // on连接条件 按字段顺序 使用 and 连接多个字段，mandt字段无需在此明确显示
        on  f.carrid = p.carrid
        and f.connid = p.connid
    )
    // on连接条件 按字段顺序 使用 and 连接多个字段，mandt字段无需在此明确显示
    on  b.carrid = f.carrid
    and b.connid = f.connid
    and b.fldate = f.fldate
  // 在此列明 选择字段， 优先 关键字段 key ,其次为其他字段
{
      // 关键字段列表 ,  mandt无需明确列示
      // 格式 (key 关键字段列明  [as 别名],)
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      // 其他字段 列名   [as 别名],
      p.cityfrom,
      p.cityto,
      f.planetype,
      b.passname,
      // 如需类型转换 格式 cast( 列/函数(列)/计算值   as 类型  ) as 列别名 ,

      // 数学计算    加 +/减 -/乘* / 除/
      // 格式( 表别名.字段名  数学计算符合   表别名.字段名或者常量或者参数  as 列别名  , )
      @EndUserText.label: '剩余座位数'
      f.seatsmax - f.seatsocc                    as seatsfree,
      @EndUserText.label: '总座位数'
      f.seatsmax + f.seatsmax_b + f.seatsmax_f   as seatsmax_t,
      @EndUserText.label: '已卖出座位数'
      f.seatsocc + f.seatsocc_b + f.seatsocc_f   as seatsocc_t,
      @Semantics.amount.currencyCode: 'LOCCURKEY'
      b.loccuram * $parameters.i_discount        as dis_loccuram,

      // 数学计算函数  格式  func(arg1,arg2) as 列别名
      /* 常用函数 如下:
               div(arg1,arg2) as 列别名  ,         // 整数除法 类型要求 INT1-INT8 DEC(len,dec=0)
               mod(arg1,arg2) as 列别名  ,         // 求余数  类型要求 INT1-INT8
               division(arg1,arg2,dec) as 列别名 , //除法 按dec 精确进行计算
               abs(arg1)   as 列别名 ,            // 绝对值
               floor(arg1) as 列别名 ,            // 向下取整
               ceil(arg1) as 列别名 ,             // 向上取整
               round(arg1,pos) as 列别名 ,        // 按pos取整 四舍五入
      */

      // 字符串函数 格式 func(arg1.arg2) as 列别名 ,
      /* 常用字符串函数 如下:
               concat(arg1,arg2) as 列别名 ,      // 连接 CHAR or SSTRING
               replace(arg1,arg2,arg3) as 列别名,// 替换 使用arg3在arg1中替换所有出现的arg2
               substring(arg,pos,len) as 列别名, // 截取字符串arg中 从pos开始的len 个字符
               length(arg) as 列别名 ,            // arg的字符长度
               left(arg,n) as 列别名 ,            // 返回从左开始的 n 个字符
               right(arg,n)                    // 返回从右开始的 n 个字符
               concat_with_space(arg1,arg2,n) as 列别名 , // 返回arg1,arg2 连接的字符串，总结使用n 个空格分割
      */
      @EndUserText.label: '起飞机场'
      concat_with_space(p.cityfrom,p.airpfrom,1) as city_airpfrom,

      // 日期处理函数 格式 func(arg1,arg2) as 列别名 ,
      /* 常用函数如下: date 格式为 YYYYMMDD
                dats_is_valid(date) as 列别名,            // 校验日期 date有效，返回1，其他返回 0
                dats_days_between(date1,date2) as 列别名  ,// 返回日期date1 和date2 之间的天数
                dats_add_days(date,ndays) as 列别名,      // 日期加上 ndays
                dats_add_months(dats,nmonths) as 列别名,  // 月份加上 nmonths
      */

      // CASE 判断
      @EndUserText.label: '座位舱等'
      case b.class
          when 'Y' then '经济舱'
          when 'C' then '商务舱'
          when 'F' then '头等舱'
        end                                      as class_txt,
      @EndUserText.label: '是否行李超限'

      // 多层判断
      case
        when class = 'F' then ' '
        else
            case
               when ( wunit = 'KG' and luggweight > 20 )
                 or ( wunit = 'LB' and luggweight > 20 ) then 'X'
               else ' '
            end
        end                                      as excess_luggage,

      // 指定货币字段
      @Semantics.currencyCode: true
      b.loccurkey,
      // 指定金额参考的货币字段  参考 LOCCURKEY
      @Semantics.amount.currencyCode: 'LOCCURKEY'
      b.loccuram,


      // 常量USD 类型转换
      @EndUserText.label: '货币USD'
      @Semantics.currencyCode: true
      cast('USD' as abap.cuky)                   as currency,

      // 金额货币汇率转换
      @Semantics.amount.currencyCode: 'CURRENCY'
      currency_conversion(
            amount => f.price ,                         // 源货币金额
            source_currency => f.currency,              // 源货币
            round  => 'X' ,                             // 是否取整
            target_currency => cast( 'USD' as abap.cuky), // 目标货币
            exchange_rate_type => 'M',                    // 汇率类型
            exchange_rate_date => f.fldate,               // 汇率换算日期
            error_handling => 'SET_TO_NULL'               // 出错处理 SET_NULL , FAIL_ON_ERROR , KEEP_UNCONVERTED
      )                                          as price,

      // 货币转换显示
      cast( decimal_shift(                                // 小数位数转换，
            amount => f.price ,
            currency => cast( '0 ' as abap.cuky( 5 )) ,   // 扩大100倍 ，参考货币 默认2位小数
            error_handling => 'SET_TO_NULL'
                )
           as abap.curr( 15,2 )  )
                                                 as price_shift_0,
      cast( decimal_shift(                                // 小数位数转换
            amount => f.price ,
            currency => cast( '1 ' as abap.cuky(5) ) ,    // 扩大10倍， 参考货币 默认2位小数
            error_handling => 'SET_TO_NULL'
               )
           as abap.curr(15,2) )
                                                 as price_shift_1,

      // 指定单位字段
      @Semantics.unitOfMeasure: true
      b.wunit,
      // 指定数量参考的单位字段 参考 WUNIT
      @Semantics.quantity.unitOfMeasure: 'WUNIT'
      b.luggweight,

      // 常量 类型转换
      @EndUserText.label: '单位MI'
      @Semantics.unitOfMeasure: true
      cast('MI' as abap.unit)                    as distid, // cast 类型转换 as 别名

      // 单位转换
      @Semantics.quantity.unitOfMeasure: 'DISTID'
      cast(                                             // cast 类型转换
           Unit_Conversion(                             // 单位之间 转换
             quantity => p.distance ,                   // 源数量
             source_unit => p.distid,                   // 源单位
             target_unit => cast('MI' as abap.unit ) ,  //目标单位
             error_handling => 'SET_TO_NULL'            //错误处理  SET_TO_NULL / FAIL_ON_ERROR / KEEP_UNCONVERTED
               )
           as abap.quan( 20, 2 ) )                      //类型转换 目标类型 abap.quan(20,2)
                                                 as distance // 目标数量   as 别名

      // 聚合函数 字段列表不应该出现在Group by 中
      // 格式  func( 表达式 ) as 列别名 ,
      /* 常用聚合函数如下 :
               sum(operand) as 列别名 ,    // 求和
               max(operand) as 列别名 ,    // 求最大值
               min(operand) as 列别名 ,    // 求最小值
               avg(operand) as 列别名,    // 求均值
               count( * ) as 列别名,      // 求计数
               count( distinct operand) as 列别名 ,  //求不重复计算
      */

}
// <条件> 字段 比较符 值 多个条件，采用 and ，or等连接
where
      b.carrid = $parameters.i_carrid
  and b.fldate <= $parameters.i_datum

// 分组  聚合 将所有非聚合函数字段，按字段列顺序 罗列
/*
group by  key1 , key 2 ,
          field1 , field2
*/
// 聚合函数过滤条件
/*
having func( 列名 ) > $parameter.i_xxxx
*/

// 联合  UNION 联合去重 / UNION ALL 联合不去重
/*
UNION [ALL]
 select from xxxx {
// 字段名称以第一条 SELECT 语句为主，要求列数量相同，名称，字段类型相同
   key1  ,
   key2  ,
   field1 ,
   sum(filed2) as field2 ,
 }
where field1 = $parameters.i_carrid
group by key1, key2, field1
having func( 列名 ) > $parameter.i_xxxx

UNION [ALL]
  select ...
*/
