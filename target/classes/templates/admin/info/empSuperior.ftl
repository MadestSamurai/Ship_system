<html>
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
        <form class="layui-form"  onsubmit="return upd('/admin/empSuperior')">
            <table class="layui-table">
                <tr>
                    <td>上级：</td>
                    <td>
                        <select name="superior">
                            <#list superiors as sup>
                                <option value="${sup.empid?c}" <#if employee.superior==sup.empid>selected</#if>>${sup.empname}</option>
                            </#list>
                        </select>
                        <input type="hidden" value="${employee.empid?c}" name="empid" >
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