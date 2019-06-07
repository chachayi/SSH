<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="static_all/css/bootstrap.css">
    <script src="static_all/js/jquery-3.3.1.min.js"></script>
    <script src="static_all/js/bootstrap.min.js"></script>
    <script src="static_all/js/shouye_js.js"></script>
    <style>
        body{
            height:100%;
        }
        table th, table td {
            text-align: center;
            vertical-align: middle!important;
        }
        .left{
            width:40%;
            position:relative;
            margin-left:460px;
            margin-top:100px;
        }
        .right{
            width: 60%;
            float: right;
            position: relative;
            margin-top:-300px;
            padding-left: 100px;
        }
        table button{
            height:100%;
            width: 100%;
            background:#FFC!important;
            color:#300!important;
        }
        #junshi,#yule,#caijing,#jiaoyu,#sousuo,#zhuxiao,#denglu{
            display: none;
        }
        .search{
            margin-top:100px;
            margin-left:35%;
        }
        input{
            width:auto!important;
        }
        #zhuxiao,#denglu{
            float: right;
            position: relative;
            margin-right: 100px;
            margin-top:-70px ;
        }
        .user{
            float:left;
            color: #2e6da4;
            position: relative;
            margin-top:-70px;
            margin-left: 50px;
        }

    </style>
