<script src="/static/js/layui.all.js"></script>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
    function add(url){
        var d = {};
        var t = $('form').serializeArray();
        $.each(t, function() {
            d[this.name] = this.value;
        });
        var json=JSON.stringify(d);
        $.ajax({
            url:url,
            type:'post',
            data:json,
            contentType: "application/json;charset=utf-8",
            success:function(data){
                console.log(data.message);
                if(data.message=="已存在"||data.message=="该身份证已被注册或使用"||data.message=="没有员工可添加"){
                    layer.msg(data.message, {
                        time: 2000, //2s后自动关闭
                    });
                }
                else {
                    parent.location.reload();
                }
            },
            error:function (data) {
                layer.msg(data.message, {
                    time: 2000, //2s后自动关闭
                });
            }
        });
        return false
    }
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form;
        form.on('select(department)', function(data){
            var department=(data.value);
             $.ajax({
                 type: 'GET',
                 url: '/employee/'+department,
                 dataType:  'json',
                 success: function(data){
                     $("#employeeid").empty();
                     data=data.employees;
                    data.forEach(function(item){
                        var name=item.name;
                        console.log(name);
                        var id=item.id;
                        console.log(id);
                        $("#employeeid").append("<option value="+id+">"+name+"</option>");
                    });
                     form.render('select');
                 }
             });
        });

    });
</script>