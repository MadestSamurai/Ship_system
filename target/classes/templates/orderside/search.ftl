<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>查看订单</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
    <link rel="stylesheet" href="/static/css/normalize.css" type="text/css"/>
    <style>
        .item li{
            margin-right: 40px;
            text-align: left;
            width: 200px;
            padding-right: 100px;
            word-wrap: break-word;
            word-break: break-all;
            height:auto;
            border: 1px dotted #000;
            border-radius: 5px;
            box-shadow: inset 1px 1px #ccc;
            background: #ccc;
            font-size: 20px;
            color: black;
            font-family: fantasy;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<header>
    <a class="logo" href="/csscShip"><img src="/static/images/logo.png" width="350" height="51"/></a>
</header>
<div class="layui-layout layui-layout-admin">
    <#--<#include "../menu.ftl"/>-->
    <div style="padding: 15px;">

        <form class="layui-form" action="/orderside/searchinfo" onsubmit="return search()" method="get">
            <table>
                <tr>
                    <td>查询类型：</td>
                    <td>
                        <select id="type" name="type">
                            <option value="">--请选择查询类型--</option>
                            <option value="department">部门</option>
                            <option value="employee">员工</option>
                            <option value="ship">船只</option>
                        </select>
                    </td>
                    <td><input type="text" id="name" name="name" autocomplete="off" placeholder="请输入你要查询的内容"
                               class="layui-input"></td>
                    <td>
                        <button style="width: 60px;margin-top: 0px" type="submit" class="btn layui-btn"><i
                                    class="layui-icon">&#xe615;</i></button>
                    </td>
                </tr>
            </table>
        </form>
        <ul id="list">

        </ul>
    </div>
    <div style="height: 400px;"></div>
</div>
<script src="/static/js/layui.all.js"></script>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    function search() {}
</script>
</body>
</html>