<script>
    window.onload = function()  {
        var name = '<%=session.getAttribute("name")%>';
        var page = '1';
        if(name != 'null'){
            $("#zhuxiao").show();
            $(".user").append("<h3>欢迎"+name+"</h3>");
        }else{
            $("#denglu").show();
        }
        lookjunshi(page);
    };
    <!--搜索框-->
    function search(){
        var shuju = $("#neirong").val();

        if(shuju==""){
            $("#neirong").attr("placeholder","搜索内容不能为空");
            return null;
        }
        if($(".success.cunzai").length > 0) {
            //元素存在时执行的代码
            $(".success.cunzai").remove();
        }
        if($("#neirong").attr("type")=="date") {
            var panduan = true;
            $.post("lookNewsInformationByTime", {date: shuju}, function (data) {
                var obj = eval(data);//eval执行语句，返回json对象
                $(obj).each(function (index) {
                    var val = obj[index];
                    $("#sousuo").append("<tr class=\"success cunzai\"><td>" + (index + 1) + "</td><td><a href=\"news/lookNewsInformationByTitle?title="+val[0]+"\">"+val[0]+"</a></td><td>" + val[1] + "</td></tr>");
                    panduan = false;
                });
                if(panduan){
                    $("#sousuo").append("<tr class=\"success cunzai\"><td colspan='3'>" + "暂无数据" + "</td></tr>");
                }
            });
        }else{
            var panduan = true;
            $.post("lookNewsInformationByTitle", {title: shuju}, function (data) {
                var obj = eval(data);
                $(obj).each(function (index) {
                    var val = obj[index];
                    $("#sousuo").append("<tr class=\"success cunzai\" ><td>" + (index + 1) + "</td><td><a href=\"news/lookNewsInformationByTitle?title="+val[0]+"\">"+val[0]+"</a></td><td>" + val[1] + "</td></tr>");
                    panduan= false;
                });
                if(panduan){
                    $("#sousuo").append("<tr class=\"success cunzai\"><td colspan='3'>" + "暂无数据" + "</td></tr>");
                }
            });
        }
        $("#junshi").hide();
        $("#jiaoyu").hide();
        $("#caijing").hide();
        $("#yule").hide();
        $("#sousuo").show();
    }

    function lookjunshi(page) {
        $("#totalPage").val(2);
        $(".pagination").empty();
            $.post("shouye.action", {category_id: 1}, function (data) {
                $("#junshitbody").empty();
                var obj = eval(data);
                $(obj).each(function (index) {
                    if (index >= (6 * (page - 1)) && index < 6 * page) {
                        var val = obj[index];
                        $("#junshitbody").append("<tr class=\"success\"><td>" + (index + 1) + "</td><td><a href=\"news/lookNewsInformationByTitle?title=" + val[0] + "\">" + val[0] + "</a></td><td>" + val[1] + "</td></tr>");
                    }
                });
            });
        fenye("junshi");
        $("#yule").hide();
        $("#jiaoyu").hide();
        $("#caijing").hide();
        $("#sousuo").hide();
        $("#junshi").show();
    }
    function lookyule(page) {
     $("#totalPage").val(1);
        $(".pagination").empty();
        fenye("yule");
            $.post("shouye.action", { category_id: 4}, function (data) {
                $("#yuletbody").empty();
                var obj = eval(data);
                $(obj).each(function (index) {
                    if (index>=(6*(page-1))&&index < 6*page) {
                        var val = obj[index];
                        $("#yuletbody").append("<tr class=\"success\"><td>" + (index + 1) + "</td><td><a href=\"news/lookNewsInformationByTitle?title=" + val[0] + "\">" + val[0] + "</a></td><td>" + val[1] + "</td></tr>");
                    }
                });
            });

        $("#junshi").hide();
        $("#jiaoyu").hide();
        $("#caijing").hide();
        $("#sousuo").hide();
        $("#yule").show();
    }
    function lookcaijing(page) {
        $(".pagination").empty();
        $("#totalPage").val(1);
            $.post("shouye.action", { category_id: 2}, function (data) {
                $("#caijingtbody").empty();
                var obj = eval(data);
                $(obj).each(function (index) {
                    if (index>=(6*(page-1))&&index < 6*page) {
                        var val = obj[index];
                        $("#caijingtbody").append("<tr class=\"success\"><td>" + (index + 1) + "</td><td><a href=\"news/lookNewsInformationByTitle?title=" + val[0] + "\">" + val[0] + "</a></td><td>" + val[1] + "</td></tr>");

                    }
                });
            });
        fenye("caijing");
        $("#junshi").hide();
        $("#jiaoyu").hide();
        $("#yule").hide();
        $("#sousuo").hide();
        $("#caijing").show();
    }
    function lookjiaoyu(page) {
        $(".pagination").empty();
        $("#totalPage").val(1);
            $.post("shouye.action", { category_id: 3}, function (data) {
                $("#jiaoyutbody").empty();
                var obj = eval(data);
                $(obj).each(function (index) {
                    if (index>=(6*(page-1))&&index < 6*page) {
                        var val = obj[index];
                        $("#jiaoyutbody").append("<tr class=\"success\"><td>" + (index + 1) + "</td><td><a href=\"news/lookNewsInformationByTitle?title=" + val[0] + "\">" + val[0] + "</a></td><td>" + val[1] + "</td></tr>");
                    }
                });
            });
        fenye("jiaoyu");
        $("#junshi").hide();
        $("#yule").hide();
        $("#caijing").hide();
        $("#sousuo").hide();
        $("#jiaoyu").show();
    }
    function fenye(leixing) {
        var curPage =$("#currentPage").val();
        var last =$("#totalPage").val();
        var page =Math.ceil(curPage/10);

        //调用绘制分页样式函数
        draw(page,curPage);

        //绑定点击页码事件
        $(document).on("click",".pagination li a",function(){
            var str =$(this).html();
            if(leixing=="junshi"){
                lookjunshi(str);
            }
            else if(leixing=="caijing"){
                lookcaijing(str);
            }
            else if(leixing=="yule"){
                lookyule(str);
            }else {
                lookjiaoyu(str);
            }

            if(!isNaN(str)){
                //移除之前的active
                $(".pagination li a").removeClass("active");
                $(this).attr("class","active");
                $("#currentPage").val(str);
            }
        });

        //绑定下一页点击事件
        $(document).on("click","#n",function(){
            var num =$(".active").html();
            var curPage =$("#currentPage").val();
            var last =$("#totalPage").val();
            var page =Math.ceil((parseInt(num))/10);
            if(num < page*10 && num != last){
                //移除之前的active
                $(".pagination li a").removeClass("active");
                $("#"+(parseInt(num)+1)+"").attr("class","active");
                //$(".pagination li a[text="+(parseInt(num)+1)+"]").attr("class","active");//jQ1.6支持
                $("#currentPage").val(parseInt(num)+1);
            }else if(num == page*10 && num != last){
                //清空之前的数据
                $(".pagination").html("");
                draw(page+1,(parseInt(num)+1));
            }
        })

        //绑定上一页点击事件
        $(document).on("click","#p",function(){
            var num =$(".active").html();
            var curPage =$("#currentPage").val();
            var last =$("#totalPage").val();
            var page =Math.ceil((parseInt(num))/10);
            if(num <= page*10 && num != (page-1)*10+1){
                //移除之前的active
                $(".pagination li a").removeClass("active");
                $("#"+(parseInt(num)-1)+"").attr("class","active");
                //$(".pagination li a[text="+(parseInt(num)+1)+"]").attr("class","active");//jQ1.6支持
                $("#currentPage").val(parseInt(num)-1);
            }else if(num == (page-1)*10+1 && num != 1){
                //清空之前的数据
                $(".pagination").html("");
                draw(page-1,(parseInt(num)-1));
            }
        })

        //绘制页面分页样式
        function draw(page,curPage){
            //页面中的当前页
            var page =page;
            //后台传过来的页数
            var curPage = curPage;
            //后台传过来的总页数
            var datas =$("#totalPage").val();
            //每页显示多少条数据
            var pageSize =10;
            //在网页中一共要分多少页
            var totalPage = Math.floor((datas-1)/pageSize+1);

            var liStr ="<li><a id='previousPage' href='javascript:return false;' >«</a></li>";
            $("#currentPage").val(curPage);
            if(page <= totalPage){
                if(datas <= 10){
                    for(i=1; i<=datas; i++){
                        //为当前页增加样式
                        var active ="";
                        if(i==curPage){
                            active=" class='active' ";
                        }
                        liStr +=" <li><a id="+i+" "+active+" href='javascript:void(null);'>"+i+"</a></li>"
                    }
                }else{
                    var start =pageSize*(page-1)+1;
                    var end =page*pageSize;
                    if(page == totalPage){
                        for(i=start; i<=datas; i++){
                            //为当前页增加样式
                            var active ="";
                            if(i==curPage){
                                active=" class='active' ";
                            }
                            liStr +=" <li><a id="+i+" "+active+" href='javascript:void(null);'>"+i+"</a></li>"
                        }
                    }else{
                        for(i=start; i<=end; i++){
                            //为当前页增加样式
                            var active ="";
                            if(i==curPage){
                                active=" class='active' ";
                            }
                            liStr +=" <li><a id="+i+" "+active+" href='javascript:void(null);'>"+i+"</a></li>"
                        }
                    }
                }
            }
            liStr +="<li><a href='javascript:return false;' id='hou'>»</a></li>";
            $(".pagination").append(liStr);
        }
    }

