<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>详情页面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
    <div style="padding: 15px;">
        <form class="layui-form"  onsubmit="return upd('/employee/employee')">
            <table class="layui-table">

                <tr>
                    <td style="width: 100px">登录账号：</td>
                    <td>
                        <input type="text" value="${employee.username!''}" name="username" required  class="layui-input" >
                        <input type="hidden" value="${employee.loginid!''}" name="loginid" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">登录密码：</td>
                    <td>
                        <input type="text" value="${employee.password!''}" name="password" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">姓名：</td>
                    <td>
                        <input type="text" value="${employee.empname}" name="empname" required  class="layui-input" >
                        <input type="hidden" value="${employee.empid?c!''}" name="empid" required  class="layui-input" >
                        <input type="hidden" value="${employee.superior?c!''}" name="superior" >
                    </td>
                </tr>
                <tr>
                    <td>职位：</td>
                    <td>
                        <#if employee.expert==0>管理层</#if>
                        <#if employee.expert==1>普通员工</#if>
                        <input type="hidden" value="${employee.expert!''}" name="expert" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td>年龄：</td>
                    <td>
                        <input type="text" value="${employee.age}" name="age" required  class="layui-input">
                    </td>
                </tr>
                <tr>
                    <td>身份证号：</td>
                    <td>${employee.certId}
                    <input type="hidden" value="${employee.certId!''}" name="certId" required class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <#if employee.sex==0>男</#if>
                        <#if employee.sex==1>女</#if>
                        <input type="hidden" value="${employee.sex!''}" name="sex" required class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td>部门：</td>
                    <td><#list employee.departments as dept>${dept}&nbsp;</#list>
                        <#list departments as dept>
                            <#if employee.departments?seq_contains(dept.deptname)>
                                <input type="hidden" name="departments" value="${dept.deptid?c}" required class="layui-input"></#if></#list>
                    </td>
                </tr>
                <tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" value="${employee.address}" name="address" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td>简介：</td>
                    <td>
                        <textarea name="empinfo" required  class="layui-input" >${employee.empinfo}</textarea>
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
<#include "../employee/info/foot.ftl"/>
</body>
</html>