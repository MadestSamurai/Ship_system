<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工界面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
    <link rel="stylesheet" href="/static/css/employee.css" type="text/css"/>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
    <div class="layui-body">
        <div style="padding: 15px;">
            <div class="title"><span>管辖员工</span></div>
            <br/>
            <form action="/employee/workerList" method="get">
                <table>
                    <tr>
                        <td>姓名:</td>
                        <td><input name="empname" autocomplete="off" value="${name!''}" class="layui-input lay-size=sm">
                        </td>
                        <td>&nbsp;&nbsp;证件号:</td>
                        <td><input name="certId" autocomplete="off" value="${certId!''}"
                                   class="layui-input lay-size=sm"></td>
                        <td>
                            <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i></button>
                        </td>
                    </tr>
                </table>
            </form>
            <div class="experts">
                <ul data-num="0">
                    <#list employees as d>
                        <li><a href="/employee/taskListEmp/${d.empid?c}" title="${d.empname}"><img
                                        src="/static/images/e_${d.empid?c}.jpg" alt="${d.empname}"
                                        onerror="javascript:this.src='/static/images/<#if d.sex==1>fe</#if>male_head.png';οnerrοr=null;"
                                        width="180" height="279" ></a>
                            <div class="txt"><em>${d.empname}</em>
                                <p><#list d.departments as dept>${dept} </#list></p></div>
                        </li>
                    </#list>
                </ul>
            </div>
            <#-- <table class="layui-table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>证件号</th>
                    <th>所属部门</th>
                    <th>家庭住址</th>
                </tr>
                </thead>
                <tbody>
                <#list employees as d>
                    <tr>
                        <td>${d_index+1}</td>
                        <td>${d.empname}</td>
                        <td>${d.age}</td>
                        <td>
                            <#if d.sex==0>男</#if>
                            <#if d.sex==1>女</#if>
                        </td>
                        <td>${d.certId}</td>
                        <td><#list d.departments as dept>${dept} </#list></td>
                        <td>${d.address}</td>
                    </tr>
                </#list>
                </tbody>
            </table> -->
        </div>
    </div>
</div>
</body>
</html>