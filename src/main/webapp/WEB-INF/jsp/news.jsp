<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>新闻标题</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static_all/css/bootstrap.css" type="text/css"/><!--web-inf的jsp访问外部css-->
    <style>
        body{
            height:100%;
        }
        .neirong{
            width:40%;
            letter-spacing: 5px;
            text-indent:2em;
            margin:0 auto;
            text-align:left;
        }
    </style>
</head>
<body>
<div class="lead neirong">
    <h2><s:property value="list[0][0]"/> <small>
        <br><s:property value="list[0][1]"/></small></h2><br>
        &nbsp;<s:property value="list[0][2]"/>
       <br>
<img src="<%=request.getContextPath() %>/static_all/imgs/news_imgs/<s:property value="list[0][4]"/>.jpg" width="600px" height="400px">
</div>
<br>
</body>
</html>
