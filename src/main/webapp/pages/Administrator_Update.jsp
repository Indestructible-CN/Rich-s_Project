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
	
	function update_cfm(){
		var msg = "确认修改吗？";
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
	function delete_cfm(obj){
		var msg = "确认修改吗？";
		if(confirm(msg)==true){
		var $adress =$(obj).next().val();
		alert($adress);
		/*$.post("DeleteStudentsById?stuId="+$id,null,function(data){
        alert(data);
        window.location.href="SelectAllStudents?page="+${stupage};
    	});*/
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
        <div class="m_logo"><a href="../index.jsp"><img src="../Picture/logo1.png" /></a></div>
        
        
    </div>
</div>
<!--End Header End--> 
<div class="i_bg bg_color">
	<div class="m_content">
		<div class="m_all">
			<div class="mem_tit1">
				<button style="background-color: orange;" class="m_btn" onclick="window.location.href='Administrator.jsp'">返回搜索</button>
			</div>
			<h2 align="center">修改商户信息</h2>
            <div class="mem_tit1">商户信息</div>
           
            <table id="tab1" border="0" class="order_tab" style="width:1100px; text-align:center; cellspacing="0" cellpadding="0">
              <tr>
              	<td width="30%" height="30">商户ID</td>
                <td width="70%" align="left">1</td>
              </tr>
              <tr>
              	<td width="30%" height="30">商家名称</td>
                <td width="70%" align="left">
               		<input type="text" id="" name="" value="彭德莱火锅店"/>
                </td>
              </tr>
              <tr>
              	<td width="30%" height="30">商户所属分类</td>
                <td width="70%" align="left">
                <select>
                	<option value="1">美食</option>
                	<option value="1" >美妆</option>
                </select>
                </td>
              </tr>
              <tr>
              	<td width="30%" height="30">商户电话</td>
                <td width="70%" align="left">
					<input type="text" id="" name="" value="13312341234"/>
				</td>
              </tr>
              <tr>
              	<td width="30%" height="30">商户地址</td>
                <td width="70%" align="left">
                	<input type="text" id="" name="" value="四川省成都市6666666"/>
                </td>
              </tr>
              <tr>
              	<td width="30%" height="30">创建时间</td>
                <td width="70%" align="left">2018-2-14 12:45:25</td>
              </tr>
              <tr>
              	<td width="30%" height="30">修改时间</td>
                <td width="70%" align="left">2018-2-14 12:45:25</td>
              </tr>
              <tr>
              	<td width="30%" height="30">商户描述</td>
                <td width="70%" align="left">
                	<textarea style="resize: none;" placeholder="最大长度100" maxlength="100"  rows="5px" cols="80px">暗示法iOSA货佛啊胡搜分红按时发货哦啊是欧式风</textarea>
                </td>
              </tr>
            </table>
            <div class="mem_tit1">
				<button onclick="update_cfm();" style="background-color: orange;" class="m_btn">&nbsp;修&nbsp;&nbsp;改&nbsp;</button>
			</div>
            <div class="mem_tit1">商户图片</div>
            <table id="tab1" border="0" class="order_tab" style="width:1100px; text-align:center; margin-bottom:50px;" cellspacing="0" cellpadding="0">
            	<tr>
            		<td width="50%" height="auto">
            		<h1>主图</h1>
            			<img src="../Picture/fre_1.jpg" alt="" /><br />
            			<button onclick="delete_cfm(this);">删除</button>
            			<input type="hidden" value="1"/>
            		</td>
            		<td width="50%" height="auto">
            			<img src="../Picture/fre_1.jpg" alt="" /><br />
            			<button onclick="delete_cfm(this);">删除</button>
            			<input type="hidden" value="2"/>
            		</td>
            	</tr>
            	<tr>
            		<td width="50%" height="auto">
            			<img src="../Picture/fre_b1.jpg" alt="" /><br />
            			<button onclick="delete_cfm(this);">删除</button>
            			<input type="hidden" value="3"/>
            		</td>
            		<td width="50%" height="auto">
            			<img src="../Picture/fre_b2.jpg" alt="" /><br />
            			<button onclick="delete_cfm(this);">删除</button>
            			<input type="hidden" value="4"/>
            		</td>
            	</tr>
            	<tr>
            		<td width="50%" height="auto">
            			<img src="../Picture/fre_b1.jpg" alt="" /><br />
            			<button onclick="delete_cfm(this);">删除</button>
            			<input type="hidden" value="5"/>
            		</td>
            		<td width="50%" height="auto">
            			暂无图片
            		</td>
            	</tr>
            	<tr>
            		<td width="50%" height="auto" colspan="2">
            			<form id="imgForm" action="" enctype="multipart/form-data">
            				<input type="file" id="file_input" onchange="loadImg(this);" style="border: 1px solid; height: 22px; width: 400px; margin-bottom: 10px;"/>
            				<input type="hidden" value=""/><br />
            				<button>上传图片</button>
            			</form>
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