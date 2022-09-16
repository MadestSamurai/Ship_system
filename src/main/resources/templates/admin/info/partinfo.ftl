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
        <form class="layui-form"  onsubmit="return upd('/admin/part')">
            <table class="layui-table">
                <colgroup>
                    <col width="150" >
                    <col width="200" >
                    <col width="200" >
                    <col>
                </colgroup>
                <tr>
                    <td style="width: 100px">部件名称：</td>
                    <td>
                        <input type="text" value="${part.partname}" name="partname" required  class="layui-input" >
                        <input type="hidden" value="${part.partid?c}" name="partid" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">部件种类：</td>
                    <td>
                        <input type="text" value="${part.parttype}" name="parttype" required  class="layui-input" >
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">部件价格：</td>
                    <td>
                        <input type="text" value="${part.partprice?c}" name="partprice" required  class="layui-input" >
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