</script>

</head>

<body>
<!--登陆注销-->

<div id="zhuxiao"><a href="" onclick="tanchukuang()"><b>注销</b></a></div>
<div id="denglu"><a href="login.jsp"><b>登陆</b></a> &nbsp;<a href=""><b>注册</b></a></div>
    <div class="user">

    </div>

<!-- 搜索框-->
<div class="search">
    <div class="row">
        <div class="col-lg-6">
            <div class="input-group">
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <b id="fangshi1">新闻标题</b>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="divider"></li>
                        <li><a href="javascript:void(null);" onClick="change();" id="fangshi2"><b>新闻发布时间</b></a></li>
                    </ul>
                </div><!-- /btn-group -->
                <input type="text" class="form-control" id="neirong" max="2018-12-25" required>
                <input type="button" class="btn btn-primary"  value="搜索" onclick="search();" id="last">
            </div><!-- /Shuru-group -->
        </div><!-- /.col-lg-6 --><br>
    </div><!-- /.row -->
</div>

<!-- 新闻类型-->
<div class="left">
    <table class="table table-striped table-bordered">
        <thead>
        <tr class="active">
            <th>新闻类型</th>
        </tr>
        </thead>
        <tbody>
        <tr class="success" >
            <th>
                <button type="button" class="btn btn-primary" onclick="lookjunshi(1);">军事</button>
            </th>
        </tr>
        <tr class="info">

            <th><button type="button" class="btn btn-primary" onclick="lookyule(1);">娱乐</button></th>
        </tr>
        <tr class="warning">

            <th><button type="button" class="btn btn-primary" onclick="lookjiaoyu(1);">教育</button></th>
        </tr>
        <tr class="danger">

            <th><button type="button" class="btn btn-primary" onclick="lookcaijing(1);">财经</button></th>
        </tr>
        </tbody>
    </table>
</div>
<!-- 新闻具体内容-->
<div class="right">
    <table class="table table-striped table-bordered" id="sousuo">
        <thead>
        <tr class="warning"><td colspan="3"><h3>结果如下</h3></td></tr>
        <tr class="active">
            <th>序号</th>
            <th>标题</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

   <div id="junshi">
    <table class="table table-striped table-bordered">
        <thead>
        <tr class="warning"><td colspan="3"><h3>军事新闻</h3></td></tr>
        <tr class="active">
            <th>序号</th>
            <th>标题</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody id="junshitbody">
        </tbody>
    </table>
 <ul class="pagination"></ul>
   </div>

    <div id="yule">
    <table class="table table-striped table-bordered">
        <thead>
        <tr class="warning"><td colspan="3"><h3>娱乐新闻</h3></td></tr>
        <tr class="active">
            <th>序号</th>
            <th>标题</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody id="yuletbody">
        </tbody>
    </table>
    <ul class="pagination"></ul>
    </div>

    <div id="jiaoyu">
    <table class="table table-striped table-bordered">
        <thead>
        <tr class="warning"><td colspan="3"><h3>教育新闻</h3></td></tr>
        <tr class="active">
            <th>序号</th>
            <th>标题</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody id="jiaoyutbody">
        </tbody>
    </table>
    <ul class="pagination"></ul>
</div>

<div id="caijing">
    <table class="table table-striped table-bordered">
        <thead>
        <tr class="warning"><td colspan="3"><h3>财经新闻</h3></td></tr>
        <tr class="active">
            <th>序号</th>
            <th>标题</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody id="caijingtbody">
        </tbody>
    </table>
    <ul class="pagination"></ul>
</div>
</div>
<input type="hidden" id="currentPage" name="currentPage" value="1"></input>
<input type="hidden" id="totalPage" value="2"></input>
</body>
</html>
