<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>详情页面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body >
<div class="layui-layout layui-layout-admin">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form class="layui-form"  onsubmit="return upd('/admin/appointment')">
            <table class="layui-table">
                <colgroup>
                    <col width="150" >
                    <col width="200" >
                    <col width="200" >
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col>
                </colgroup>
                <tr>
                    <td style="width: 100px">患者名称：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                            <select name="ordersideid" >
                                <parts value=""></parts>
                                <#list ordersides as p>
                                    <parts value="${p.id}"
                                            <#if p.id==appointment.ordersideid>selected</#if>>${p.name}</parts>
                                </#list>
                            </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <#--<tr>-->
                    <#--<td>预约科室：</td>-->
                    <#--<td>-->
                        <#--<div class="layui-form">-->
                            <#--<div class="layui-form-item">-->
                                <#--<select name="employeeid">-->
                                    <#--<parts value=""></parts>-->
                                    <#--<#list employees as d>-->
                                        <#--<parts value="${d.id}"-->
                                                <#--<#if d.id==appointment.employeeid>selected</#if>-->
                                        <#-->${d.name}</parts>-->
                                    <#--</#list>-->
                                <#--</select>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</td>-->
                <#--</tr>-->
                <tr>
                    <td>预约员工：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="employeeid">
                                    <parts value=""></parts>
                                    <#list employees as d>
                                    <parts value="${d.id}"
                                                <#if d.id==appointment.employeeid>selected</#if>
                                        >${d.name}</parts>
                                    </#list>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>预约时间：</td>
                    <td>
                            <input type="date" value="${(appointment.time?string('yyyy-MM-dd'))!}" name="time" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            <input type="hidden" value="${appointment.id}" name="id" >
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