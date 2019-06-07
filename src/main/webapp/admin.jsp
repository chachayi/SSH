<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//获取项目当前路径
%>
<html>
<head>
    <title>首页</title>
    <base href="<%=basePath%>"/>

    <script src="<%=request.getContextPath() %>/static_all/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/static_all/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/static_all/js/admin_js.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/static_all/css/bootstrap.css">

    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

    <style>
        body{
            height:100%;
        }
        .left{
            width:30%;
            position:relative;
            margin-left:200px;
            margin-top:100px;
        }
        #leixingTable th,  #leixingTable td {
            text-align: center;
            vertical-align: middle!important;
        }
        .right{
            width: 60%;
            float: right;
            margin-top: 50px;
            left: 10px;
            position: relative;
        }
        #xinwenchakan,#xinwenfabu,#leixingchakan,#leixingfabu,#junshi,#yule{
            display: none;
        }
        table button{
            height:100%;
            width: 100%;
            background:#FFC!important;
            color:#300!important;
        }
        .error{
            color:red;
        }

        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {display: inline;}

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid blue;
            border-radius:3px;
        }
        .active{
            background-color: #7FFFAA!important;
        }

    </style>
    <script type="text/javascript">

        $().ready(function() {
            var statu = '<s:property value="categoryName"/>';
            var page = '1';
            if(statu==""){
                leixingchakan(page);
                fenye();
            }else{
                leixingfabu();
            }
        });

        $().ready(function() {
        $("#tijiao").validate();
            $("#leixingfabuTable").validate();
            $(":input").not(".submit").val("");
        });

        $.validator.setDefaults({//通过验证后运行的函数
            submitHandler: function() {
                if (confirm("确定发布吗")) {
                    return true;
                }else{
                    return false;
                }
            }
        });

        function lookjunshi(page) {
            $.post("shouye.action", {category_id: 1}, function (data) {
                $("#xinwenchakantbody").empty();
                var obj = eval(data);
                $(obj).each(function (index) {

                        var val = obj[index];
                        $("#xinwenchakantbody").append("<tr class=\"success\"><td>" + (index + 1) + "</td><td><a href=\"news/lookNewsInformationByTitle?title=" + val[0] + "\">" + val[0] + "</a></td><td>" + val[1] + "</td>" +
                            "<td><a href=\"news/other?title=" + val[0] + "&content="+val[3]+"&id="+val[2]+"\">修改</a>&nbsp<a href=\"news/deleteNews?id=" + val[2] +"\">删除</a></td></tr>");

                });
            });
            $("#leixingchakan").hide();
            $("#leixingfabu").hide();
            $("#xinwenfabu").hide();
            $("#xinwenchakan").show();
        }

    </script>
</head>

<body>
<h1 style="background-color: #2e6da4;text-align: center">这是管理员界面</h1>
<div class="right">
    <div id="leixingchakan">
        <table class="table table-striped table-bordered" id="leixingTable">
            <thead>
            <tr class="warning"><td colspan="3"><h3>类型</h3></td></tr>
            <tr class="active">
                <th>序号</th>
                <th>类型名</th>
            </tr>
            </thead>
            <tbody id="leixingtbody">
            </tbody>
        </table>
        <ul class="pagination"></ul>
        <input type="hidden" id="currentPage" name="currentPage" value="1"></input>
        <input type="hidden" id="totalPage" value="2"></input>
    </div>

    <div id="leixingfabu">
        <h3>发布新闻类型</h3>
        <form action="category/insertCategory" id="leixingfabuTable">
            <fieldset>
                类型名:<input type="text" name="categoryName" required/><br>
                <small style="color: red"><s:actionmessage/></small>
                <input type="submit" value="发布" class="submit">
                <input type="submit" value="发布" class="submit">
            </fieldset>
        </form>
    </div>



    <div id="xinwenfabu" style="font-weight: bold;color: #2b542c">
        <h3>发布新闻</h3>
        <s:form action="news/insertNews" id="tijiao">
        <fieldset>
            <table>
                <tr>
                    <td> 标题：</td>
                        <td>
                            <input type="text" name="title"  style="font-weight:bold" required minlength="2">
                           </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>类型：</td>
                    <td>
                        <select name="xinwenleixing" required >
                            <option value ="">--请选择类型--</option>
                            <option value ="军事">军事</option>
                            <option value="娱乐">娱乐</option>
                            <option value="教育">教育</option>
                            <option value="财经">财经</option>
                        </select>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>内容:</td>
                    <td>
                        <textarea  rows="10" cols="40" name="content"  style="font-weight: bold" minlength="10"></textarea>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="发布" class="submit" /></td>
                    <td><input type="submit" value="发布" class="submit" /></td>
                </tr>
            </table>
        </fieldset>
        </s:form>
    </div>

    <div id="xinwenchakan">
        <h3>查看新闻</h3>
        <table class="table table-striped table-bordered">
            <thead>
            <tr class="warning"><td colspan="3"><h3>结果如下</h3></td></tr>
            <tr class="active">
                <th>序号</th>
                <th>标题</th>
                <th>时间</th>
                <td>操作</td>
            </tr>
            </thead>
            <tbody id="xinwenchakantbody">
            </tbody>
            </table>
    </div>

</div>

<div class="left" align="center">
    <table class="table table-striped table-bordered">
        <thead>
        <tr class="active" style="background:red;width:100px">
            <th style="vertical-align:middle; text-align:center; color:blue;"><h4>类型管理</h4></th>
        </tr>
        </thead>
        <tbody>
        <tr class="success">
            <th>
                <button type="button" class="btn btn-primary leixingchakan" onclick="leixingchakan(1);">类型查看</button>
            </th>
        </tr>
        <tr class="info">
            <th><button type="button" class="btn btn-primary leixingfabu" onclick="leixingfabu();">类型发布</button></th>
        </tr>

        <tr class="active" style="background:red;width:100px">
            <th style="vertical-align:middle; text-align:center; color:blue;"><h4>新闻管理</h4></th>
        </tr>

        <tr class="danger">
            <th><button type="button" class="btn btn-primary xinwenfabu" onclick="xinwenfabu();">新闻发布</button></th>
        </tr>

        <tr>
            <th>
                <div class="btn-group">
                <button type="button" class="btn btn-primary xinwenchakan"
                        data-toggle="dropdown">
                    选择查看类型 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li class="divider"></li>
                    <li><a href="javascript:void(null);" onclick="lookjunshi(1);">军事类型</a></li>
                    <li><a href="javascript:void(null);" onclick="lookcaijing(1);">财经类型</a></li>
                    <li><a href="javascript:void(null);" onclick="lookjiaoyu(1);">教育类型</a></li>
                    <li><a href="javascript:void(null);"onclick="lookyule(1);">娱乐类型</a></li>
                </ul>
                </div>
            </th>
        </tr>
        </tbody>
    </table>
</div>



</body>
</html>
