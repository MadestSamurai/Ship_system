<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>详情页面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <form class="layui-form"  onsubmit="return upd('/admin/employee')">
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
                        <input type="text" value="${employee.empname}" name="empname" required class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td>职位：</td>
                    <td>
                        <select name="expert" class="layui-input">
                            <option value="0" <#if employee.expert==0>selected</#if>>管理层</option>
                            <option value="1" <#if employee.expert==1>selected</#if>>普通员工</option>
                        </select>
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
                    <td>
                        <input type="text" value="${employee.certId}" name="certId" required   class="layui-input">
                        <input type="hidden" value="${employee.empid?c}" name="empid" >
                        <input type="hidden" value="${employee.superior?c}" name="superior" >
                    </td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <div class="layui-input-block">
                            <input type="radio" class="layui-input" name="sex" value="0" title="男" <#if employee.sex==0>checked</#if> >
                            <input type="radio" class="layui-input" name="sex" value="1" title="女" <#if employee.sex==1>checked</#if> >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>部门：</td>
                    <td>
                        <div class="layui-input-block">
                            <#list departments as dept><input type="checkbox" name="departments"
                                title=${dept.deptname} value=${dept.deptid?c} lay-skin="primary"
                                   ${employee.departments?seq_contains(dept.deptname)?string("checked", "")}>
                            </#list>
                        </div>
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
<#include "foot.ftl"/>
</body>
</html>