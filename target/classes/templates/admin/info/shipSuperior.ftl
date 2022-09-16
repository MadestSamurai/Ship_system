<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部门员工</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div style="padding: 15px;">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="150">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>解除管理</th>
            </tr>
            </thead>
            <tbody>
            <#list employees as d>
                <tr>
                    <td>${d_index+1}</td>
                    <td>${d.empname}</td>
                    <td>
                        <form action="/admin/shipSupDel" method="get" class="layui-form">
                            <input type="hidden" value="${d.shipsupid?c}" name="shipsupid">
                            <input type="hidden" value="${shipidcopy?c}" name="shipid">
                            <button class="layui-btn" type="submit"><i class="layui-icon">解除管理</i></button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <form action="/admin/shipSupAdd" method="get" class="layui-form">
            <select name="supid">
                <#list superiors as sup>
                    <option value="${sup.empid?c}">${sup.empname}</option>
                </#list>
            </select>
            <input type="hidden" value="${shipidcopy?c}" name="shipid">
            <button class="layui-btn" type="submit"><i class="layui-icon">增加新管理</i></button>
        </form>
    </div>
</div>
</div>
<script src="/static/js/layui.all.js"></script>
</body>
</html>