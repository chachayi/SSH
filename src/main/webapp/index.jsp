<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="static_all/css/shouye_css/layout.css" type="text/css" />
    <script type="text/javascript" src="static_all/js/shouye_js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="static_all/js/shouye_js/jquery.timers.1.2.js"></script>
    <script type="text/javascript" src="static_all/js/shouye_js/jquery.galleryview.2.1.1.min.js"></script>
    <script type="text/javascript" src="static_all/js/shouye_js/jquery.galleryview.setup.js"></script>
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

</head>
<body id="top">
<div class="wrapper col0"></div>
<!-- ####################################################################################################### -->
<div class="wrapper">
    <div id="header">
        <div class="fl_left">
            <h1><a href="#"><strong>N</strong>ews <strong>W</strong>ebsite</a></h1>
            <p>欢迎访问</p>
        </div>
        <div class="fl_right"><a href="#"><img src="static_all/imgs/shouye_imgs/logo.jpg" alt="" /></a></div>
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
<!-- ####################################################################################################### -->
<div class="wrapper">
    <div class="container">
        <div class="content">
            <div id="featured_slide">
                <ul id="featurednews">
                    <li><img src="static_all/imgs/shouye_imgs/1.jpg" alt="" />
                        <div class="panel-overlay">
                            <h2>一分钟倒计时</h2>
                            <p>最新科技载具<br />
                                <a href="news/lookNewsInformationByTitle?title=魏江雷谈FE电动方程式 代表汽车未来技术趋势" target="_blank">--新闻详情&raquo;</a></p>
                        </div>
                    </li>
                    <li><img src="static_all/imgs/shouye_imgs/2.jpg" alt="" />
                        <div class="panel-overlay">
                            <h2>儿童教育</h2>
                            <p>如何对待犯错未成年人<br />
                                <a href="news/lookNewsInformationByTitle?title=对罪错未成年人保护过度？ 童建明：严管也要厚爱" target="_blank">--新闻详情&raquo;</a></p>
                        </div>
                    </li>
                    <li><img src="static_all/imgs/shouye_imgs/3.jpg" alt="" />
                        <div class="panel-overlay">
                            <h2>国际军事</h2>
                            <p>发言人代表发言<br />
                                <a href="news/lookNewsInformationByTitle?title=后沙月光 : 关键时刻，美国踹了印度一脚" target="_blank">--新闻详情&raquo;</a></p>
                        </div>
                    </li>
                    <li><img src="static_all/imgs/shouye_imgs/4.jpg" alt="" />
                        <div class="panel-overlay">
                            <h2>中国无人机</h2>
                            <p>记者照片录<br />
                                <a href="news/lookNewsInformationByTitle?title=中国无人机再次立功 炸毁苏制坦克 比美国捕食者还受欢迎" target="_blank">--新闻详情&raquo;</a></p>
                        </div>
                    </li>
                    <li><img src="static_all/imgs/shouye_imgs/5.jpg" alt="" />
                        <div class="panel-overlay">
                            <h2>举办教育</h2>
                            <p>方法总结<br />
                                <a href="做好加减法，淡定办教育" target="_blank">--新闻详情&raquo;</a></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="column">
            <ul class="latestnews">
                <li><img src="static_all/imgs/shouye_imgs/6.jpg" alt="" />
                    <p><strong><a href="news/lookNewsListByCategory?category_id=1">军事热榜</a></strong><br>
                        2019/2月军事新闻<br>
                        国际军事情况<br>最新武器制造<br>远东军事威胁<br>- - - - - ->
                    </p>
                </li>
                <li><img src="static_all/imgs/shouye_imgs/7.jpg" alt="" />
                    <p><strong><a href="news/lookNewsListByCategory?category_id=2">财经热榜</a></strong><br>
                        2019/2月财经新闻<br>
                        国家补贴<br>公司涨跌<br>股票涨跌<br>- - - - - ->
                    </p>
                </li>
                <li class="last"><img src="static_all/imgs/shouye_imgs/8.jpg" alt="" />
                    <p><strong><a href="news/lookNewsListByCategory?category_id=3">教育热榜</a></strong><br>
                        2019/2月教育新闻<br>
                        国际教育完善<br>国家教育改革<br>学校教育情况<br>- - - - - ->
                    </p>
                </li>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
    <div id="hpage_cats">
        <div class="fl_left">
            <h2><a href="news/lookNewsListByCategory?category_id=1">最新军事 &raquo;</a></h2>
            <img src="static_all/imgs/shouye_imgs/9.jpg" />
            <p><strong><a href="news/lookNewsInformationByTitle?title=麦克阿瑟头上的帽子，为啥是全世界独一无二的？" target="_blank">麦克阿瑟头上的帽子，为啥是全世界独一无二的？</a></strong></p>
            <p>麦克阿瑟在美国陆军当的最大的官，是陆军参谋长。1935年任职行将结束之际，他开始思考自己的未来。

                在美国陆军系统坐到这个位置上，基本就该转型了。要不，等待你的就是往下走，因为参谋长上面，就离总统不远了...

              </p>
        </div>
        <div class="fl_right">
            <h2><a href="news/lookNewsListByCategory?category_id=2">最新财经 &raquo;</a></h2>
            <img src="static_all/imgs/shouye_imgs/10.jpg" alt="" />
            <p><strong><a href="news/lookNewsInformationByTitle?title=浦银安盛与银河证券闹到金融法院 涉4000万回购违约" target="_blank">浦银安盛与银河证券闹到金融法院 涉4000万回购违约</a></strong></p>
            <p>
                　银河证券子公司产品回购违约 浦银安盛基金提交仲裁申请

                　2016年4月6日，银河证券签署《上海证券交易所债券质押式协议回购交易主协议》（以下简称《主协议》）。

                　2015年2月27日，浦银安盛基金在《主协议》适用资管、理财等产品的签署页上签章...
            </p>
        </div>
        <br class="clear" />
        <div class="fl_left">
            <h2><a href="news/lookNewsListByCategory?category_id=3">最新教育 &raquo;</a></h2>
            <img src="static_all/imgs/shouye_imgs/11.jpg" />
            <p><strong><a href="news/lookNewsInformationByTitle?title=教育部：严肃查处学术不端、招考弄虚作假等行为" target="_blank">教育部：严肃查处学术不端、招考弄虚作假等行为</a></strong></p>
            <p>
                中国教育报-中国教育新闻网讯（记者 高毅哲 方梦宇 采访整理）十三届全国人大二次会议５日上午９时在人民大会堂开幕，国务院总理李克强在向大会作政府工作报告时提出，加强科研伦理和学风建设，惩戒学术不端...
            </p>
        </div>
        <div class="fl_right">
            <h2><a href="news/lookNewsListByCategory?category_id=4">最新娱乐 &raquo;</a></h2>
            <img src="static_all/imgs/shouye_imgs/12.jpg" alt="" />
            <p><strong><a href="news/lookNewsInformationByTitle?title=胜利曾运营的拉面店发文致歉:将努力减少店主损失" target="_blank">胜利曾运营的拉面店发文致歉:将努力减少店主损失</a></strong></p>
            <p>新浪娱乐讯 据韩国媒体报道14日，胜利曾经营的某拉面店总店通过官方帐号表示对顾客们诚挚的歉意，同时胜利辞去代表职务，为了使加盟店安心地继续经营将会聘请专职经营人，并将根据事态发展追加对店主们的保护。另外，拉面店...
            </p>
        </div>
        <br class="clear" />
    </div>
</div>

<div class="wrapper col8">
    <div id="copyright">
        <p class="fl_left">本网页为虚构 &copy; 2019-1-21 - <a href="#">叉叉熠制作</a></p>
        <p class="fl_right"> 该模板原为网上下载经修改后使用</p><br>
    </div>
</div>
</body>
</html>