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
				alert("��������Ϊ��");
				return false;
			}else if(num == null || num == ""){
				alert("ѧ�� ����Ϊ��");
				return false;
			}else if(grade == null || grade == ""){
				alert("�꼶����Ϊ��");
				return false;
			}else if(email == null || email == ""){
				alert("���䲻��Ϊ��");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
    <div align="center">���ѧ��</div>
    <form action="${pageContext.request.contextPath}/StudentServlet" method="post" onsubmit="return check();">
    	<table width="50%" border="1" align="center">
    		<tr align="center">
    			<td>ѧ��</td>
    			<td><input type="text" name="num"><input type="hidden" name="task" value="add"></td>
    		</tr>
    		<tr align="center">
    			<td>����</td>
    			<td><input type="text" name="realname"></td>
    		</tr>
    		<tr align="center">
    			<td>�꼶</td>
    			<td><input type="text" name="grade"></td>
    		</tr>
    		<tr align="center">
    			<td>����</td>
    			<td><input type="text" name="email"></td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="�ύ">
    				<input type="reset" value="����">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
