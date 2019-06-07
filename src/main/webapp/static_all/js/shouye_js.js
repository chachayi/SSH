
var yule = true;
var junshi = true;
var jiaoyu = true;
var caijing = true;

function tanchukuang(){
    if(confirm("确定注销吗")){
        $.post("user/zhuxiao");
    }else {
        return false;
    }
}


function change(){
    if($("#fangshi2").text() == "新闻发布时间"){
        $("#fangshi1").html("新闻发布时间");
        $("#fangshi2").text("新闻标题");
        $("#neirong").attr("type","date");
        $("#neirong").val("").focus();
    }
    else{
        $("#fangshi2").html("新闻发布时间");
        $("#fangshi1").text("新闻标题");
        $("#neirong").attr("type","text");
        $("#neirong").val("").focus();
    }
}


