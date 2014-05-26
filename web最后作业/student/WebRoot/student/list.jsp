<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.bean.Student"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		function isSure(){
			if(confirm('确定删除？')){
				return true;
			}else {
				return false;
			}
		}
	</script>
	</head>

	<body>
		<div align="center">
			学生列表
		</div>
		<br />
		<div align="center">
			<a
				href="${pageContext.request.contextPath}/StudentServlet?task=toadd">添加</a>
		</div>
		<table width="50%" border="1" align="center">
			<tr align="center">
				<td>
					学号
				</td>
				<td>
					姓名
				</td>
				<td>
					年级
				</td>
				<td>
					邮箱
				</td>
				<td>
					操作
				</td>
			</tr>

			<%
				List list = (List) request.getAttribute("studentlist");
				for (Object o : list) {
					Student student = (Student) o;
			%>
			<tr align="center">
				<td><%=student.getNum()%></td>
				<td><%=student.getRealname()%></td>
				<td><%=student.getGrade()%></td>
				<td><%=student.getEmail()%></td>
				<td>
					<a href="${pageContext.request.contextPath}/StudentServlet?task=toUpdate&num=<%=student.getNum() %>&realname=<%=student.getRealname()%>&grade=<%=student.getGrade()%>&email=<%=student.getEmail()%>">修改</a>
					<a href="${pageContext.request.contextPath}/StudentServlet?task=del&num=<%=student.getNum() %>" onclick="return isSure();">删除</a>
				</td>
			</tr>
			<%
				}
			%>

		</table>
	</body>
</html>
