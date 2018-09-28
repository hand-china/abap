/* DDL文件名:    ZVFXXX4_DDL
         源系统:       S4H
         创建日期:      2018年6月19日 上午11:19:29
         创建者:       HAND 2967 Email: xxxx@xxxx.com
         功能描述: 详细描述实现的功能和被调用的程序
         修改历史记录:
    No.  User     Date          ChangeContent
    1.   2967     2018年6月19日    初始版本
*/
// SQL视图名与 视图名称前面一致，大写字符，无需 _DDL 最长不超过16个字符
@AbapCatalog.sqlViewAppendName: 'ZVFXXX4'
@EndUserText.label: 'demo'
// 基本视图，CDS视图名称
extend view ZVFXXX1_DDL
// 视图名称和 数据定义文件(Data Definitions)文件名一致,最长不超过30个字符
// 推荐和基本视图名 类似 ，结尾采用_EX_DDL
with ZVFXXX4_DDL
{
  // 扩展只能是普通字段和关联对象字段，不能是关键字段 。
  // 其他字段 列名/表达式/函数   [as 别名],
  @EndUserText.label: '发票'
  b.invoice,
  @EndUserText.label: '航班用时'
  p.arrtime
  // 聚合函数 字段列表不应该出现在Group by 中
  // sum(xxxx) as 列别名 ,
}
// 如果基本视图中包含 分组 ,那扩展视图中也必须有
// 聚合 将所有非聚合函数字段，按字段列顺序 罗列
/*
group by  b.invoice, p.arrtime
*/

// 如果基本视图中包含 联合 UNION / UNION ALL ，扩展视图中必须有
// 字段数量和上面相同
/* UNION / UNION ALL
{
    x.xxxx,
    y.yyyy
}
group by x.xxxx , y.yyyy
*/
