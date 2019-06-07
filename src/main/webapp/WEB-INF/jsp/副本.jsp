<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
.box{
	left:10px;
	width:65%;
	position:relative;
	
	float:left;
}
.left_box{
	width:20%;
	float:left;
	margin-left:90px;
	position:relative;
}
	
.start{
	width:100%;
	background-color:#E0FFFF;
	color:#C36;
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
img{
	margin-left:90px;
	margin-top:0px;
	}
	
</style>
</head>
<body>
<iframe MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no src="<%=request.getContextPath() %>/head.html" height="25%" width="100%"></iframe>
<div class="box">
<div class="start">最新新闻</div><br>

<div class="list">
<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div><br>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
</div>

<div class="list">
<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div><br>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
</div>

<div class="list">
<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div><br>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
</div>

<div class="list">
<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div><br>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
</div>
</div>

<div class="left_box">
<b><span class="left_text">|</span> 点击排行</b><br><br>
<span class="left_text">1</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">2</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">3</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">4</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">5</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">6</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">7</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">8</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">9</span> 全国人大代表、安徽省农科院副院<br><br>
<span class="left_text">10</span> 全国人大代表、安徽省农科院副院<br><br>
</div>
<img src="<%=request.getContextPath() %>/static_all/imgs/new_list_imgs/hua.jpg" width="25%" height="42%">
</body>
</html>
