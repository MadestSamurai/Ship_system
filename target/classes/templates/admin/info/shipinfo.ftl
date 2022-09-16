<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>详情页面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <form class="layui-form"  onsubmit="return upd('/admin/ship')">
            <table class="layui-table">
                <colgroup>
                    <col width="150" >
                    <col width="200" >
                    <col width="200" >
                    <col>
                </colgroup>
                <tr>
                    <td style="width: 100px">船只名称：</td>
                    <td>
                        <input type="text" value="${ship.shipname}" name="shipname" required  class="layui-input" >
                        <input type="hidden" value="${ship.shipid?c}" name="shipid" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">船只类型：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="shiptype" >
                                    <option value="0" <#if ship.shiptype==0>selected</#if>>运输船</option>
                                    <option value="1" <#if ship.shiptype==1>selected</#if>>工程船</option>
                                    <option value="2" <#if ship.shiptype==2>selected</#if>>渔业船</option>
                                    <option value="3" <#if ship.shiptype==3>selected</#if>>港务船</option>
                                    <option value="4" <#if ship.shiptype==4>selected</#if>>海洋开发船</option>
                                    <option value="5" <#if ship.shiptype==5>selected</#if>>其他</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">价格：</td>
                    <td>
                        <input type="text" value="${ship.price?c}" name="price" required class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">船只状况：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="shipstatus" >
                                    <option value="0" <#if ship.shipstatus==0>selected</#if>>计划中</option>
                                    <option value="1" <#if ship.shipstatus==1>selected</#if>>生产中</option>
                                    <option value="2" <#if ship.shipstatus==2>selected</#if>>生产完成</option>
                                    <option value="3" <#if ship.shipstatus==3>selected</#if>>已交货</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">具体部件：</td>
                    <td>
                        <div class="layui-input-block">
                            <#list parts as part><input type="checkbox" name="parts"
                                title=${part.partname} value=${part.partid?c} lay-skin="primary"
                                ${ship.parts?seq_contains(part.partname)?string("checked", "")}>
                            </#list>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">简介：</td>
                    <td>
                        <textarea  name="shipinfo" required  class="layui-input">${ship.shipinfo}
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>操作：</td>
                    <td>
                        <button type="submit" class="layui-btn">更新</button>
                    </td>
                </tr>
                <tbody>

                </tbody>
            </table>
        </form>
    </div>
</div>
<#include "foot.ftl"/>
</body>
</html>