package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student;
import com.dao.StudentDAO;

public class StudentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		PrintWriter out = response.getWriter();
		String task = request.getParameter("task");
		if("list".equals(task)){
			StudentDAO studentDAO = new StudentDAO();
			List list = studentDAO.getList();
			request.setAttribute("studentlist", list);
			request.getRequestDispatcher("/student/list.jsp").forward(request, response);
			
		}else if("add".equals(task)){
			StudentDAO studentDAO = new StudentDAO();
			Student student = new Student();
			student.setRealname(request.getParameter("realname"));
			student.setNum(request.getParameter("num"));
			student.setGrade(request.getParameter("grade"));
			student.setEmail(request.getParameter("email"));
			int i = studentDAO.save(student);
			if(i == 0){
				out.print("<script>if(confirm('添加成功，是否继续添加？')){location.href='"+request.getContextPath()+"/student/add.jsp';}else{location.href='"+request.getContextPath()+"/StudentServlet?task=list';}</script>");
			}else if(i == 1){
				out.print("<script>alert('添加失败！请联系管理员！');location.href='"+request.getContextPath()+"/StudentServlet?task=list';</script>");
			}else if(i == 2){
				out.print("<script>alert('添加失败！学号已经存在！');location.href='"+request.getContextPath()+"/StudentServlet?task=list';</script>");
			}
		}else if("update".equals(task)){
			StudentDAO studentDAO = new StudentDAO();
			Student student = new Student();
			student.setRealname(request.getParameter("realname"));
			student.setNum(request.getParameter("num"));
			student.setGrade(request.getParameter("grade"));
			student.setEmail(request.getParameter("email"));
			studentDAO.update(student);
			out.print("<script>alert('修改成功!');location.href='"+request.getContextPath()+"/StudentServlet?task=list';</script>");
		}else if("del".equals(task)){
			StudentDAO studentDAO = new StudentDAO();
			String num = request.getParameter("num");
			studentDAO.delete(num);
			out.print("<script>alert('删除成功!');location.href='"+request.getContextPath()+"/StudentServlet?task=list';</script>");
		}else if("toadd".equals(task)){
			request.getRequestDispatcher("/student/add.jsp").forward(request, response);
		}else if("toUpdate".equals(task)){
			Student student = new Student();
			student.setRealname(request.getParameter("realname"));
			student.setNum(request.getParameter("num"));
			student.setGrade(request.getParameter("grade"));
			student.setEmail(request.getParameter("email"));
			request.setAttribute("student", student);
			request.getRequestDispatcher("/student/update.jsp").forward(request, response);
			
		}
		out.flush();
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
