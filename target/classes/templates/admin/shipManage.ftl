<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>船只管理</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
        <div style="padding: 45px;">
            <h5>船只管理</h5>
            <form action="/admin/shipManage" method="get" class="layui-form">
                <table>
                    <tr>
                        <td>船只名称:</td>
                        <td><input name="shipname" value="${shipname!''}" autocomplete="off"
                                   class="layui-input lay-size=sm"></td>
                        <td>&nbsp;&nbsp;船只类型:</td>
                        <td>
                            <select name="type">
                                <option value=""></option>
                                <option value="0">运输船</option>
                                <option value="1">工程船</option>
                                <option value="2">渔业船</option>
                                <option value="3">港务船</option>
                                <option value="4">海洋开发船</option>
                                <option value="5">其他</option>
                            </select>
                        </td>
                        <td>
                            <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i></button>
                        </td>
                    </tr>
                </table>
            </form>
            <!-- 内容主体区域 -->
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="150">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>船只名称</th>
                    <th>船只类型</th>
                    <th>船只状态</th>
                    <th>查看船只部件</th>
                    <th>查看管理人员</th>
                    <th>预计价格（万元）</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/admin/shipAdd')"><i class="layui-icon">&#xe608;</i>添加
                        </button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list ship as d>
                    <tr>
                        <td>${d_index+1}</td>
                        <td>${d.shipname}</td>
                        <td>
                            <#if d.shiptype==0>运输船</#if>
                            <#if d.shiptype==1>工程船</#if>
                            <#if d.shiptype==2>渔业船</#if>
                            <#if d.shiptype==3>港务船</#if>
                            <#if d.shiptype==4>海洋开发船</#if>
                            <#if d.shiptype==5>其他</#if>
                        </td>
                        <td>
                            <#if d.shipstatus==0>计划中</#if>
                            <#if d.shipstatus==1>生产中</#if>
                            <#if d.shipstatus==2>生产完成</#if>
                            <#if d.shipstatus==3>已交货</#if>
                        </td>
                        <td>
                            <button class="layui-btn" onclick="showPart('/admin/shipPart/',${d.shipid?c})"><i class="layui-icon">&#xe615;</i></button>
                        </td>
                        <td>
                            <button class="layui-btn" onclick="showSup('/admin/shipSup/',${d.shipid?c})"><i class="layui-icon">&#xe615;</i></button>
                        </td>
                        <td>${d.price}</td>
                        <td>
                            <button class="layui-btn" onclick="edit('/admin/ship/',${d.shipid?c})"><i class="layui-icon">&#xe642;</i>
                            </button>
                            <button class="layui-btn" onclick="del('/admin/ship/',${d.shipid?c})"><i class="layui-icon">&#xe640;</i>
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