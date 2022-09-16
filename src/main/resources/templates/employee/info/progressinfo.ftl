<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>详情</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body >
<div class="layui-layout layui-layout-admin">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <form class="layui-form"  onsubmit="return upd('/employee/progress')">
            <table class="layui-table">
                <colgroup>
                    <col width="150" >
                    <col width="450" >
                    <col>
                </colgroup>
                <tr>
                    <td style="width: 100px">任务船只及部件：</td>
                    <td>${h.shipname}——${h.partname}</td>
                </tr>
                <tr>
                    <td style="width: 100px">负责人编号：</td>
                    <td>${h.employee_id}</td>
                </tr>
                <tr>
                    <td style="width: 100px">负责人姓名：</td>
                    <td>${h.empname}</td>
                </tr>
                <tr>
                    <td style="width: 100px">负责人留言：</td>
                    <td>${h.empmsg!''}</td>
                </tr>
                <tr>
                    <td>任务信息：</td>
                    <td>
                        <input type="text" name="taskinfo" value="${h.taskinfo}" required  lay-verify="required"  autocomplete="off" class="layui-input">
                        <input type="hidden" value="${h.id?c!''}" name="id" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td>任务状态：</td>
                    <td>
                        <#if h.taskstatus==0>已完成&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="taskstatus" class="layui-input" title="不退回" value="0" checked="checked"><input type="radio" name="taskstatus" class="layui-input" title="退回" value="1"></#if>
                        <#if h.taskstatus==1>未完成
                            <input type="hidden" value="${h.taskstatus!''}" name="taskstatus" required  class="layui-input" >
                            <input type="hidden" value="${(h.outtime?string('yyyy-MM-dd'))!}" name="outtime" required  class="layui-input" >
                        </#if>
                        <#--<select name="taskstatus">
                            <option value="0" <#if h.taskstatus==0>selected</#if>>已完成</option>
                            <option value="1" <#if h.taskstatus==1>selected</#if>>未完成</option>
                        </select>-->
                    </td>
                </tr>
                <tr>
                    <td>操作：</td>
                    <td>
                        <button type="submit" class="layui-btn">更新</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<#include "foot.ftl"/>
</body>
</html>