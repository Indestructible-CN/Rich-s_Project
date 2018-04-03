<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="../css/style.css" />

<script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>
<script>
window.onload = function(){
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
		// 刷新页面
		$.ajax({
			type : "POST",//方法类型
			dataType : "JSON",//预期服务器返回的数据类型
			data : null,
			url : "../rtTopStoreService/selectByExample.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					if($(dom).size() == 0){
						$('#tab_tbody').append("<tr><td colspan='5' align='center'>暂无数据</td></tr>");
					}else{
						if(dom.gmtCreate !=  null){
							var javaDate=dom.gmtCreate;
							var jsDate=new Date(javaDate.time);
							var gmtCreateStr=jsDate.format("yyyy-MM-dd hh:mm:ss");
						}else{
							var gmtCreateStr= "";
						}
						if(dom.gmtModify != null){
							var javaDate1=dom.gmtModify;
							var jsDate1=new Date(javaDate1.time);
							var gmtModifyStr=jsDate1.format("yyyy-MM-dd hh:mm:ss");
						}else{
							var gmtModifyStr = "";
						}
							$('#tab_tbody').append("<tr>"+
									"<td height='30'>"+dom.storeId+"</td>"+
									"<td height='30'><input type='text' id='' placeholder='请填写置顶描述 (15字以内)'  maxlength='15' value='"+dom.topTag+"' style='width: 220px;'/></td>"+
									"<td height='30'><input type='text' id='' placeholder='请填写置顶权重(数字越大排名越靠前)'  maxlength='20' value='"+dom.topWeight+"' onkeyup='value=value.replace(/[^\d]/g,'')' style='width: 230px;'/></td>"+
									"<td height='30'>"+gmtCreateStr+"</td>"+
									"<td height='30'>"+gmtModifyStr+"</td>"+
									"<td height='30'>"+
										"<input type='hidden' value='"+dom.id+"'/>"+
										"<button onclick='update_cfm(this);' >修&nbsp;改</button>&nbsp;"+
		                				"<button onclick='delete_cfm(this);'>删&nbsp;除</button>"+
									"</td>"+
								"</tr>");
					}
				});
			},
			error : function(result) {
				alert("初始化失败！");
			}
		});
};
	function insert_cfm() {
		$storeId = $("#storeId").val();
		$topTag = $("#topTag").val();
		$topWeight = $("#topWeight").val();
		var msg = "确认增加吗？";
		if($topTag == "" || $topTag == null || $storeId == "" || $storeId == null || $topWeight == "" || $topWeight == null){
			alert("都不能为空");
		}else if (confirm(msg) == true) {
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"storeId" : $storeId,
					"topTag" : $topTag,
					"topWeight" : $topWeight
				},
				url : "../rtTopStoreService/insertSelectiveSub.do",//url
				success : function(result) {
					window.location.reload();
				},
				error : function(result) {
					alert("新增失败！");
				}
			});
			return true;
				
		} else {
			return false;
		}
	
	}
	function delete_cfm(d){
		var msg = "确认删除吗？";
		if(confirm(msg)==true){
			$id = $(d).prev().prev().val();
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"id" : $id
				},
				url : "../rtTopStoreService/deleteByPrimaryKeySelective.do",//url
				success : function(result) {
					window.location.reload();
				},
				error : function(result) {
					alert("删除失败！");
				}
			});
			return true;
		}else{
			return false;
		}
	}
	function update_cfm(d){
		$id = $(d).prev().val();
		$topTag = $(d).parent().prev().prev().prev().prev().children().first().val();
		$topWeight = $(d).parent().prev().prev().prev().children().first().val();
		var par = /^-?\\d+$/;
		var msg = "确认修改吗？";
		if($topTag == "" || $topTag == null){
			alert("置顶描述不能为空");
		}else if($topWeight == "" || $topWeight == null){
			alert("置顶权重不能为空");
		}else if(!par.test($topWeight)){
			alert("置顶权重必须为数字");
		}else if(confirm(msg)==true){
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"id" : $id,
					"topTag" : $topTag,
					"topWeight" : $topWeight
				},
				url : "../rtTopStoreService/updateByPrimaryKeySelective.do",//url
				success : function(result) {
					window.location.reload();
				},
				error : function(result) {
					alert("修改失败！");
				}
			});
			return true;
		}else{
			return false;
		}
	}
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
				<h2 align="center">添加顶置商户</h2>
				<div class="mem_tit1">顶置商户</div>
				<form action="" id=""
					name="" method="post">
					<table id="tab1" border="0" class="order_tab"
						style="width: 1100px; text-align: center; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td width="30%" height="30">商户ID</td>
							<td width="70%" align="left"><input type="text"id="storeId"
								placeholder="请填写商户ID (请认真查实)"  maxlength="15" value="" /></td>
						</tr>
						<tr>
							<td width="30%" height="30">置顶描述</td>
							<td width="70%" align="left"><input type="text"id="topTag"
								placeholder="请填写置顶描述 (15字以内)"  maxlength="15" value="" /></td>
						</tr>
						<tr>
							<td width="30%" height="30">置顶权重</td>
							<td width="70%" align="left"><input type="text" id="topWeight"
								placeholder="请填写置顶权重(数字越大排名越靠前)"  maxlength="20" value="" onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
					</table>
				</form>
				<p></p>
				<div class="mem_tit1">
					<button onclick="insert_cfm();" style="background-color: orange;"
						class="m_btn">&nbsp;增&nbsp;&nbsp;加&nbsp;</button>
				</div>
				<hr />
				<div class="mem_tit1">现有顶置列表</div>
					<table id="" border="0" class="order_tab"
						style="width: 1100px; text-align: center; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td width="7%" height="30">店铺ID</td>
							<td width="23%" height="30">置顶描述</td>
							<td width="24%" height="30">置顶权重</td>
							<td width="16%" height="30">创建时间</td>
							<td width="16%" height="30">修改时间</td>
							<td width="14%" height="30">操作</td>
						</tr>
						<tbody id="tab_tbody">
						
						</tbody>
					</table>
			</div>

		</div>
	</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>