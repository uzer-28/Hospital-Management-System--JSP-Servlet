package com.dao;
import java.sql.*;

import com.entity.User;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean insert(User user) {
		
		boolean res = false;
		try {
			String query = "insert into userdata(name, email, pass) values(?, ?, ?)";
			
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, user.getName());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPass());
			
			int i = st.executeUpdate();
			if(i == 1) {
				res = true;
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return res;
	}
	
	public User login(String email, String pass) throws SQLException {
		User user = null;
		
		String query = "select * from userdata where email=? and pass=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, email);
		st.setString(2, pass);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setPass(rs.getString(4));
		}
		
		return user;
	}
	
	public boolean checkPass(int id, String oldPass) throws Exception {
		boolean res = false;
		
		String query = "select * from userdata where id=? and pass=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.setString(2, oldPass);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			res = true;
		}
		
		return res;
	}
	
	public boolean changePass(int id, String newPass) throws Exception {
		boolean res = false;
		
		String query = "update userdata set pass=? where id=? ";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, newPass);
		st.setInt(2, id);
		int i = st.executeUpdate();
		
		if(i == 1) {
			res = true;
		}
		
		return res;
	}

}
