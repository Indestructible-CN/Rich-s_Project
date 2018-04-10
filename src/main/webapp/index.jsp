<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script src="Scripts/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->    
    <script type="text/javascript" src="Scripts/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="Scripts/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Scripts/menu.js"></script>    
        
	<script type="text/javascript" src="Scripts/select.js"></script>
    
	<script type="text/javascript" src="Scripts/lrscroll.js"></script>
    
    <script type="text/javascript" src="Scripts/iban.js"></script>
    <script type="text/javascript" src="Scripts/fban.js"></script>
    <script type="text/javascript" src="Scripts/f_ban.js"></script>
    <script type="text/javascript" src="Scripts/mban.js"></script>
    <script type="text/javascript" src="Scripts/bban.js"></script>
    <script type="text/javascript" src="Scripts/hban.js"></script>
    <script type="text/javascript" src="Scripts/tban.js"></script>
    
	<script type="text/javascript" src="Scripts/lrscroll_1.js"></script>
    
    
<title>邛崃市云联惠</title>
<meta name="keywords" content="四川邛崃市,云联惠,四川省,邛崃市,便捷,信息一览,商家入驻" />
<meta name="description" content="四川省 邛崃市云联惠" />

<script type="text/javascript">
 	window.onload = function(){
 		$.ajax({
 			type : "POST",//方法类型
 			dataType : "JSON",//预期服务器返回的数据类型
		 	async: false,
 			url : "rtStoreTypeService/doInsertInit.do",//url
 			success : function(result) {
 				$.each(result, function(i, dom) {
 					if(i<9){
 						$("#spanEr").append(
 								"<li>"+
 		                    	"<div class='fj'  onclick='searchJump(this);' >"+
 		                        	"<span id='"+dom.id+"' class='n_img'><span></span><img src='Picture/nav6.png' /></span>"+
 		                            "<span class='fl'>"+dom.typeName+"</span>"+
 		                        "</div>"+
 		                    "</li>");
 					}
 				});
 				$("#spanEr").append(
 						"<li>"+
 	                	"<div class='fj'  onclick='searchJump(this);' >"+
 	                    	"<span id='all' class='n_img'><span></span><img src='Picture/nav6.png' /></span>"+
 	                        "<span class='fl'>更多分类</span>"+
 	                    "</div>"+
 	                "</li>");
 			},
 			error : function(result) {
 				alert("初始化失败！");
 			}
 		});
 		// 公告
 		$.ajax({
			type : "POST",//方法类型
			dataType : "JSON",//预期服务器返回的数据类型
			async: false,
			url : "commonController/selectNotice.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					if(i == 0){
						$("#notice1").html(dom);
					}
					if(i == 1){
						$("#notice2").html(dom);
					}
				});
			},
			error : function(result) {
				alert("获取失败！");
			}
		});
 		$.ajax({
			type : "POST",//方法类型
			dataType : "JSON",//预期服务器返回的数据类型
			async: false,
			url : "etStoreInfoService/indexInit.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					$.each(dom.listTop, function(index, top) {
						$("#listTop").append("<li style='width:238px;'>"+
			                	"<div class='name'><a href='pages/Details.jsp?sId="+top.id+"'>"+top.storeName+"</a></div>"+
			                    "<div class='price'>"+
			                    "</div>"+
			                    "<div class='img'><a href='pages/Details.jsp?sId="+top.id+"'><img src='Picture/"+top.storeImg.split(",")[0]+"' width='185' height='155' /></a></div>");
					});
					$.each(dom.listTime, function(index, time) {
						$("#listTime").append("<li style='width:238px;'>"+
			                	"<div class='name'><a href='pages/Details.jsp?sId="+time.id+"'>"+time.storeName+"</a></div>"+
			                    "<div class='price'>"+
			                    "</div>"+
			                    "<div class='img'><a href='pages/Details.jsp?sId="+time.id+"'><img src='Picture/"+time.storeImg.split(",")[0]+"' width='185' height='155' /></a></div>");					
					});
				});
			},
			error : function(result) {
				alert("获取失败！");
			}
		});
 	}
 	function searchJump(obj) {
 		window.location.href="pages/Search.jsp?sId="+$(obj).children().first().attr('id');
 	}
 	function searchJump1() {
 		window.location.href="pages/Search.jsp?sId=all&storeName="+$("#storeName").val();
 	}
 </script>
</head>
<body>  
<!--Begin Header Begin-->

