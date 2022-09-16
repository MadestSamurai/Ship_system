<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部门管理</title>
    <link rel="stylesheet" href="../static/css/layui.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
        <!-- 内容主体区域 -->
        <div style="padding: 45px;">
            <h5>部门管理</h5>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>部门名称</th>
                    <th>介绍</th>
                    <th>查看部门员工</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/admin/departmentAdd')"><i class="layui-icon">&#xe608;</i> 添加</button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list departments as i>
                    <tr>
                        <td>${i_index+1}</td>
                        <td>${i.deptname!''}</td>
                        <td>${i.deptinfo}</td>
                        <td>
                            <button class="layui-btn" onclick="showEmp('/admin/departmentemp/',${i.deptid?c})"><i class="layui-icon">&#xe615;</i></button>
                        </td>
                        <td>
                            <button class="layui-btn" onclick="edit('/admin/department/',${i.deptid?c})"><i class="layui-icon">&#xe642;</i></button>
                            <button class="layui-btn" onclick="del('/admin/department/',${i.deptid?c})"><i class="layui-icon">&#xe640;</i></button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    <#include "../foot.ftl"/>
</div>
<script src="/static/js/layui.all.js"></script>
</body>
</html>