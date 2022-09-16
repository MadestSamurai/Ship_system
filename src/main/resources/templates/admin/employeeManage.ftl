<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工管理界面</title>
    <link rel="stylesheet" href="../static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
    <!-- 内容主体区域 -->
    <div style="padding: 45px;">
        <h5>员工管理</h5>
        <form action="/admin/employeeManage" method="get">
            <table>
                <tr>
                    <td>姓名:</td>
                    <td><input name="empname" autocomplete="off" value="${name!''}" class="layui-input lay-size=sm">
                    </td>
                    <td>&nbsp;&nbsp;证件号:</td>
                    <td><input name="certId" autocomplete="off" value="${certId!''}" class="layui-input lay-size=sm">
                    </td>
                    <td>
                        <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i></button>
                    </td>
                </tr>
            </table>
        </form>
        <table class="layui-table">
            <colgroup>
                <col width="50">
                <col width="150">
                <col width="150">
                <col width="150">
                <col width="50">
                <col width="50">
                <col width="150">
                <col width="150">
                <col width="200">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>职位</th>
                <th>上级</th>
                <th>年龄</th>
                <th>性别</th>
                <th>证件号</th>
                <th>所属部门</th>
                <th>家庭住址</th>
                <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="layui-btn" onclick="showAdd('/admin/employeeAdd')"><i class="layui-icon">&#xe608;</i>
                        添加
                    </button>
                </th>
            </tr>
            </thead>
            <tbody>
            <#list employees as d>
                <tr>
                    <td>${d_index+1}</td>
                    <td>${d.empname}</td>
                    <td>
                        <#if d.expert==0>管理层</#if>
                        <#if d.expert==1>普通员工</#if>
                    </td>
                    <td>${d.supname}&emsp;<#if d.expert==1>
                        <button class="layui-btn" onclick="edit('/admin/empsup/',${d.empid?c})"><i class="layui-icon">&#xe642;</i>
                        </button></#if></td>
                    <td>${d.age}</td>
                    <td>
                        <#if d.sex==0>男</#if>
                        <#if d.sex==1>女</#if>
                    </td>
                    <td>${d.certId}</td>
                    <td><#list d.departments as dept>${dept} </#list></td>
                    <td>${d.address}</td>
                    <td>
                        <button class="layui-btn" onclick="edit('/admin/employee/',${d.empid?c})"><i class="layui-icon">&#xe642;</i>
                        </button>
                        <button class="layui-btn" onclick="del('/admin/employee/',${d.empid?c})"><i class="layui-icon">&#xe640;</i>
                        </button>
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