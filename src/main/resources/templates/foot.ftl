<script src="/static/js/layui.all.js"></script>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    function showAdd(url){
        layer.open({
            type: 2,
            title: '添加页面',
            closeBtn: 0,
            area:['800px','600px'],
            content: [url,'yes'],
            btn: ['取消'],
            yes: function(index){
                //事件
                layer.close(index);
            }
        });
    }
    function showEmp(url,id){
        layer.open({
            type: 2,
            title: '部门员工页面',
            closeBtn: 0,
            area:['1000px','600px'],
            content: [url+id,'yes'],
            btn: ['退出'],
            yes: function(index){
                //事件
                layer.close(index);
            }
        });
    }
    function showSup(url,id){
        layer.open({
            type: 2,
            title: '管理者页面',
            closeBtn: 0,
            area:['1000px','600px'],
            content: [url+id,'yes'],
            btn: ['退出'],
            yes: function(index){
                //事件
                layer.close(index);
            }
        });
    }
    function showPart(url,id){
        layer.open({
            type: 2,
            title: '部件页面',
            closeBtn: 0,
            area:['1000px','600px'],
            content: [url+id,'yes'],
            btn: ['退出'],
            yes: function(index){
                //事件
                layer.close(index);
            }
        });
    }
    function edit(url,id){
        layer.open({
            type: 2,
            title: '详情页面',
            closeBtn: 0,
            area:['800px','600px'],
            content: [url+id,'yes'],
            btn: ['取消'],
            yes: function(index){
                //事件
                layer.close(index);
            }
    });
    }
    function del(url,id) {
        layer.confirm('确认要删除吗？', {
            btn : [ '确定', '取消' ]//按钮
        }, function(index) {
            layer.close(index);
            console.log(id);
            $.ajax({
                url:url+id,
                type:'delete',
                success:function(data){
                    alert(data.message);
                    parent.location.reload();
                },
                error:function (data) {
                    layer.msg(data.message, {
                        time: 2000, //2s后自动关闭
                    });
                }
            });
        });
    }
</script>