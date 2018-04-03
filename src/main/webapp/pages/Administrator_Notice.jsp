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
    		if(session.getAttribute("adminlogin") == null){
        		session.removeAttribute("errormessage"); 
        		session.removeAttribute("adminlogin");
    		}
			%>
			window.location.href="../pages/Login.jsp";
		}
		$.ajax({
			type : "POST",//方法类型
			dataType : "JSON",//预期服务器返回的数据类型
			url : "../commonController/selectNotice.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					if(i == 0){
						$("#storeDescribe1").val(dom);
					}
					if(i == 1){
						$("#storeDescribe2").val(dom);
					}
				});
			},
			error : function(result) {
				alert("获取公告失败！");
			}
		});
	});
	function insert_cfm() {
		var msg = "确认保存吗？";
		$notice1 = $("#storeDescribe1").val();
		$notice2 = $("#storeDescribe2").val();
		if (confirm(msg) == true) { 
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"notice1" : $notice1,
					"notice2" : $notice2
				},
				url : "../commonController/updateNotice.do",//url
				success : function(result) {
					alert("已保存！");
					window.location.reload();
				},
				error : function(result) {
					alert("保存公告失败！");
				}
			});
			return true;
				
		} else {
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
				<h2 align="center">修改公告</h2>
				<div class="mem_tit1">当前公告</div>
				<form action="" id=""
					name="" method="post">
					<table id="tab1" border="0" class="order_tab"
						style="width: 1100px; text-align: center; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td width="10%" height="30">固定公告</td>
							<td width="90%" align="left"><textarea rows="5px" style="resize:none" maxlength="100"
									placeholder="请填写固定公告 （如不需要清空保存即可）" cols="100%" id="storeDescribe1"
									name="storeDescribe"></textarea>
							<font color="red">可输入100字 此公告固定不动</font>
							</td>
						</tr>
						<tr>
							<td width="10%" height="30">滚动公告</td>
							<td width="90%" align="left"><textarea rows="5px" style="resize:none" maxlength="150"
									placeholder="请填写滚动公告 （如不需要清空保存即可）" cols="100%" id="storeDescribe2"
									name="storeDescribe"></textarea>
							<font  color="red">可输入150字 此公告来回滚动</font>
							</td>
						</tr>
					</table>
				</form>
				<p></p>
				<div class="mem_tit1">
					<button onclick="insert_cfm();" style="background-color: orange;"
						class="m_btn">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
				</div>
			</div>

		</div>
	</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>