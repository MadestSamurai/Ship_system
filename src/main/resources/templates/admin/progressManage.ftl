<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>生产任务信息管理</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
        <div style="padding: 45px;">
            <h5>生产任务信息管理</h5>
            <form action="/admin/progressManage" method="get">
                <table>
                    <tr>
                        <td>任务负责人:</td>
                        <td><input name="ordersidename" value="${ordersidename!''}" autocomplete="off"
                                   class="layui-input lay-size=sm"></td>
                        <td>&nbsp;&nbsp;启动时间:</td>
                        <td><input name="intime" value="${intime!''}" type="date" autocomplete="off"
                                   class="layui-input lay-size=sm"></td>
                        <td>
                            <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i></button>
                        </td>
                    </tr>
                </table>
            </form>
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="250">
                    <col width="150">
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
                    <th>任务船只及部件</th>
                    <th>任务信息</th>
                    <th>任务状态</th>
                    <th>负责人编号</th>
                    <th>负责人姓名</th>
                    <th>启动时间</th>
                    <th>完成时间</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/admin/progressAdd')"><i
                                    class="layui-icon">&#xe608;</i> 添加
                        </button>
                        <button class="layui-btn" onclick="location.href='/admin/getProgress'">导出excel</button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list progresses as h>
                    <tr>
                        <td>${h_index+1}</td>
                        <td>${h.shipname}——${h.partname}</td>
                        <td>${h.taskinfo}</td>
                        <td>
                            <#if h.taskstatus==0>已完成</#if>
                            <#if h.taskstatus==1>未完成</#if>
                        </td>
                        <td>${h.employee_id}</td>
                        <td>${h.empname}</td>
                        <td>${(h.intime?string("yyyy-MM-dd"))!}</td>
                        <td>${(h.outtime?string("yyyy-MM-dd"))!}</td>
                        <td>
                            <button class="layui-btn" onclick="edit('/admin/progress/',${h.id?c})"><i
                                        class="layui-icon">&#xe642;</i></button>
                            <button class="layui-btn" onclick="del('/admin/progress/',${h.id?c})"><i class="layui-icon">&#xe640;</i>
                            </button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
            <#--<div id="test1"></div>-->
        </div>
    <#include "../foot.ftl"/>
</div>
<script src="/static/js/layui.all.js"></script>
</body>
</html>