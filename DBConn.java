package com.jsp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection getMySqlConnection(){
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/board";
			String user = "board";
			String password = "board_4U";

			conn = DriverManager.getConnection(url,user,password);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}
}