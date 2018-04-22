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
	<script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>
	<script>
	//获取url中"?"符后的字串 
	function GetRequest() {
		var url = decodeURI(location.search);
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
	
	$(document).ready(function(){
		var Request = GetRequest();
		// sId
		var sId = Request["sId"];
		$("#sIdHidden").val(sId);
		// storeNameTmp
		var storeNameTmp = Request["storeName"];
		$("#storeNameHidden").val(storeNameTmp);
		$("#storeName").val(storeNameTmp);
		
		// 方法类型
		$.ajax({
			type : "POST",
			dataType : "JSON",//预期服务器返回的数据类型
			async: false,
			url : "../rtStoreTypeService/doInsertInit.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					if(sId == dom.id){
						$("#storeTypeId").append(
								"<option selected='selected' value='"+dom.id+"'>" + dom.typeName
										+ "</option>");
					}else{
						$("#storeTypeId").append(
								"<option value='"+dom.id+"'>" + dom.typeName
										+ "</option>");
					}
					
				});
			},
			error : function(result) {
				alert("初始化失败！");
			}
		}); 
		// 新入住推荐
		$.ajax({
			type : "POST",//方法类型
			dataType : "JSON",//预期服务器返回的数据类型
			async: false,
			url : "../etStoreInfoService/indexInit.do",//url
			success : function(result) {
				$.each(result, function(i, dom) {
					$.each(dom.listTime, function(index, time) {
						if(index < 7){
							$("#listTime").append("<li>"+
				                    "<div class='img'><a href='Details.jsp?sId="+time.id+"'><img src='../shopImg/"+time.storeImg.split(",")[0]+"' width='185' height='155' /></a></div>"+
				                	"<div class='name'><a href='Details.jsp?sId="+time.id+"'>"+time.storeName+"</a></div>"+
				                    "<div class='price'>"+time.storePhone+
				                    "</div>"+
				                "</li>");	
						}
										
					});
				});
			},
			error : function(result) {
				alert("获取失败！");
			}
		});
		
		if(sId == "" || sId == "null" || sId == null || sId == "all"){
			// 刷新页面
			$.ajax({
				type : "POST",//方法类型
				dataType : "JSON",//预期服务器返回的数据类型
				data : null,
				async: false,
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
						// 清空cate_list
						$("#cate_list").html("");
						if($(dom.list).size() == 0){
							$('#cate_list').append("<h1>暂无商户</h1>");
						}else{
							$.each(dom.list,function(index,item){
								$('#cate_list').append("<li>"+
				                    	"<div class='img'><a href='Details.jsp?sId="+item.id+"'><img src='../shopImg/"+item.storeImg.split(",")[0]+"' width='210' height='185' /></a></div>"+
				                        "<div class='price'>"+item.storeAddress+"</div>"+
				                        "<div class='name'><a href='Details.jsp?sId="+item.id+"'>"+item.storeName+"</a></div>"+
				                        "<div class='carbg'>"+
				                        	"<a class='ss' href='Details.jsp?sId="+item.id+"'>电话</a>"+
				                            "<a class='j_car' href='Details.jsp?sId="+item.id+"'>"+item.storePhone+"</a>"+
				                        "</div>"+
				                   " </li>");
							});
						}
					});
				},
				error : function(result) {
					alert("初始化失败！");
				}
			});
		}else{
			doSearch("<span>搜索</span>");
		}
		if(storeNameTmp != null && storeNameTmp != "" && storeNameTmp != "null"){
			doSearch("<span>搜索</span>");
		}
	});
	//List 0	storePhone
	//List 1	id
	//List 2	storeTypeId
	//List 3	storeName
	//List 4	gmtCreate
	//List 5	当前页数-临时 前台页面传入  nowPageTMP
	function doSearch(obj){
		// 总页数
		var pages = Number($("#pages").html());
		var nowPage = $("#nowPage").val();
		var storeTypeId = $("#storeTypeId").val();
		var storeName = $("#storeName").val();
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
					"storePhone":null,
					"idItem":null,
					"storeTypeId":storeTypeId,
					"storeName":storeName,
					"gmtCreate":null,
					"nowPageTMP":nowPageTMP
				},
				async: false,
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
						// 清空cate_list
						$("#cate_list").html("");
						if($(dom.list).size() == 0){
							$('#cate_list').append("<h1>暂无商户</h1>");
						}else{
							$.each(dom.list,function(index,item){
								$('#cate_list').append("<li>"+
				                    	"<div class='img'><a href='Details.jsp?sId="+item.id+"'><img src='../shopImg/"+item.storeImg.split(",")[0]+"' width='210' height='185' /></a></div>"+
				                        "<div class='price'>"+item.storeAddress+"</div>"+
				                        "<div class='name'><a href='Details.jsp?sId="+item.id+"'>"+item.storeName+"</a></div>"+
				                        "<div class='carbg'>"+
				                        	"<a class='ss' href='Details.jsp?sId="+item.id+"'>电话</a>"+
				                            "<a class='j_car' href='Details.jsp?sId="+item.id+"'>"+item.storePhone+"</a>"+
				                        "</div>"+
				                   " </li>");
							});
						}
					});
				},
				error : function(result) {
					alert("查询失败！");
				}
			});
		
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
	</script>
    
<title>邛崃市云联惠</title>
</head>
<body>  
<jsp:include page="header.jsp"></jsp:include>
<!--Begin Menu Begin-->
<jsp:include page="header2.jsp"></jsp:include>
<!--End Menu End--> 
<div class="i_bg">
    
    <div class="content mar_20">
    	<div class="l_history">
        	<div class="his_t">
            	<span class="fl">一起尝“新”吧</span>
            </div>
        	<ul id="listTime">
        	</ul>
        </div>
        <div class="l_list">
        	
            <div class="top">
			   	<div class="search">
			   		<select class="s_btn" id="storeTypeId" name="storeTypeId">
                		<option value="">全部</option>
                	</select>
		        	<input id="storeName" type="text" value="" class="s_ipt" />
		            <button id="doInit" onclick="doSearch(this);" class="s_btn" >搜索</button>
			    </div>
			</div>
			<div class="list_t">
                <span class="fr">共发现<span id="selectCount"></span>家</span>
            </div>
            <div class="list_c">
            	
                <ul class="cate_list" id="cate_list">
                </ul>
                
                <div class="pages">
                <button class="p_pre" onclick="doSearch(this);">上一页</button>　<button class="p_pre" onclick="doSearch(this);">下一页</button>　
                <span>共<span id="pages">3</span>页</span>
                <input id="nowPage" onblur="check_page();" style="width: 40px; height: 100%;" value="" class="p_pre" /><button class="p_pre" onclick="doSearch(this);">点击跳转</button>
                </div>
                
                
                
            </div>
        </div>
    </div>
    
    <jsp:include page="../pages/foot.jsp"></jsp:include>    
</div>
<input id="sIdHidden" type="hidden"/>
<input id="storeNameHidden" type="hidden"/>
</body>


<!--[if IE 6]>
<script src="../Scripts/zh_cn.js"></script>
<![endif]-->
</html>