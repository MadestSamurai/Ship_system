<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管辖船只</title>
    <link rel="stylesheet" href="/static/css/layui.min.css">
    <link rel="stylesheet" href="/static/css/employee.css" type="text/css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../menu.ftl"/>
    <div class="layui-body">
        <div style="padding: 15px;">
            <div class="title"><span>管辖船只</span></div>
            <br/>
            <div class="ships">
                <ul data-num="0">
                    <#list ship as d>
                        <section class="ship">
                        <li class="shipinfo"><a title="${d.shipname}"><img src="/static/images/e_${d.shipid?c}.jpg" alt="${d.shipname}"
                                                          width="380" height="279"></a>
                            <div class="txt"><em>${d.shipname}</em>
                                <p>
                                    <#if d.shiptype==0>运输船</#if>
                                    <#if d.shiptype==1>工程船</#if>
                                    <#if d.shiptype==2>渔业船</#if>
                                    <#if d.shiptype==3>港务船</#if>
                                    <#if d.shiptype==4>海洋开发船</#if>
                                    <#if d.shiptype==5>其他</#if>
                                </p></div>
                        </li>
                        <li class="shipparts">
                            <div class="txt"><em>船只部件表</em>
                               </div>
                            <#list d.partList as part>
                                <div class="part" ><a href="/employee/taskDistribute/${part.taskid?c}"><i
                                            class="layui-icon">${part.partname}</i></a><br/></div>
                            </#list>
                        </li>
                        </section>
                    </#list>
                </ul>
            </div>
            <#--<table class="layui-table">
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
                    <th>船只名称</th>
                    <th>船只类型</th>
                    <th>船只状态</th>
                    <th>分配部件工作</th>
                    <th>预计价格（万元）</th>
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
                            <#list d.partList as part>
                                <a href="/employee/taskDistribute/${part.taskid?c}"><i class="layui-icon">${part.partname}</i></a><br/>
                            </#list>
                        </td>
                        <td>${d.price}</td>
                    </tr>
                </#list>
                </tbody>
            </table> -->
        </div>
    </div>
    <#include "../foot.ftl"/>
</div>
<script src="/static/js/layui.all.js"></script>
</body>
</html>