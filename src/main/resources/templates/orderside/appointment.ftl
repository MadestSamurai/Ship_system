<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>订单页面</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
    <link rel="stylesheet" href="/static/css/normalize.css" type="text/css"/>
</head>
<body>
<header>
    <a class="logo" href="/csscShip"><img src="/static/images/logo.png" width="350" height="51"/></a>
</header>
<div class="layui-layout layui-layout-admin">
    <#--<#include "../menu.ftl"/>-->
    <div>
        <table style="margin: 0 auto;">
            <tr>
                <td><a href="/orderside/appointment">挂号</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><a href="/orderside/search">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><a href="/orderside/medicalhistory">病史</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><a href="/orderside/progress">住院</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><a href="/logout">退出登录</a></td>
            </tr>
        </table>
    </div>
    <!-- 内容主体区域 -->

    <div style="height: 400px;"></div>
</div>
<footer>
    <div class="footBase">
        <h3>电话：6666
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>传真：111111（全天）</span></h3>
        <p>主办单位：中国船舶集团有限公司 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：上海市黄浦区老西门街道中华路889号<br/>版权所有
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备案号：000000 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
    </div>
</footer>
<script src="/static/js/layui.all.js"></script>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer
            , form = layui.form;
        form.on('select(department)', function (data) {
            var department = (data.value);
            $.ajax({
                type: 'GET',
                url: '/employee/' + department,
                dataType: 'json',
                success: function (data) {
                    $("#employeeid").empty();
                    data = data.employees;
                    data.forEach(function (item) {
                        var name = item.name;
                        var expert = item.expert;
                        if(expert==0){
                            expert='管理人员';
                        }
                        else {
                            expert='普通员工';
                        }
                        console.log(name);
                        var id = item.id;
                        console.log(id);
                        $("#employeeid").append("<parts value=" + id + ">" + name +"----"+expert+"</parts>");
                    });
                    form.render('select');
                }
            });
        });

    });
</script>
</body>
</html>