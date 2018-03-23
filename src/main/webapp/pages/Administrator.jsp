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
	
	function delete_cfm(d){
			var msg = "确认删除吗？";
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
	function check_page(){
		var i = $("#page");
		   if(!(/^[1-9]\d*$|^0$/.test(i.val()))){ 
		       alert("请输入正确页码格式！");
		       i.val("1");
		   }else{
		   }
		   
	}
	function seachByNum(obj) {
		var $Num =$(obj).prev().val();
		alert("搜索不到"+$Num);
		
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
                <input type="text" value="" placeholder="输入商户准确电话号并查询" class="m_ipt" />
                <button class="m_btn" onclick="seachByNum(this);">搜索</button>
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
                	<select class="jj" name="order1">
                      <option value="&" selected="selected">任意</option>
                      <option value="1">餐饮</option>
                      <option value="2">服装</option>
                      <option value="3">汽车</option>
                      <option value="4">房产</option>
                    </select>
                </td>
                <td width="100" align="right">商户名字</td> 
                <td width="220">
                	<input style="width: 90%;" value=""/>
                </td>
                <td><button class="btn_u">点击查找</button></td>
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
                	<button class="btn_u" onclick="window.location.href='Administrator_Insert.jsp'">添加新商户</button>
                </td>
                <td width="15%" style="font-family:'宋体'; padding:5px;">
                	<button class="btn_u" onclick="window.location.href='Administrator_Insert_Type.jsp'">添加新分类</button>
                </td>
                <td width="70%" style="font-family:'宋体'; padding:5px;">
                	<button class="btn_u" onclick="window.location.href='Administrator_Notice.jsp'">修改公告</button>
                </td>
              </tr>
            </table>
            <p></p>
            <div class="mem_tit1">商户</div>
            <table border="0" class="order_tab" style="width:1100px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
              <tr>
              	<td width="10%" height="30">商户ID</td>
                <td width="20%">商户名称</td>
                <td width="30%">地址</td>
                <td width="20%">商家电话</td>
                <td width="20%">操作</td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">dsasfadfh</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button onclick="window.location.href='Administrator_Update.jsp'">查/改</button>&nbsp;
                	<button onclick="delete_cfm(this);">删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td height="30">1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button onclick="window.location.href='Administrator_Update.jsp'">查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td height="30">1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td height="30">1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <tr>
              	<td>1</td>
                <td><font color="#ff4e00">2015092823056</font></td>
                <td>四川省成都市。。。。。。。。</td>
                <td>13312341234</td>
                <td>
                	<button>查/改</button>&nbsp;
                	<button>删&nbsp;除</button>
                </td>
              </tr>
              <!--翻页 start-->
              <tr>
              	<td align="right" colspan="5" height="30">
              		 <!--最大页数-->
              		<input type="hidden" id="max_page" value="null" />
              		 <!--当前页数-->
              		<input type="hidden" id="now_page" value="null" />
              		 <!--总共条数-->
              		<input type="hidden" id="count" value="null" />
              		搜索到50条&nbsp;&nbsp;共20页&nbsp;&nbsp;
              		<button>上一页</button>
              		<button>下一页</button>&nbsp;&nbsp;&nbsp;&nbsp;
              		当前页数：
              		<input id="page" style="width: 40px;" value="1" />
              		<button onclick="check_page();">点击跳转</button>
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