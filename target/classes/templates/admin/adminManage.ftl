<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员管理</title>
    <link rel="stylesheet" href="../static/css/layui.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>


    <div class="layui-body">

        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h5>管理员管理</h5>
            <form action="/admin/adminManage" method="get">
                <table>
                    <tr>
                        <td>账号:</td>
                        <td><input name="username" value="${username!''}" autocomplete="off"  class="layui-input lay-size=sm" ></td>
                        <td>   <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i></button></div></td>
        </tr>
        </table>
        </form>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>账号</th>
                    <th>密码</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/admin/adminAdd')"><i class="layui-icon">&#xe608;</i> 添加</button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list admins as a>
                    <tr>
                    <td>${a_index+1}</td>
                    <td>${a.username}</td>
                    <td>**********</td>
                        <td>
                            <button class="layui-btn" onclick="edit('/admin/admin/',${a.id?c})"><i class="layui-icon">&#xe642;</i></button>
                            <button class="layui-btn" onclick="del('/admin/admin/',${a.id?c})"><i class="layui-icon">&#xe640;</i></button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <#include "../foot.ftl"/>

</div>
</body>
</html>