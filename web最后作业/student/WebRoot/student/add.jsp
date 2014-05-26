<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript">
		function check(){
			var realname = document.getElementsByName("realname")[0].value;
			var num = document.getElementsByName("num")[0].value;
			var grade = document.getElementsByName("grade")[0].value;
			var email = document.getElementsByName("email")[0].value;
			if(realname == null || realname == ""){
				alert("姓名不能为空");
				return false;
			}else if(num == null || num == ""){
				alert("学号 不能为空");
				return false;
			}else if(grade == null || grade == ""){
				alert("年级不能为空");
				return false;
			}else if(email == null || email == ""){
				alert("邮箱不能为空");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
    <div align="center">添加学生</div>
    <form action="${pageContext.request.contextPath}/StudentServlet" method="post" onsubmit="return check();">
    	<table width="50%" border="1" align="center">
    		<tr align="center">
    			<td>学号</td>
    			<td><input type="text" name="num"><input type="hidden" name="task" value="add"></td>
    		</tr>
    		<tr align="center">
    			<td>姓名</td>
    			<td><input type="text" name="realname"></td>
    		</tr>
    		<tr align="center">
    			<td>年级</td>
    			<td><input type="text" name="grade"></td>
    		</tr>
    		<tr align="center">
    			<td>邮箱</td>
    			<td><input type="text" name="email"></td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="提交">
    				<input type="reset" value="重置">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
