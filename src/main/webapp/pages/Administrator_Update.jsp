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

<script type="text/javascript" src="../Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../Scripts/menu.js"></script>

<script type="text/javascript" src="../Scripts/select.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>
<style> 
.imgSF{max-width:400px;_width:expression(this.width > 400 ? "400px" : this.width);} 
</style>
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
	//获取url中"?"符后的字串 
	function GetRequest() {
		var url = location.search;
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");
			for (var i = 0; i < strs.length; i++) {
				theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
			}
		}
		return theRequest;
	}

	$(window).load(
			function() {
				var Request = GetRequest();
				var key = Request["id"];
				var storeTypeId = null;
				$.ajax({
					type : "POST",//方法类型
					dataType : "JSON",//预期服务器返回的数据类型
					async : false,
					data : {
						"id" : key
					},
					url : "../etStoreInfoService/selectByPrimaryKey.do",//url
					success : function(result) {
						$.each(result,
								function(i, dom) {
									if (dom.Msg == "查无此人") {
										alert("查无此人");
									} else {
										storeTypeId = dom.Object.storeTypeId;
										if(dom.Object.gmtCreate !=  null){
											var javaDate=dom.Object.gmtCreate;
											var jsDate=new Date(javaDate.time);
											var gmtCreateStr=jsDate.format("yyyy-MM-dd hh:mm:ss");
										}else{
											var gmtCreateStr= "";
										}
										if(dom.Object.gmtModify != null){
											var javaDate1=dom.Object.gmtModify;
											var jsDate1=new Date(javaDate1.time);
											var gmtModifyStr=jsDate1.format("yyyy-MM-dd hh:mm:ss");
										}else{
											var gmtModifyStr = "";
										}
										$("#id").html("");
										$("#storeName").val("");
										$("#storePhone").val("");
										$("#storeAddress").val("");
										$("#gmtCreate").html("");
										$("#gmtModify").html("");
										$("#storeDescribe").html("");
										
										$("#id").html(dom.Object.id);
										$("#storeName").val(dom.Object.storeName);
										$("#storePhone").val(dom.Object.storePhone);
										$("#storeAddress").val(dom.Object.storeAddress);
										$("#gmtCreate").html(gmtCreateStr);
										$("#gmtModify").html(gmtModifyStr);
										$("#storeDescribe").html(dom.Object.storeDescribe);
										var str1 = dom.Object.storeImg;
										if(str1 != null && str1 != ""){
											var strs= new Array();
											strs=str1.split(",");
											$("#hiddenImg").val(strs);
											var size1 = $(strs).size();
											var sy = 6 - size1;
											for(var z=0;z<size1;z++){
												var tmp = "#td"+(z+1);
												if(z == 0){
													if(strs[z] == "" || strs[z] == null){
														$(tmp).html("暂无图片");
													}else{
														$(tmp).html("<h1>主图</h1><img class='imgSF'  src='../Picture/"+strs[z]+"' alt='' /><br /><br /><button onclick='delete_cfm(this);'>删除</button><input type='hidden' value='"+z+"' />");
													}
													
												}else{
													$(tmp).html("<img class='imgSF'  src='../Picture/"+strs[z]+"' alt='' /><br /><br /><button onclick='delete_cfm(this);'>删除</button><input type='hidden' value='"+z+"' />");
												}
											}
											for(size1;size1<6;size1++){
												var tmp1 = "#td"+(size1+1);
												$(tmp1).html("暂无图片");
											}
											
										}else{
											$("#td1").html("暂无图片");
											$("#td2").html("暂无图片");
											$("#td3").html("暂无图片");
											$("#td4").html("暂无图片");
											$("#td5").html("暂无图片");
											$("#td6").html("暂无图片");
											
										}
									}
								});

					},
					error : function(result) {
						alert("异常！");
					}
				});
				
				/* 加载商户类型集合 */
				$.ajax({
					type : "POST",//方法类型
					dataType : "JSON",//预期服务器返回的数据类型
					async : false,
					url : "../rtStoreTypeService/doInsertInit.do",//url
					success : function(result) {
						if(storeTypeId != null & storeTypeId != ""){
							$.each(result, function(i, dom) {
								if (dom.id == storeTypeId) {
									$("#storeTypeId").append("<option selected='selected' value='"+dom.id+"'>"+ dom.typeName + "</option>");
								}else{
									$("#storeTypeId").append("<option value='"+dom.id+"'>"+ dom.typeName + "</option>");
								}	
							});
						}
					},
					error : function(result) {
						alert("初始化失败！");
					}
				});

			});
	/** 
	 * 时间对象的格式化; 
	 */  
	Date.prototype.format = function (format)   
	{  
	    /* 
	     * eg:format="YYYY-MM-dd hh:mm:ss"; 
	     */  
	    var o =   
	    {  
	        "M+" : this.getMonth() + 1, // month  
	        "d+" : this.getDate(), // day  
	        "h+" : this.getHours(), // hour  
	        "m+" : this.getMinutes(), // minute  
	        "s+" : this.getSeconds(), // second  
	        "q+" : Math.floor((this.getMonth() + 3)  / 3), 
	        "S" : this.getMilliseconds() // millisecond  
	    }  
	    if (/(y+)/.test(format))   
	    {  
	        format = format.replace(RegExp.$1, (this.getFullYear() + "") .substr(4 - RegExp.$1.length));  
	    }  
	    for ( var k in o)   
	    {  
	        if (new RegExp("(" + k + ")").test(format))   
	        {  
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
	        }  
	    }  
	    return format;  
	} 
	 
	function update_cfm() {
		$phone = $("#storePhone").val();
		if (checkPhone($phone)) {
			alert("请输入正确的号码！");
			return false;
		} else {
			var msg = "确认修改吗？";
			if (confirm(msg) == true) {
				var $id = $("#id").html();
				var $storeName = $("#storeName").val();
				var $storePhone = $("#storePhone").val();
				var $storeAddress = $("#storeAddress").val();
				var $storeDescribe = $("#storeDescribe").val();
				var $storeTypeId = $("#storeTypeId").val();
				
				$.ajax({
					type : "POST",//方法类型
					dataType : "TEXT",//预期服务器返回的数据类型
					data : {
						"id" : $id,
						"storeName" : $storeName,
						"storePhone" : $storePhone,
						"storeAddress" : $storeAddress,
						"storeDescribe" : $storeDescribe,
						"storeTypeId" : $storeTypeId
					},
					url : "../etStoreInfoService/updateByPrimaryKeySelective.do",//url
					success : function(result) {
						if(result == "success"){
							alert("更新成功！");
						}else{
							alert("更新失败！");
						}
					},
					error : function(result) {
						alert("初始化失败！");
					}
				});							
				return true;
			} else {
				return false;
			}
		}
	}
	function delete_cfm(obj) {
		var msg = "确认删除吗？";
		if (confirm(msg) == true) {
			var $adress = $(obj).next().val();
			alert($adress);
			var $hiddenImg = $("#hiddenImg").val();
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"img" : $hiddenImg
					,"index" : $adress
				},
				async : false,
				url : "../etStoreInfoService/deleteByImgSelective.do",//url
				success : function(result) {
					alert("删除成功！");
					window.location.reload();
				},
				error : function(result) {
					alert("删除失败！");
				}
			});
			return true;
		} else {
			return false;
		}
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
				<h2 align="center">修改商户信息</h2>
				<div class="mem_tit1">商户信息</div>

				<table id="tab1" border="0" class="order_tab"
					style="width: 1100px; text-align: center;" cellpadding="0">
					<tr>
						<td width="30%" height="30">商户ID</td>
						<td width="70%" align="left"><span id="id"></span></td>
					</tr>
					<tr>
						<td width="30%" height="30">商家名称</td>
						<td width="70%" align="left"><input type="text" placeholder="最大长度20" maxlength="20"
							id="storeName" value="" /></td>
					</tr>
					<tr>
						<td width="30%" height="30">商户所属分类</td>
						<td width="70%" align="left"><select id="storeTypeId"
							name="storeTypeId"></select></td>
					</tr>
					<tr>
						<td width="30%" height="30">商户电话</td>
						<td width="70%" align="left"><input type="text"
							id="storePhone" value="" /></td>
					</tr>
					<tr>
						<td width="30%" height="30">商户地址</td>
						<td width="70%" align="left"><input type="text" placeholder="最大长度30" maxlength="30"
							id="storeAddress" value="" /></td>
					</tr>
					<tr>
						<td width="30%" height="30">创建时间</td>
						<td width="70%" align="left"><span id="gmtCreate"></span></td>
					</tr>
					<tr>
						<td width="30%" height="30">修改时间</td>
						<td width="70%" align="left"><span id="gmtModify"></span></td>
					</tr>
					<tr>
						<td width="30%" height="30">商户描述</td>
						<td width="70%" align="left"><textarea style="resize: none;"
								id="storeDescribe" placeholder="最大长度100" maxlength="100"
								rows="5px" cols="80px"></textarea></td>
					</tr>
				</table>
				<div class="mem_tit1">
					<button onclick="update_cfm();" style="background-color: orange;"
						class="m_btn">&nbsp;修&nbsp;&nbsp;改&nbsp;</button>
				</div>
				<div class="mem_tit1">商户图片</div>
				<table id="tab1" border="0" class="order_tab"
					style="width: 1100px; text-align: center; margin-bottom: 50px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="400px" height="300px" id="td1"></td>
						<td width="400px" height="300px" id="td2"></td>
					</tr>
					<tr>
						<td width="400px" height="300px" id="td3"></td>
						<td width="400px" height="300px" id="td4"></td>
					</tr>
					<tr>
						<td width="400px" height="300px" id="td5"></td>
						<td width="400px" height="300px" id="td6"></td>
					</tr>
					<tr>
						<td width="50%" height="auto" colspan="2">
							<form id="imgForm" action="" enctype="multipart/form-data">
								<input type="file" id="file_input" onchange="loadImg(this);"
									style="border: 1px solid; height: 22px; width: 400px; margin-bottom: 10px;" />
								<input type="hidden" value="" /><br />
								<button>上传图片</button>
							</form>
						</td>
					</tr>
				</table>


			</div>

		</div>
	</div>
<input type="hidden" id="hiddenImg" value=""/>
</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>