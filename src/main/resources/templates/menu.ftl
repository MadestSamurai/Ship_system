<div class="layui-header">
    <div class="layui-logo"><span style="display: none">欢迎进入</span>船舶生产系统<span <#if login.role!=1>style="display:none"</#if>>后台管理</span></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item" <#if login.role!=1>style="display:none"</#if>>
            <a href="javascript:">系统管理</a>
            <dl class="layui-nav-child">
                <dd><a href="/admin/employeeManage">员工管理</a></dd>
                <dd><a href="/admin/departmentManage">部门管理</a></dd>
                <dd><a href="/admin/shipManage">船只管理</a></dd>
                <dd><a href="/admin/partManage">部件管理</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item" <#if login.role!=1>style="display:none"</#if>><a href="/admin/appointmentManage">订单管理</a></li>
        <li class="layui-nav-item" <#if login.role!=1>style="display:none"</#if>><a href="/admin/ordersideManage">订方信息管理</a></li>
        <li class="layui-nav-item" <#if login.role!=1>style="display:none"</#if>><a href="/admin/progressManage">生产任务信息管理</a></li>
        <#-- <li class="layui-nav-item" <#if login.role!=1>style="display:none"</#if>><a href="/admin/adminManage">管理员管理</a></li>-->

        <li class="layui-nav-item" <#if login.role!=2 || userinfo.expert!=0>style="display:none"</#if>><a href="/employee/workerList">查看管辖员工</a></li>
        <li class="layui-nav-item" <#if login.role!=2 || userinfo.expert!=0>style="display:none"</#if>><a href="/employee/shipList">查看管辖船只</a></li>
        <li class="layui-nav-item" <#if login.role!=2 || userinfo.expert!=1>style="display:none"</#if>><a href="/employee/taskList">查看任务信息</a></li>
        <li class="layui-nav-item" <#if login.role!=2>style="display:none"</#if>><a href="/employee/infoEdit">修改个人信息</a></li>


        <li class="layui-nav-item" <#if login.role!=3>style="display:none"</#if>><a href="/orderside/progress">订单信息</a></li>
        <li class="layui-nav-item" <#if login.role!=3>style="display:none"</#if>><a href="/orderside/appointment">预约订单</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:">
                欢迎&nbsp;&nbsp;&nbsp;&nbsp;${login.username}
            </a>
        </li>
        <li class="layui-nav-item"><a href="/logout">退出登录</a></li>
    </ul>
</div>