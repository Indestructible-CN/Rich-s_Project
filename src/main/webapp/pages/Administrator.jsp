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
        
    <script type="text/javascript" src="../Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/menu.js"></script>    
        
	<script type="text/javascript" src="../Scripts/select.js"></script>
     <script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>   
    <script>
    window.onload = function() {
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
    	// 取得类型
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
    	
    	// 刷新页面
		$.ajax({
			type : "POST",//方法类型
			dataType : "JSON",//预期服务器返回的数据类型
			data : null,
			url : "../etStoreInfoService/selectByLimit.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					// 总页数
					$("#pages").html("");
					$("#pages").html(dom.pages);
					// 总条数
					$("#selectCount").html("");
					$("#selectCount").html(dom.selectCount);
					// 当前页码
					$("#nowPage").val("");
					$("#nowPage").val(dom.nowPage);
					// 清空taboy
					$("#tab_tbody").html("");
					if($(dom.list).size() == 0){
						$('#tab_tbody').append("<tr><td colspan='5' align='center'>暂无数据</td></tr>");
					}else{
						$.each(dom.list,function(index,item){
							$('#tab_tbody').append("<tr><td>"+item.id+"</td><td><font color='#ff4e00'>"+
									item.storeName+"</font></td><td>"+
									item.storeAddress+"</td><td>"+
									item.storePhone+"</td><td><button onclick='seachById(this);'>查/改</button>&nbsp;<button onclick='delete_cfm(this);'>删&nbsp;除</button></td></tr>");
						});
					}
				});
			},
			error : function(result) {
				alert("初始化失败！");
			}
		});
	}
	function delete_cfm(d){
			var msg = "确认删除吗？";
			if(confirm(msg)==true){
			var $id =$(d).parent().parent().children().first().html();
			$.ajax({
				type : "POST",//方法类型
				dataType : "TEXT",//预期服务器返回的数据类型
				data : {
					"id" : $id
				},
				url : "../etStoreInfoService/deleteById.do",//url
				success : function(result) {
					alert("删除成功！");
					doSeach("<span>点击跳转</span>");
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
	function seachById(obj){
		var $id =$(obj).parent().parent().children().first().html();
		window.location.href="../pages/Administrator_Update.jsp?id="+$id;
	}
	function check_page(){
		var i = $("#nowPage");
		// 总页数
		var pages = $("#pages").html();
		   if(!(/^[0-9]*$/.test(Number(i.val())))){ 
		       alert("请输入正确页码格式！");
		       i.val("1");
		   }
		   if(Number(pages) != 0 && Number(i.val())>pages){
			   alert("您输入的页码不正确，已设置为最大页码！");
		       i.val(pages);
		   }
		   if(Number(i.val())<1){
			   alert("您输入的页码不正确，已设置为最小页码！");
		       i.val("1");
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
	
	//List 0	storePhone
	//List 1	id
	//List 2	storeTypeId
	//List 3	storeName
	//List 4	gmtCreate
	//List 5	当前页数-临时 前台页面传入  nowPageTMP
	function doSeach(obj){
		// 总页数
		var pages = Number($("#pages").html());
		var nowPage = $("#nowPage").val();
		var storeTypeId = $("#storeTypeId").val();
		var storeName = $("#storeName").val();
		var storePhone = $("#storePhone").val();
		var flag = $(obj).html();
		
		var nowPageTMP = "1";
		if(flag == "点击跳转"){
			nowPageTMP = Number(nowPage);
		}else if(flag == "上一页"){
			if((Number(nowPage) - 1) < 1){
				nowPageTMP = 1;
			}else{
				nowPageTMP = Number(nowPage) - 1;
			}
		}else if(flag == "下一页"){
			if((Number(nowPage) + 1) > pages){
				nowPageTMP = Number(nowPage);
			}else{
				nowPageTMP = Number(nowPage) + 1;
			}
		}else{
			nowPageTMP = 1;
		}
		
		if(storeTypeId == ""){
			storeTypeId = null;
		}
		
		if(storeName == ""){
			storeName = null;
		}
		
		
		 
			$.ajax({
				type : "POST",//方法类型
				dataType : "JSON",//预期服务器返回的数据类型
				data : {
					"storePhone":storePhone,
					"idItem":null,
					"storeTypeId":storeTypeId,
					"storeName":storeName,
					"gmtCreate":null,
					"nowPageTMP":nowPageTMP
				},
				url : "../etStoreInfoService/selectByLimit.do",//url
				success : function(result) {
					$.each(result, function(i, dom) {
						// 总页数
						$("#pages").html("");
						$("#pages").html(dom.pages);
						// 总条数
						$("#selectCount").html("");
						$("#selectCount").html(dom.selectCount);
						// 当前页码
						$("#nowPage").val("");
						$("#nowPage").val(dom.nowPage);
						// 清空taboy
						$("#tab_tbody").html("");
						if($(dom.list).size() == 0){
							$('#tab_tbody').append("<tr><td colspan='5' align='center'>暂无数据</td></tr>");
						}else{
							$.each(dom.list,function(index,item){
								$('#tab_tbody').append("<tr><td>"+item.id+"</td><td><font color='#ff4e00'>"+
										item.storeName+"</font></td><td>"+
										item.storeAddress+"</td><td>"+
										item.storePhone+"</td><td><button onclick='seachById(this);'>查/改</button>&nbsp;<button onclick='delete_cfm(this);'>删&nbsp;除</button></td></tr>");
							});
						}
					});
				},
				error : function(result) {
					alert("查询失败！");
				}
			});
		
	}
	</script>
<title>邛崃市云联惠</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="m_top_bg">
    <div class="top">
        <div class="m_logo"><a href="../index.jsp"><img src="../Picture/logo1.png" /></a></div>
        <div class="m_search">
                <input type="text" id="storePhone" value="" placeholder="输入商户准确电话号并查询" class="m_ipt" />
                <button class="m_btn" onclick="doSeach(this);">搜索</button>
        </div>
        
    </div>
</div>
<!--End Header End--> 
<div class="i_bg bg_color">
	<div class="m_content">
		<div class="m_all">
            <div class="mem_tit1">筛选商户</div>
            <table border="0" class="order_tab" style="width:1100px;"  cellspacing="0" cellpadding="0">
              <tr>
              	<td width="110" align="right">商户经营类型</td>
                <td width="220">
                	<select id="storeTypeId" name="storeTypeId">
                		<option value="">全部</option>
                	</select>
                </td>
                <td width="100" align="right">商户名字</td> 
                <td width="220">
                	<input id="storeName" style="width: 90%;" value=""/>
                </td>
                <td><button onclick="doSeach(this);" class="btn_u">点击查找</button></td>
              </tr>
              <tr>
                <td colspan="5" height="" style="font-family:'宋体'; padding:20px 10px 20px 10px;">
                	商户类型选择任意时，不作为筛选条件 <br />
                	商户名字支持模糊搜索（列如：输入“火店” 即可搜索出“火锅店”），不填默认全部搜索
                </td>
              </tr>
              </table>
              <br />
              <table border="0" class="order_tab" style="width:1100px;"  cellspacing="0" cellpadding="0">
              <tr>
                <td height="" width="15%" style="font-family:'宋体'; padding:5px;">
                	<button class="btn_u" onclick="window.location.href='../pages/Administrator_Insert.jsp'">添加新商户</button>
                </td>
                <td width="15%" style="font-family:'宋体'; padding:5px;">
                	<button class="btn_u" onclick="window.location.href='../pages/Administrator_Top_Store.jsp'">添加顶置商家</button>
                </td>
                <td width="15%" style="font-family:'宋体'; padding:5px;">
                	<button class="btn_u" onclick="window.location.href='../pages/Administrator_Insert_Type.jsp'">添加新分类</button>
                </td>
                <td width="55%" style="font-family:'宋体'; padding:5px;">
                	<button class="btn_u" onclick="window.location.href='../pages/Administrator_Notice.jsp'">修改公告</button>
                </td>
              </tr>
            </table>
            <p></p>
            <div class="mem_tit1">商户</div>
            <table id="" border="0" class="order_tab" style="width:1100px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
              <tr>
              	<td width="10%" height="30">商户ID</td>
                <td width="20%">商户名称</td>
                <td width="30%">地址</td>
                <td width="20%">商家电话</td>
                <td width="20%">操作</td>
              </tr>
              <tbody id="tab_tbody">
              
              </tbody>
              <!--翻页 start-->
              <tr>
              	<td align="right" colspan="5" height="30">
              		搜索到<span id="selectCount"></span>条&nbsp;&nbsp;共<span id="pages"></span>页&nbsp;&nbsp;
              		<button onclick="doSeach(this);">上一页</button>
              		<button onclick="doSeach(this);">下一页</button>&nbsp;&nbsp;&nbsp;&nbsp;
              		当前页数：
              		<input id="nowPage" style="width: 40px;" value="" onblur="check_page();" />
              		<button onclick="doSeach(this);">点击跳转</button>
              	</td>
              </tr>
              <!--翻页 end-->
            </table>
        </div>
        
    </div>  
</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>