package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConn()throws Exception{
		Connection conn = null;
		String driver = "org.gjt.mm.mysql.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/xues?useUnicode=true&characterEncoding=gbk";
		String userName = "root";
		String pwd = "";
		Class.forName(driver);
		conn = DriverManager.getConnection(url, userName, pwd);
		return conn;
	}
}
