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
			url : "../rtStoreTypeService/doInsertInit.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					if($(dom).size() == 0){
						$('#tab_tbody').append("<tr><td colspan='6' align='center'>暂无数据</td></tr>");
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
								"<td width='7%' height='30'>"+dom.id+"</td>"+
								"<td width='18%' height='30'><input type='text' placeholder='请填写类型名称 (15字以内)'  maxlength='15' style='width: 220px;' value='"+dom.typeName+"' /></td>"+
								"<td width='25%' height='30'><input type='text' placeholder='请填写类型描述 (20字以内)'  maxlength='20' style='width: 220px;' value='"+dom.typeDescribe+"' /></td>"+
								"<td width='18%' height='30'>"+gmtCreateStr+"</td>"+
								"<td width='18%' height='30'>"+gmtModifyStr+"</td>"+
								"<td width='14%' height='30'><button onclick='update_cfm(this)' >修&nbsp;改</button>&nbsp;"+
                				"<button onclick='delete_cfm(this);'>删&nbsp;除</button></td>"+
								"</tr>");
					}
				});
			},
			error : function(result) {
				alert("查询失败！");
			}
		});
	});
	function insert_cfm() {
		$typeName = $("#typeName").val();
		$typeDescribe = $("#typeDescribe").val();
		var msg = "确认增加吗？";
		if (confirm(msg) == true) {
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"typeName" : $typeName,
					"typeDescribe" : $typeDescribe
				},
				url : "../rtStoreTypeService/insertSelectiveSub.do",//url
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
		$id = $(d).parent().parent().children().first().html();
		var msg = "确认删除吗？";
		if(confirm(msg)==true){
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"id" : $id
				},
				url : "../rtStoreTypeService/deleteByPrimaryKeySelective.do",//url
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
		$id = $(d).parent().parent().children().first().html();
		$typeName = $(d).parent().parent().children().first().next().children().first().val();
		$typeDescribe = $(d).parent().parent().children().first().next().next().children().first().val();
		var msg = "确认修改吗？";
		if(confirm(msg)==true){
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"id" : $id,
					"typeName" : $typeName,
					"typeDescribe" : $typeDescribe
				},
				url : "../rtStoreTypeService/updateByPrimaryKeySelective.do",//url
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
				<h2 align="center">添加经营类型</h2>
				<div class="mem_tit1">经营类型</div>
				<form action="" id=""
					name="" method="post">
					<table id="tab1" border="0" class="order_tab"
						style="width: 1100px; text-align: center; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td width="30%" height="30">类型名称</td>
							<td width="70%" align="left"><input type="text" id="typeName"
								placeholder="请填写类型名称 (15字以内)"  maxlength="15" value="" /></td>
						</tr>
						<tr>
							<td width="30%" height="30">类型描述</td>
							<td width="70%" align="left"><input type="text" id="typeDescribe"
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