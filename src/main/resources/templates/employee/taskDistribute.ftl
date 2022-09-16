<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${ship_partname} 任务列表</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
    <link rel="stylesheet" href="/static/css/employee.css" type="text/css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
    <div class="layui-body">
        <div style="padding: 15px;">
            <div class="title"><span>${ship_partname} 任务列表</span></div><br/>
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="250">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="300">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>任务信息</th>
                    <th>任务状态</th>
                    <th>负责人编号</th>
                    <th>负责人姓名</th>
                    <th>启动时间</th>
                    <th>完成时间</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/employee/progressAdd/${task_id?c}')"><i class="layui-icon">&#xe608;</i> 添加</button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list progresses as h>
                    <tr>
                        <td>${h_index+1}</td>
                        <td>${h.taskinfo}</td>
                        <td>
                            <#if h.taskstatus==0>已完成</#if>
                            <#if h.taskstatus==1>未完成</#if>
                        </td>
                        <td>${h.employee_id?c}</td>
                        <td>${h.empname}</td>
                        <td>${(h.intime?string("yyyy-MM-dd"))!}</td>
                        <td>${(h.outtime?string("yyyy-MM-dd"))!}</td>
                        <td>
                            <button class="layui-btn" onclick="edit('/employee/progress/',${h.id?c})"><i class="layui-icon">&#xe642;</i></button>
                            <button class="layui-btn" onclick="del('/employee/progress/',${h.id?c})"><i class="layui-icon">&#xe640;</i></button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <#include "../foot.ftl"/>
</div>
<script src="/static/js/layui.all.js"></script>
</body>
</html>