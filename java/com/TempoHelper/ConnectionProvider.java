package com.TempoHelper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection conn;

	public static Connection getConnection() {
		try {
			if (conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Tempo", "root", "Mume@143");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
