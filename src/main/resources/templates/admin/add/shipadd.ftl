<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新增页面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <form class="layui-form"  onsubmit="return add('/admin/ship/')">
            <table class="layui-table">
                <colgroup>
                    <col width="150" >
                    <col width="200" >
                    <col width="200" >
                    <col>
                </colgroup>
                <tr>
                    <td style="width: 100px">船只名称：</td>
                    <td>
                        <input type="text" name="shipname" required  lay-verify="required"  autocomplete="off" class="layui-input">
                    </td>
                </tr>
                <tr>
                    <td>船只类型：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="shiptype" >
                                    <option value=""></option>
                                    <option value="0">运输船</option>
                                    <option value="1">工程船</option>
                                    <option value="2">渔业船</option>
                                    <option value="3">港务船</option>
                                    <option value="4">海洋开发船</option>
                                    <option value="5">其他</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">价格：</td>
                    <td>
                        <input type="text" name="price" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">船只状况：</td>
                    <td>
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <select name="shipstatus" >
                                    <option value=""></option>
                                    <option value="0">计划中</option>
                                    <option value="1">生产中</option>
                                    <option value="2">生产完成</option>
                                    <option value="3">已交货</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">具体部件：</td>
                    <td>
                        <div class="layui-input-block">
                            <#list parts as part>
                                <input type="checkbox" name="parts" title="${part.partname}" value="${part.partid?c}"
                                       lay-skin="primary">
                            </#list>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>操作：</td>
                    <td>
                        <button type="submit" class="layui-btn">添加</button>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;" id="message"></span>
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