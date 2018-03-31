<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
    <!--[if IE 6]>
    <script src="Scripts/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
        
    <script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>   
    <script>
    $(document).ready(function(){
		var str = "<%=session.getAttribute("adminlogin")%>";
		if(str == null || str == "" || str == "null"){
			alert("登录超时 即将跳转至登录页面");
			<% 
    		if(session.getAttribute("adminlogin") == null){
        		session.removeAttribute("errormessage"); 
        		session.removeAttribute("adminlogin");
    		}
			%>
			window.location.href="../pages/Login.jsp";
		}
		
	});
	function update_cfm(){
		var msg = "确认修改吗？";
		if(confirm(msg)==true){/*
		var $id =$(d).parent().parent().children().first().html();
		$.post("DeleteStudentsById?stuId="+$id,null,function(data){
        alert(data);
        window.location.href="SelectAllStudents?page="+${stupage};
    	});*/
			return true;
		}else{
			return false;
		}
	}
	function delete_cfm(obj){
		var msg = "确认删除吗？";
		if(confirm(msg)==true){
		var $adress =$(obj).next().val();
		alert($adress);
		/*$.post("DeleteStudentsById?stuId="+$id,null,function(data){
        alert(data);
        window.location.href="SelectAllStudents?page="+${stupage};
    	});*/
			return true;
		}else{
			return false;
		}
	}
	</script>
<title>邛崃市云联惠</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="m_top_bg">
    <div class="top">
        <div class="m_logo"><a href="../index.jsp"><img src="../Picture/logo1.png" /></a></div>
        
        
    </div>
</div>
<!--End Header End--> 
<div class="i_bg bg_color">
	<div class="m_content">
		<div class="m_all">
			<div class="mem_tit1">
				<button style="background-color: orange;" class="m_btn" onclick="window.location.href='Administrator_Insert_Type.jsp'">返回</button>
			</div>
			<h2 align="center">修改经营类型</h2>
            <div class="mem_tit1">经营类型</div>
           
            <table id="tab1" border="0" class="order_tab" style="width:1100px; text-align:center;  cellpadding="0">
              <tr>
              	<td width="30%" height="30">类型ID</td>
                <td width="70%" align="left">1</td>
              </tr>
              <tr>
              	<td width="30%" height="30">类型名称</td>
                <td width="70%" align="left">
               		<input type="text" id="" name="" maxlength="15" placeholder="请填写类型名称 (15字以内)" value="餐饮"/>
                </td>
              </tr>
              <tr>
              	<td width="30%" height="30">类型描述</td>
                <td width="70%" align="left">
               		<input type="text" id="" name="" maxlength="20" placeholder="请填写类型描述 (15字以内)" value="餐饮行业"/>
                </td>
              </tr>
            </table>
            <div class="mem_tit1">
				<button onclick="update_cfm();" style="background-color: orange;" class="m_btn">&nbsp;修&nbsp;&nbsp;改&nbsp;</button>
			</div>
            
            
            
        </div>
        
    </div>  
</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>