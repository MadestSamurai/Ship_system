<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部件管理</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
        <!-- 内容主体区域 -->
        <div style="padding: 45px;">
            <h5>部件管理</h5>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>部件名称</th>
                    <th>部件类型</th>
                    <th>价格</th>
                    <th>操作&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn" onclick="showAdd('/admin/partAdd')"><i class="layui-icon">&#xe608;</i>添加</button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list parts as o>
                    <tr>
                        <td>${o_index+1}</td>
                        <td>${o.partname!''}</td>
                        <td>${o.parttype!''}</td>
                        <td>${o.partprice!''}(元)</td>
                        <td>
                            <button class="layui-btn" onclick="edit('/admin/part/',${o.partid?c})"><i class="layui-icon">&#xe642;</i>
                            </button>
                            <button class="layui-btn" onclick="del('/admin/part/',${o.partid?c})"><i class="layui-icon">&#xe640;</i>
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