package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;


public class SpecialistDao {

	private Connection con;

	public SpecialistDao(Connection con) {
		this.con = con;
	}
	
	public boolean addSpecialist(String name) throws Exception {
		boolean res = false;
		
		String query = "insert into specialist(name) values(?)";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, name);
		int i = st.executeUpdate();
		
		if(i==1) {
			res = true;
		}
		
		return res;
	}
	
	public List<Specialist> getSpecialist() throws Exception{
		
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;
		
		String query = "select * from specialist";
		
		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			s = new Specialist();
			s.setId(rs.getInt(1));
			s.setSpecialistName(rs.getString(2));
			list.add(s);
		}
		
		return list;
	}
}
