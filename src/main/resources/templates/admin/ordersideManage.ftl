<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>患者页面管理</title>
    <link rel="stylesheet" href="../static/css/layui.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h5>订方信息管理</h5>
            <form action="/admin/ordersideManage" method="get">
                <table>
                    <tr>
                        <td>公司名称:</td>
                        <td><input name="name" value="${name!''}" autocomplete="off"  class="layui-input lay-size=sm" ></td>
                        <td>&nbsp;&nbsp;证件号:</td>
                        <td><input name="certId" value="${certId!''}" autocomplete="off" class="layui-input lay-size=sm" ></td>
                        <td>   <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i></button></div></td>
        </tr>
        </table>
        </form>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>公司名</th>
                    <th>公司法人</th>
                    <th>法人证件号</th>
                    <th>是否签约</th>
                    <th>公司地址</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/admin/ordersideAdd')"><i class="layui-icon">&#xe608;</i> 添加</button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list ordersides as p>
                    <tr>
                        <td>${p_index+1}</td>
                        <td>${p.name}</td>
                        <td>${p.employeename!''}</td>
                        <td>${p.certId}</td>
                        <td>
                            <#if p.isout==0>未签约</#if>
                            <#if p.isout==1>已签约</#if>
                            <#if p.isout==2>已解约</#if>
                        </td>
                        <td>${p.address}</td>
                        <td>
                            <button class="layui-btn" onclick="edit('/admin/orderside/',${p.id})"><i class="layui-icon">&#xe642;</i></button>
                            <button class="layui-btn" onclick="del('/admin/orderside/',${p.id})"><i class="layui-icon">&#xe640;</i></button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <#include "../foot.ftl"/>
</div>
<script src="../static/js/layui.all.js"></script>
</body>
</html>