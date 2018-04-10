<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
    <!--[if IE 6]>
    <script src="../Scripts/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
    <script type="text/javascript" src="../Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/menu.js"></script>    
	<script type="text/javascript" src="../Scripts/lrscroll_1.js"></script>
	<script type="text/javascript" src="../Scripts/n_nav.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>
<title>邛崃市云联惠</title>
<script>
window.onload = function() {
	$.ajax({
		type : "POST",//方法类型
		dataType : "JSON",//预期服务器返回的数据类型
		url : "../rtStoreTypeService/doInsertInit.do",//url
		success : function(result) {
			$.each(result, function(i, dom) {
				if(i<9){
					$("#spanEr").append(
							"<li>"+
	                    	"<div class='fj'  onclick='searchJump(this);' >"+
	                        	"<span id='"+dom.id+"' class='n_img'><span></span><img src='../Picture/nav6.png' /></span>"+
	                            "<span class='fl'>"+dom.typeName+"</span>"+
	                        "</div>"+
	                    "</li>");
				}
			});
			$("#spanEr").append(
					"<li>"+
                	"<div class='fj'  onclick='searchJump(this);' >"+
                    	"<span id='all' class='n_img'><span></span><img src='../Picture/nav6.png' /></span>"+
                        "<span class='fl'>更多分类</span>"+
                    "</div>"+
                "</li>");
		},
		error : function(result) {
			alert("初始化失败！");
		}
	});
	
	$.ajax({
		type : "POST",//方法类型
		dataType : "JSON",//预期服务器返回的数据类型
		url : "../commonController/selectNotice.do",//url
		success : function(result) {
			$.each(result, function(i, dom) {
				if(i == 1){
					$("#notice2").html(dom);
				}
			});
		},
		error : function(result) {
			alert("获取公告失败！");
		}
	});
}

function searchJump(obj) {
	alert($(obj).children().first().attr('id'));
}
</script>
</head>
<body>
<!--Begin Menu Begin-->
<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav none">
                <ul class="font_white" id="spanEr">
                </ul>            
            </div>
        </div>  
        <!--End 商品分类详情 End-->                                                     
    	<ul class="menu_r">                                                                                                                                               
        	<li><a href="../index.jsp">首页</a></li>
            <li style="width:80%;"><marquee direction="left" style="word-wrap:break-word;line-height:50px;  color:red; margin-left:50px; width:90%;overflow:hidden;" id="notice2"></marquee></li>
        </ul>
        <div class="m_ad">欢迎！</div>
    </div>
</div>
<!--End Menu End--> 
</body>
</html>