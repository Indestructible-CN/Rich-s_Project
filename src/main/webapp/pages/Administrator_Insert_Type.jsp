<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			session.removeAttribute("errormessage"); 
			session.removeAttribute("adminlogin");
			%>
			window.location.href="../pages/Login.jsp";
		}
		
	});
	function insert_cfm() {
		var msg = "确认增加吗？";
		if (confirm(msg) == true) {
			/* 
					$.ajax({
						type : "POST",//方法类型
						dataType : "TEXT",//预期服务器返回的数据类型
						url : "../etStoreInfoService/doInsert.do",//url
						data : $('#Form_Insert').serialize(),
						success : function(result) {
							alert("新增成功！");
						},
						error : function(result) {
							alert("新增失败！");
						}
					}); */
					alert("OK!");
					return true;
				
		} else {
			return false;
		}
	
	}
	function delete_cfm(d){
		var msg = "确认删除吗？";
		if(confirm(msg)==true){/*
		var $id =$(d).parent().parent().children().first().html();
		$.post("DeleteStudentsById?stuId="+$id,null,function(data){
        alert(data);
        window.location.href="SelectAllStudents?page="+${stupage};
    	});*/
    	alert("OK!!!");
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
			<div class="m_logo">
				<a href="../index.jsp"><img src="../Picture/logo1.png" /></a>
			</div>


		</div>
	</div>
	<!--End Header End-->
	<div class="i_bg bg_color">
		<div class="m_content">
			<div class="m_all">
				<div class="mem_tit1">
					<button style="background-color: orange;" class="m_btn"
						onclick="window.location.href='Administrator.jsp'">返回搜索</button>
				</div>
				<h2 align="center">添加经营类型</h2>
				<div class="mem_tit1">经营类型</div>
				<form action="" id=""
					name="" method="post">
					<table id="tab1" border="0" class="order_tab"
						style="width: 1100px; text-align: center; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td width="30%" height="30">类型名称</td>
							<td width="70%" align="left"><input type="text"
								placeholder="请填写类型名称 (15字以内)"  maxlength="15" value="" /></td>
						</tr>
						<tr>
							<td width="30%" height="30">类型描述</td>
							<td width="70%" align="left"><input type="text"
								placeholder="请填写类型描述(20字以内)"  maxlength="20" value="" /></td>
						</tr>
					</table>
				</form>
				<p></p>
				<div class="mem_tit1">
					<button onclick="insert_cfm();" style="background-color: orange;"
						class="m_btn">&nbsp;增&nbsp;&nbsp;加&nbsp;</button>
				</div>
				<hr />
				<div class="mem_tit1">现有经营类型</div>
					<table id="" border="0" class="order_tab"
						style="width: 1100px; text-align: center; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td width="7%" height="30">类型ID</td>
							<td width="18%" height="30">类型名称</td>
							<td width="25%" height="30">类型描述</td>
							<td width="18%" height="30">创建时间</td>
							<td width="18%" height="30">修改时间</td>
							<td width="14%" height="30">操作</td>
						</tr>
						<tr>
							<td height="30">1</td>
							<td height="30">餐饮</td>
							<td height="30">餐饮相关</td>
							<td height="30">2018-03-02 12:12:45</td>
							<td height="30">2018-03-02 14:12:45</td>
							<td height="30">
								<button onclick="window.location.href='Administrator_Update_Type.jsp'" >修&nbsp;改</button>&nbsp;
                				<button onclick="delete_cfm(this);">删&nbsp;除</button>
							</td>
						</tr>
						<tr>
							<td height="30">2</td>
							<td height="30">类型名称</td>
							<td height="30">类型描述</td>
							<td height="30">2018-03-02 12:19:45</td>
							<td height="30"></td>
							<td height="30">
								<button>修&nbsp;改</button>&nbsp;
                				<button>删&nbsp;除</button>
							</td>
						</tr>
					</table>
			</div>

		</div>
	</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>