<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，管理员请 <a href="pages/Login.jsp">登录</a></span>
        </span>
    </div>
</div>
<div class="top">
    <div class="logo"><img src="Picture/logo.png" /></div>
    <div class="search">
        	<input id="storeName" type="text" value="" class="s_ipt" />
            <input type="button" onclick="searchJump1();" value="搜索" class="s_btn" />
    </div>
</div>
<!--End Header End--> 
<!--Begin Menu Begin-->
<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav">
                <ul id="spanEr">           	
                </ul>            
            </div>
        </div>  
        <ul class="menu_r">                                                                                                                                               
        	<li style="width:100%;"><marquee direction="left" style="word-wrap:break-word;line-height:50px;  color:red; margin-left:50px; width:90%;overflow:hidden;" id="notice2"></marquee></li>
        </ul>
        <div class="m_ad">欢迎！</div>
    </div>
</div>
<!--End Menu End--> 
<div class="i_bg bg_color">
	<div class="i_ban_bg">
		<!--Begin Banner Begin-->
    	<div class="banner">    	
            <div class="top_slide_wrap">
                <ul class="slide_box bxslider">
                    <li><img src="Picture/de2.jpg" width="740" height="401" /></li>
                    <li><img src="Picture/ban1.jpg" width="740" height="401" /></li> 
                    <li><img src="Picture/ban1.jpg" width="740" height="401" /></li> 
                </ul>	
                <div class="op_btns clearfix">
                    <a href="#" class="op_btn op_prev"><span></span></a>
                    <a href="#" class="op_btn op_next"><span></span></a>
                </div>        
            </div>
        </div>
        <script type="text/javascript">
        //var jq = jQuery.noConflict();
        (function(){
            $(".bxslider").bxSlider({
                auto:true,
                prevSelector:jq(".top_slide_wrap .op_prev")[0],nextSelector:jq(".top_slide_wrap .op_next")[0]
            });
        })();
        </script>
        <!--End Banner End-->
        <div class="inews">
        	<div class="news_t" style="background-color: #FF4E00; color: white;">
            	<span class="fr"><a href="#"> ></a></span>公告
            </div>
            <div style="margin: 4px; height: 260px;" id="notice1"></div>
            <div style="margin: 0px; height:91px; color: white; font: 15px; background-color:#FF4E00; ">　　我们的服务热线：4000-5555</div>
        </div>
    </div>
    
	<!--Begin 进口 生鲜 Begin-->
    <div class="i_t mar_10">
    	<span class="floor_num">1F</span>
    	<span class="fl">精选商家</span>                
    </div>
    <div class="content">
        <div class="fresh_mid" style="width:1200px;">
        	<ul id="listTop">
            </ul>
        </div>
        
    </div>    
    <!--End 进口 生鲜 End-->
    <!--Begin 进口 生鲜 Begin-->
    <div class="i_t mar_10">
    	<span class="floor_num">2F</span>
    	<span class="fl">新入住商家</span>                
    </div>
    <div class="content">
        <div class="fresh_mid" style="width:1200px;">
        	<ul id="listTime">
            </ul>
        </div>
        
    </div>    
    <!--End 进口 生鲜 End-->
    
    
      
    <!--Begin Footer Begin -->
	    <div class="b_btm_bg b_btm_c">
	        <div class="b_btm">
	            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"><img src="Picture/b1.png" width="62" height="62" /></td>
	                <td><h2>商家信息真实</h2>正规商家 值得信赖 </td>
	              </tr>
	            </table>
				
	            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"><img src="Picture/b3.png" width="62" height="62" /></td>
	                <td><h2>商家高入驻</h2>各种品类一应俱全</td>
	              </tr>
	            </table>
	            
	            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"><img src="Picture/b4.png" width="62" height="62" /></td>
	                <td><h2>了解商家位置</h2>省去问路时间</td>
	              </tr>
	            </table>
	            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:20px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"></td>
	                <td><h2>联系我们</h2>Tel：400-400-400</td>
	              </tr>
	              <tr>
	                <td width="72"></td>
	                <td>邛崃市云联惠</td>
	              </tr>
	            </table>
	        </div>
	    </div>
		<div class="btmbg">
			<div class="btm">
	        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2017-2018 邛崃市云联惠 All Rights Reserved. 复制必究 <br />
	        </div>    	
	    </div>
    <!--End Footer End -->    
</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>