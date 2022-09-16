<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>预约管理</title>
    <link rel="stylesheet" href="../static/css/layui.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
    <div class="layui-body">
        <div style="padding: 15px;">
            <h5>订单管理</h5>
        <form action="/admin/appointmentManage" method="get">
            <table>
                <tr>
                    <td>订单名称:</td>
                    <td><input name="ordersidename" value="${ordersidename!''}" autocomplete="off"  class="layui-input lay-size=sm" ></td>
                    <td>&nbsp;&nbsp;船只种类:</td>
                    <td><input name="employeename" value="${employeename!''}" autocomplete="off" class="layui-input lay-size=sm" ></td>
                    <td>   <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i></button></div></td>
    </tr>
    </table>
    </form>
        <!-- 内容主体区域 -->

            <table class="layui-table">
                <colgroup>
                    <col width="150" >
                    <col width="200" >
                    <col width="200" >
                    <col width="200" >
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>订单号</th>
                    <th>订单名称</th>
                    <th>船只种类</th>
                    <th>预约时间</th>
                    <th>订单金额</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/admin/appointmentAdd')"><i class="layui-icon">&#xe608;</i> 添加</button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list appointments as a>
                    <tr>
                        <td>${a_index+1}</td>
                        <td>${a.id}</td>
                        <td>${a.ordersidename!''}</td>
                        <td>${a.department!''}</td>
                        <td>${(a.time?string("yyyy-MM-dd"))!}</td>
                        <td>${a.expenses}(万元)</td>
                        <td>
                            <button class="layui-btn" onclick="edit('/admin/appointment/',${a.id})"><i class="layui-icon">&#xe642;</i></button>
                            <button class="layui-btn" onclick="del('/admin/appointment/',${a.id})"><i class="layui-icon">&#xe640;</i></button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
            <#--<div id="test1"></div>-->
        </div>
    </div>
    <#include "../foot.ftl"/>
</div>
<script>
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        //执行一个laypage实例
        laypage.render({
            elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 5 //数据总数，从服务端得到
            ,limit:5
        });
    });

</script>
</body>
</html>