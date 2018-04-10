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
	<script type="text/javascript" src="../Scripts/lrscroll_1.js"></script>
	<script type="text/javascript" src="../Scripts/n_nav.js"></script>   
    <script type="text/javascript" src="../Scripts/jquery-1.11.3.min.js"></script>
    
<title>邛崃市云联惠</title>
<script>
$(document).ready(function(){
	var Request = GetRequest();
	var key = Request["sId"];
	
	$.ajax({
		type : "POST",//方法类型
		dataType : "JSON",//预期服务器返回的数据类型
		async: false,
		data :{
			"id" :  key
		},
		url : "../etStoreInfoService/detailInit.do",//url
		success : function(result) {
			$.each(result, function(i, dom) {
				if(dom.gmtCreate !=  null){
					var javaDate=dom.gmtCreate;
					var jsDate=new Date(javaDate.time);
					var gmtCreateStr=jsDate.format("yyyy年MM月dd日");
				}else{
					var gmtCreateStr= "";
				}
				$("#typeName1").html("当前 > "+dom.typeName);
				$("#storeName").html(dom.storeName);
				$("#storePhone").html(dom.storePhone);
				$("#storeAddress").html("地址： "+dom.storeAddress);
				$("#typeName2").html("类型："+dom.typeName);
				$("#gmtCreate").html("入驻时间："+gmtCreateStr);
				$("#storeDescribe").html("商家描述："+dom.storeDescribe);
				
				var strs= new Array();
				strs = dom.storeImg.split(",");
				$.each(strs, function(index, dom) {
					if(index == 1){
						$("#liImg1").append("<img src='../Picture/"+strs[index]+"' width='460' height='460' />");
						
					}
					if(index != 0 && index != 1){
						$("#liImg").append("<img src='../Picture/"+strs[index]+"' width='750' height='400' /><br /><br />");
						
					}
				});
			});
		},
		error : function(result) {
			alert("异常！");
		}
	});
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
</head>
<body>  
<!--Begin Header Begin-->
 <jsp:include page="../pages/header.jsp"></jsp:include>
<!--Begin Menu Begin-->
<jsp:include page="header2.jsp"></jsp:include>
<!--End Menu End--> 
<div class="i_bg">    
    <div class="postion">
    	<span class="fl" id="typeName1"></span>
    </div>    
    <div class="content mar_10">
    	<!--Begin 特卖 Begin-->
    	<div class="s_left">
        	<div class="lim_time">
        		
                <table border="0" style="width:100%; margin-bottom:50px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="315">
                    	<div class="lim_name" id="storeName"></div>
                        <div class="lim_price">
                        	<span class="ch_txt">商家电话：</span>
                        </div>
                        <div class="lim_c">
                        	<table border="0" style="width:100%; color:red;" cellspacing="0" cellpadding="0">
                              
                              <tr style="font-family:'Microsoft YaHei';">
                                <td align="right" style="font-size: 22px;" id="storePhone"></td>                   
                              </tr>
                            </table>
                        </div>
                        <div class="lim_c">
                        	<div class="des_choice">
                                <span class="fl" id="storeAddress"></span>
                            </div>
                            <div class="des_choice">
                                <span class="fl" id="typeName2"></span>
                                
                            </div>
                        </div>
                        <div class="lim_c">
                        	<span class="fl" id="gmtCreate"></span>
                        </div>
                    </td>
                    <td width="525" align="center" style="border-left:1px solid #eaeaea;" id="liImg1"></td>
                  </tr>
                </table>
            </div>
            <div class="des_border">
                <div class="des_tit">
                	<ul>
                    	<li class="current"><a href="#p_attribute">商家描述</a></li>
                        <li><a href="#p_details">商家照片</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                	
                	<table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">
                      <tr>
                        <td id="storeDescribe"></td>
                        
                      </tr>
                    </table>                                               
                                            
                        
                </div>
          	</div>  
            
            <div class="des_border" id="p_details">
                <div class="des_t">商品照片</div>
                <div class="des_con">
                    <p align="center" id="liImg">
					</p>
                </div>
          	</div>  
            
            
                
          	</div>
           <!--End 特卖 End-->
        <div class="s_right">
        	<div class="r_history">
            	<div class="r_his_t">商家信息有误？</div>
                <ul>
                    <li>
                        <div class="name" style="margin-top: 30px;">请联系我们</div>
                        <div class="price" style="margin-top: 30px;">热线电话：400-400-400</div>
                    </li>
                </ul>
            </div>
          </div> 
        </div>        
   		
    </div>    
    
       
    
    <jsp:include page="../pages/foot.jsp"></jsp:include>
</div>

</body>


<!--[if IE 6]>
<script src="Scripts/zh_cn.js"></script>
<![endif]-->
</html>