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
    <script type="text/javascript" src="../Scripts/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="../Scripts/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="../Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/menu.js"></script>    
        
	<script type="text/javascript" src="../Scripts/select.js"></script>
    
	<script type="text/javascript" src="../Scripts/lrscroll.js"></script>
    
    <script type="text/javascript" src="../Scripts/iban.js"></script>
    <script type="text/javascript" src="../Scripts/fban.js"></script>
    <script type="text/javascript" src="../Scripts/f_ban.js"></script>
    <script type="text/javascript" src="../Scripts/mban.js"></script>
    <script type="text/javascript" src="../Scripts/bban.js"></script>
    <script type="text/javascript" src="../Scripts/hban.js"></script>
    <script type="text/javascript" src="../Scripts/tban.js"></script>
    
	<script type="text/javascript" src="../Scripts/lrscroll_1.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>
	<script>
	$(document).ready(function(){
		var str = "<%=session.getAttribute("errormessage")%>";
		if(str != null && str != "" && str != "null"){
			alert(str);
			<% 
			session.removeAttribute("errormessage"); 
			session.removeAttribute("adminlogin");
			%>
		}
		
	});
	
	</script>
    
    
<title>邛崃市云联惠</title>
</head>
<body>  
<!--Begin Header Begin-->
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="../index.jsp"><img src="../Picture/logo.png" /></a></div>
    </div>
	<div class="login">
    	<div class="log_img"><img src="../Picture/l_img.png" width="611" height="425" /></div>
		<div class="log_c">
        	<form method="post" action="../etAdminService/adminLogin.do">
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="55">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">登录</span>
                </td>
              </tr>
              <tr height="70">
                <td>用户名</td>
                <td><input  name="username" id="username" type="text" value="" class="l_user" /></td>
              </tr>
              <tr height="70">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input name="password" type="password" value="" class="l_pwd" /></td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="submit" value="登录" class="log_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->
<jsp:include page="../pages/foot.jsp"></jsp:include>    

</body>


<!--[if IE 6]>
<script src="../Scripts/zh_cn.js"></script>
<![endif]-->
</html>
<!--
本代码由js代码网网友上传，js代码网收集并编辑整理;
尊重他人劳动成果;
转载请保留js代码链接 - www.jsdaima.com
-->