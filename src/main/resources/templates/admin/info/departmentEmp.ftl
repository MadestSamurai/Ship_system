<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部门员工</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
        <div style="padding: 15px;">
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
                    <th>姓名</th>
                    <th>职位</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>证件号</th>
                    <th>所属部门</th>
                    <th>家庭住址</th>
                </tr>
                </thead>
                <tbody>
                <#list employees as d>
                    <tr>
                        <td>${d_index+1}</td>
                        <td>${d.empname}</td>
                        <td>
                            <#if d.expert==0>管理层</#if>
                            <#if d.expert==1>工人</#if>
                        </td>
                        <td>${d.age?c}</td>
                        <td>
                            <#if d.sex==0>男</#if>
                            <#if d.sex==1>女</#if>
                        </td>
                        <td>${d.certId}</td>
                        <td><#list d.departments as dept>${dept} </#list></td>
                        <td>${d.address}</td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="/static/js/layui.all.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 5 //数据总数，从服务端得到
            ,limit:5
        });
    });
</script>
</body>
</html>