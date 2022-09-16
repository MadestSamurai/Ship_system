<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新增页面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <form class="layui-form"  onsubmit="return add('/admin/progress')">
            <table class="layui-table">
                <colgroup>
                    <col width="150" >
                    <col width="450" >
                </colgroup>
                <tbody>
                <tr>
                    <td style="width: 100px">任务船只及部件：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="task_id" >
                                    <#list tasks as task>
                                    <option value="${task.taskid?c}">${task.shipname} - ${task.partname}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>负责人编号-姓名：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="employee_id" >
                                    <#list workers as worker>
                                        <option value="${worker.empid?c}">${worker.empid?c} - ${worker.empname}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>任务信息：</td>
                    <td>
                        <input type="text" name="taskinfo" required  lay-verify="required"  autocomplete="off" class="layui-input">
                    </td>
                </tr>
                <tr>
                    <td>任务状态：</td>
                    <td>
                        <select name="taskstatus">
                            <option value="0">已完成</option>
                            <option value="1">未完成</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>操作：</td>
                    <td>
                        <button type="submit" class="layui-btn">添加</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
<#include "foot.ftl"/>
</body>
</html>