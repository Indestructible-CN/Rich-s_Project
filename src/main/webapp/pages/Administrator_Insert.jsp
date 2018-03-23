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
	window.onload = function() {
		/* 加载商户类型集合 */
		$.ajax({
			type : "POST",//方法类型
			dataType : "JSON",//预期服务器返回的数据类型
			url : "../rtStoreTypeService/doInsertInit.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					$("#storeTypeId").append(
							"<option value='"+dom.id+"'>" + dom.typeName
									+ "</option>");
				});
			},
			error : function(result) {
				alert("初始化失败！");
			}
		});
	}
	/* 验证电话号码是否正确 */
	function checkPhone(str) {
		/* 手机号码验证 */
		var re = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		/* 固定电话验证 */
		var re1 = /\d{3}-\d{8}|\d{4}-\d{7}$/;
		if (!re.test(str) && !re1.test(str)) {
			return true;
		} else {
			return false;
		}
	}
	/* 验证商户种类是否填写 */
	function checkStoreTypeId() {
		$val = $("#storeTypeId").val();
		if ($val == null && $val == "") {
			return true;
		} else {
			return false;
		}
	}
	/* 添加商户 */
	function insert_cfm() {
		var msg = "确认增加吗？";
		if (confirm(msg) == true) {
			$phone = $("#storePhone").val();
			if (checkPhone($phone)) {
				alert("请输入正确的号码！");
				return false;
			} else {
				if (checkStoreTypeId()) {
					alert("请选择商户种类！");
					return false;
				} else {
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
					});
					return true;
				}

			}
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
				<h2 align="center">添加商户信息</h2>
				<div class="mem_tit1">商户信息</div>
				<form action="../etStoreInfoService/doInsert.do" id="Form_Insert"
					name="Form_Insert" method="post">
					<table id="tab1" border="0" class="order_tab"
						style="width: 1100px; text-align: center; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td width="30%" height="30">商家名称</td>
							<td width="70%" align="left"><input type="text"
								placeholder="请填写商家名称" id="storeName" name="storeName" value="" /></td>
						</tr>
						<tr>
							<td width="30%" height="30">商户所属分类</td>
							<td width="70%" align="left"><select id="storeTypeId"
								name="storeTypeId">

							</select></td>
						</tr>
						<tr>
							<td width="30%" height="30">商户电话</td>
							<td width="70%" align="left"><input type="text"
								placeholder="请填写商户电话(固话/手机)" id="storePhone" name="storePhone"
								value="" /></td>
						</tr>
						<tr>
							<td width="30%" height="30">商户地址</td>
							<td width="70%" align="left"><input type="text"
								placeholder="请填写商户地址" id="storeAddress" name="storeAddress"
								value="" /></td>
						</tr>
						<tr>
							<td width="30%" height="30">商户描述</td>
							<td width="70%" align="left"><textarea rows="5px" style="resize:none"
									placeholder="请填写商户描述" cols="80px" id="storeDescribe"
									name="storeDescribe"></textarea></td>
						</tr>
					</table>
				</form>
				<p></p>
				<div class="mem_tit1">
					<button onclick="insert_cfm();" style="background-color: orange;"
						class="m_btn">&nbsp;增&nbsp;&nbsp;加&nbsp;</button>
				</div>
			</div>

		</div>
	</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>