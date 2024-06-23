package com.db;

import java.sql.*;

public class DBconnect {

	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/hospitalDatabase", "postgres", "Q@92");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return con;
	}
}
