<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.bean.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div align="center">�޸�ѧ��</div>
    <%
    Student student = (Student) request.getAttribute("student");
    %>
    <form action="${pageContext.request.contextPath}/StudentServlet" method="post">
    	<table width="50%" border="1" align="center">
    		<tr align="center">
    			<td>ѧ��</td>
    			<td><input type="text" name="num" readonly="readonly" value="<%=student.getNum()%>"><input type="hidden" name="task" value="update"></td><font color="red">*ѧ�Ų����޸�</font>
    		</tr>
    		<tr align="center">
    			<td>����</td>
    			<td><input type="text" name="realname" value="<%=student.getRealname()%>"></td>
    		</tr>
    		<tr align="center">
    			<td>�꼶</td>
    			<td><input type="text" name="grade" value="<%=student.getGrade()%>"></td>
    		</tr>
    		<tr align="center">
    			<td>����</td>
    			<td><input type="text" name="email" value="<%=student.getEmail()%>"></td>
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
