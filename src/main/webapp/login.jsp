<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//获取项目当前路径
%>
<html>
<head>
    <title>管理页面</title>
    <%--引入网页插件--%>
    <script src="<%=request.getContextPath() %>/static_all/js/jquery-3.3.1.min.js"></script>
    <link href="<%=request.getContextPath() %>/static_all/css/bootstrap.css" rel="stylesheet">
    <script src="<%=request.getContextPath() %>/static_all/js/bootstrap.min.js"></script>
</head>
<style>
    #from
    {
        background-color: #96b97d;
    }
    .mycenter
    {
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
        height: 350px;
        width: 500px;
        padding: 5%;
        padding-left: 5%;
        padding-right: 5%;
    }
    .mycenter mysign
    {
        width: 440px;
    }
    .mycenter input, checkbox, button
    {
        margin-top: 2%;
        margin-left: 10%;
        margin-right: 10%;
    }
    .mycheckbox
    {
        margin-top: 10px;
        margin-left: 40px;
        margin-bottom: 10px;
        height: 10px;
    }
</style>


</head>
<body>
<form id="from" method="post" action="<%=basePath%>user/login">
    <div class="mycenter">
        <div class="mysign">
            <div class="col-lg-11 text-center text-info">
                <h2>
                    用户登录</h2>
            </div>
            <div class="col-lg-10">
                <input type="text" class="form-control" name="name" placeholder="请输入账户名" required
                       autofocus />
            </div>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-10">
                <input type="password" class="form-control" name="pwd" placeholder="请输入密码" required
                       autofocus />
            </div>
            <div class="col-lg-10">
                <!--验证码-->
            </div>
            <div class="col-lg-10">
                <button type="submit" id="btn" class="btn btn-success col-lg-12">
                    登录</button>   <div style="color: red"><s:actionmessage/></div>
            </div>

        </div>
    </div>
</form>
</body>
</html>
