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
    
<title>邛崃市云联惠</title>
<script>
$(document).ready(function(){
	var str = "<%=session.getAttribute("adminlogin")%>";
	if(str == null || str == "" || str == "null"){
		alert("登录超时 即将跳转至登录页面");
		<% 
		session.removeAttribute("errormessage"); 
		session.removeAttribute("adminlogin");
		%>
		window.location.href="../pages/Login.jsp";
	}
	
});
</script>
</head>
<body>  
<jsp:include page="header.jsp"></jsp:include>
<!--Begin Menu Begin-->
<jsp:include page="header2.jsp"></jsp:include>
<!--End Menu End--> 
<div class="i_bg">
	<div class="postion">
    	<span class="fl">全部 > </span>
        <span class="n_ch">
            <span class="fl"><font>火锅</font></span>
            <a href="#"><img src="../Picture/s_close.gif" /></a>
        </span>
    </div>
    
    <div class="content mar_20">
    	<div class="l_history">
        	<div class="his_t">
            	<span class="fl">一起尝“新”吧</span>
            </div>
        	<ul>
            	<li>
                    <div class="img"><a href="#"><img src="../Picture/his_1.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">彭德莱香水火锅</a></div>
                    <div class="price">
                    	商家描述商家描述商家描述商家描述商家描述商家描述商家描述商家描述商家描述商家描述
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../Picture/his_2.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../Picture/his_3.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>680.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../Picture/his_4.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../Picture/his_5.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
        	</ul>
        </div>
        <div class="l_list">
        	<div class="list_t">
            	<span class="fl list_or">
                	<a href="#" class="now">默认</a>
                    <a href="#">最新入驻</a>
                    <a href="#">最早入驻</a>
                </span>
                <span class="fr">共发现120家</span>
            </div>
            
            <div class="list_c">
            	
                <ul class="cate_list">
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                    
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                    </li>
                	<li>
                    	<div class="img"><a href="#"><img src="../Picture/per_1.jpg" width="210" height="185" /></a></div>
                        <div class="price">
                            <font>￥<span>198.00</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">电话</a>
                            <a href="#" class="j_car">1234567891234</a>
                        </div>
                   </li>
                </ul>
                
                <div class="pages">
                	<a href="#" class="p_pre">上一页</a><a href="#" class="cur">1</a><a href="#">2</a><a href="#">3</a>...<a href="#">20</a><a href="#" class="p_pre">下一页</a>
                </div>
                
                
                
            </div>
        </div>
    </div>
    
    <jsp:include page="../pages/foot.jsp"></jsp:include>
</div>

</body>


<!--[if IE 6]>
<script src="../Scripts/zh_cn.js"></script>
<![endif]-->
</html>