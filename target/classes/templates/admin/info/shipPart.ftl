<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>船只部件</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div style="padding: 15px;">
        <table class="layui-table">
            <colgroup>
                <col width="150">
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
            </tr>
            </thead>
            <tbody>
            <#list parts as o>
                <tr>
                    <td>${o_index+1}</td>
                    <td>${o.partname!''}</td>
                    <td>${o.parttype!''}</td>
                    <td>${o.partprice?c!''}(元)</td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
</div>
<script src="/static/js/layui.all.js"></script>
</body>
</html>