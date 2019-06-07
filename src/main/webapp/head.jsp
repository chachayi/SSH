<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<head>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/static_all/css/shouye_css/layout.css" type="text/css" />
  <style>
    .font {
      font-size: 20px;
      color: darkblue;
      font-family:微软雅黑;
    }
    #error{
      color: red;
    }
  </style>
  <script>
      function check() {
          var text =   $("#neirong");
          var error = $("#error");
          if(trim(text.val())==""){
              error.html("");
              error.append("内容不能为空");
              return false;
          }
          return true;
      }
      function trim(str){ //删除左右两端的空格
          return str.replace(/(^\s*)|(\s*$)/g, "");
      }
  </script>
<title>首页头部</title>
</head>

<body>
<div class="wrapper">
  <div id="header">
    <div class="fl_left">
      <h1><a href="#"><strong>N</strong>ews <strong>M</strong>agazine</a></h1>
      <p>Free CSS Website Template</p>
    </div>
    <div class="fl_right"><a href="#"><img src="<%=request.getContextPath() %>/static_all/imgs/shouye_imgs/logo.jpg" alt="" /></a></div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li><a href="news/lookNewsListByCategory?category_id=1"><span class="font">军事</span></a></li>
        <li><a href="news/lookNewsListByCategory?category_id=2"><span class="font">财经</span></a></li>
        <li><a href="news/lookNewsListByCategory?category_id=3"><span class="font">教育</span></a></li>
        <li><a href="news/lookNewsListByCategory?category_id=4"><span class="font">娱乐</span></a>      </li>
        <li class="last"><a href="news/lookNewsListByCategory?category_id=5"><span class="font">科技</span></a></li>
      </ul>
    </div>
    <div id="search">
      <form action="news/searchNewsByTitle" method="post" id="sousuo" onsubmit="return check();">
        <input type="text" placeholder="请输入查找内容" name="title" id="neirong" />
        <input type="submit" id="go" value="Search" /><br>
      </form>
      <small id="error"></small>
    </div>
    <br class="clear" />
  </div>
</div>
</body>
</html>
