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
        <form class="layui-form"  onsubmit="return upd('/admin/orderside')">
            <table class="layui-table">
                <thead>
                <tr>
                    <td colspan="2">基本信息</td>
                </tr>
                </thead>
                    <tr>
                        <td style="width: 100px">登录账号：</td>
                        <td>
                            <input type="text" value="${orderside.username!''}" name="username" required  class="layui-input" >
                            <input type="hidden" value="${orderside.loginid!''}" name="loginid" required  class="layui-input" >
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">登录密码：</td>
                        <td>
                            <input type="text" value="${orderside.password!''}" name="password" required  class="layui-input" >
                        </td>
                    </tr>
                <tr>
                    <td style="width: 100px">姓名：</td>
                    <td>
                        <input type="text" value="${orderside.name}" name="name" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td>年龄：</td>
                    <td>
                        <input type="text" value="${orderside.age}" name="age" required  class="layui-input">
                    </td>
                </tr>
                <tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" value="${orderside.certId}" name="certId" required   class="layui-input">
                        <input type="hidden" value="${orderside.id}" name="id" >
                    </td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="0" title="男" <#if orderside.sex==0>checked</#if>>
                            <input type="radio" name="sex" value="1" title="女" <#if orderside.sex==1>checked</#if>>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>地址：</td>
                    <td>
                        <input type="text" value="${orderside.address}" name="address" required  class="layui-input" >
                    </td>
                </tr>
                <thead>
                <tr>
                    <td colspan="2">住院信息</td>
                </tr>
                </thead>
                <#list progresses as progress>
                    <tr>
                        <td>序号</td>
                        <td>${progress_index+1}</td>
                    </tr>
                <tr>
                    <td style="width: 100px">楼层：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="floor" readonly="readonly">
                                    <parts value=""></parts>
                                    <parts value="1" <#if progress.floor=="1">selected</#if>>一层</parts>
                                    <parts value="2" <#if progress.floor=="2">selected</#if>>二层</parts>
                                    <parts value="3" <#if progress.floor=="3">selected</#if>>三层</parts>
                                    <parts value="4" <#if progress.floor=="4">selected</#if>>四层</parts>
                                    <parts value="5" <#if progress.floor=="5">selected</#if>>五层</parts>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>门牌号：</td>
                    <td>
                        <input readonly="readonly" type="text" name="door" value="${progress.door}"  required  lay-verify="required"  autocomplete="off" class="layui-input">
                        <#--<input type="hidden" name="medicalhistoryid" value="${progressid}">-->
                    </td>
                </tr>
                <tr>
                    <td>床号：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="bed" readonly="readonly">
                                    <parts value=""></parts>
                                    <parts value="1" <#if progress.bed=="1">selected</#if>>一号床</parts>
                                    <parts value="2" <#if progress.bed=="2">selected</#if>>二号床</parts>
                                    <parts value="3" <#if progress.bed=="3">selected</#if>>三号床</parts>
                                    <parts value="4" <#if progress.bed=="4">selected</#if>>四号床</parts>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>患病：</td>
                    <td>
                        <input type="text" readonly="readonly" name="medicalname" value="${progress.medicalname}" required  lay-verify="required"  autocomplete="off" class="layui-input">
                    </td>
                </tr>
                <tr>
                    <td>住院时间：</td>
                    <td>
                        <input type="date" readonly="readonly" name="intime" value="${(progress.intime?string('yyyy-MM-dd'))!}" required  lay-verify="required"  autocomplete="off" class="layui-input">
                    </td>
                </tr>
                <tr>
                    <td>住院时间：</td>
                    <td>
                        <input type="date" readonly="readonly" name="outtime" required value="${(progress.outtime?string('yyyy-MM-dd'))!}"  lay-verify="required"  autocomplete="off" class="layui-input">
                    </td>
                </tr>
                </#list>
                <thead>
                <tr>
                    <td colspan="2">预约信息</td>
                </tr>
                </thead>
                <#list appointments as appointment>
                    <tr>
                        <td>序号</td>
                        <td>${appointment_index+1}</td>
                    </tr>
                <tr>
                    <td>预约员工：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="employeeid" readonly="readonly">
                                    <parts value=""></parts>
                                    <#list employees as d>
                                        <parts value="${d.id}"
                                                <#if d.id==appointment.employeeid>selected</#if>
                                        >${d.name}</parts>
                                    </#list>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>预约时间：</td>
                    <td>
                        <input readonly="readonly" type="date" value="${(appointment.time?string('yyyy-MM-dd'))!}" name="time" required  lay-verify="required" autocomplete="off" class="layui-input">
                        <#--<input type="hidden" value="${orderside.appointmentid}" name="appointmentid" >-->
                    </td>
                </tr>
                </#list>
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