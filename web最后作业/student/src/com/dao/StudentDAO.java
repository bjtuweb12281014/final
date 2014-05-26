package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Student;

public class StudentDAO {
	
	/**
	 * ��ȡѧ���б�
	 * @return
	 */
	public List getList() {
		List list = new ArrayList();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_student";
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){//���������
				Student student = new Student();
				student.setRealname(rs.getString("realname"));
				student.setNum(rs.getString("num"));
				student.setGrade(rs.getString("grade"));
				student.setEmail(rs.getString("email"));
				list.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs != null)rs.close();
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	/**
	 * �ж�ѧ���Ƿ����
	 * @param num
	 * @return
	 */
	public boolean isExist(String num) {
		List list = new ArrayList();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_student where num=?";
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			while(rs.next()){//���������
				Student student = new Student();
				student.setRealname(rs.getString("realname"));
				student.setNum(rs.getString("num"));
				student.setGrade(rs.getString("grade"));
				student.setEmail(rs.getString("email"));
				list.add(student);
			}
			if(list.size()>=1){//˵���Ѿ�����
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs != null)rs.close();
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * ���ѧ����Ϣ
	 * @param student
	 * ����0������ɹ�   1������ʧ��  2��ѧ���Ѵ���
	 */
	public int save(Student student) {
		if(isExist(student.getNum())){
			return 2;
		}
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into t_student(realname,num,grade,email) values(?,?,?,?)";
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, student.getRealname());
			ps.setString(2, student.getNum());
			ps.setString(3, student.getGrade());
			ps.setString(4, student.getEmail());
			ps.execute();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 1;
	}

	/**
	 * �޸�ѧ����ѧ�Ų����޸ģ�������Ϣ���޸�
	 * @param student
	 * @return
	 */
	public boolean update(Student student){
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update t_student set realname=?,grade=?,email=? where num=?";
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, student.getRealname());
			ps.setString(2, student.getGrade());
			ps.setString(3, student.getEmail());
			ps.setString(4, student.getNum());
			ps.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * ɾ��ѧ��������ѧ��ɾ��
	 * @param student
	 * @return
	 */
	public boolean delete(String num){
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "delete from t_student where num=?";
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			ps.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


}
