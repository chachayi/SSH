<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/head.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//获取项目当前路径
%>

<html>
<head>
<title>新闻列表</title>
    <base href="<%=basePath%>"/> <!--//链接基础路径（防止news重复)-->
 <script src="<%=request.getContextPath() %>/static_all/js/jquery-3.3.1.min.js"></script>
<style>
body{
	height:100%;
}
a:link{text-decoration:none ; }
a:visited {text-decoration:none ; color:coral;}

.box{
    top:10px;
	left:10px;
	width:65%;
	position:relative;
	float:left;
}
.right_box{
	width:20%;
	float:left;
    top:10px;
	margin-left:90px;
	position:relative;
    overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
}
.neirong{  /*多余字体不显示*/
    text-overflow:ellipsis;
    height: 30px;
    overflow:hidden;
    white-space:nowrap;
}
.start{
	width:100%;
	background-color:#E0FFFF;
    height: 35px;
	color:#C36;
    line-height:32px;/*所在行高度*/
}
.list{
	width:100%;
}
.dibu{
	color:#CCC;
	font-size:12px;
}
.shangbu{
	font-size:20px;
	font-weight:bold
}
.left_text{
	color:#99F;
}
.huahua{
    left: -300px;
    position: relative;
	}
</style>
</head>
<body>
<div class="box">
<div class="start">最新新闻</div><br>

<s:iterator value="list" status= "index"><!--遍历list-->
<div class="list">
<div class="shangbu"><a href="news/lookNewsInformationByTitle?title=<s:property value="list[#index.index][0]"/>" target="_blank"><s:property value="list[#index.index][0]"/></a></div><br>
<div class="neirong"><s:property value="list[#index.index][2]"/></div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: <s:property value="list[#index.index][1]"/></div><br>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
</div>
</s:iterator>
</div>

<div class="right_box">
<b><span class="left_text">|</span> 点击排行</b><br><br>
<s:iterator value="#session.newsFrequency" status= "index"><!--遍历list-->
    <span class="left_text"><s:property value="#index.index+1"/></span> &nbsp;
    <a href="news/lookNewsInformationByTitle?title=<s:property value="#session.newsFrequency[#index.index][0]"/>">
    <s:property value="#session.newsFrequency[#index.index][0]"/>
    </a>
    <br><br>
    </s:iterator>
    <div class="huahua"> <img src="<%=request.getContextPath() %>/static_all/imgs/new_list_imgs/hua.jpg" width="100%" height="50%"></div>

</div>
</body>
</html>
