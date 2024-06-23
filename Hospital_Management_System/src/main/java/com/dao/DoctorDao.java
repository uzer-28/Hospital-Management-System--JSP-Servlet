package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {

	private Connection con;

	public DoctorDao(Connection con) {
		this.con = con;
	}

	public boolean addDcotor(Doctor doc) throws Exception {

		boolean res = false;
		String query = "insert into doctor(name, dob, qualification, speciality, email, mobno, pass) values (?,?,?,?,?,?,?)";

		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, doc.getName());
		st.setString(2, doc.getDob());
		st.setString(3, doc.getQualification());
		st.setString(4, doc.getSpeciality());
		st.setString(5, doc.getEmail());
		st.setString(6, doc.getMobNo());
		st.setString(7, doc.getPass());

		int i = st.executeUpdate();

		if (i == 1) {
			res = true;
		}

		return res;
	}

	public List getDoctor() throws Exception {

		List<Doctor> list = new ArrayList<Doctor>();
		Doctor doc = null;

		String query = "select * from doctor";

		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			doc = new Doctor();

			doc.setId(rs.getInt(1));
			doc.setName(rs.getString(2));
			doc.setDob(rs.getString(3));
			doc.setQualification(rs.getString(4));
			doc.setSpeciality(rs.getString(5));
			doc.setEmail(rs.getString(6));
			doc.setMobNo(rs.getString(7));
			doc.setPass(rs.getString(8));

			list.add(doc);
		}

		return list;
	}

	public Doctor getDoctorById(int id) throws Exception {

		Doctor doc = null;

		String query = "select * from doctor where id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			doc = new Doctor();

			doc.setId(rs.getInt(1));
			doc.setName(rs.getString(2));
			doc.setDob(rs.getString(3));
			doc.setQualification(rs.getString(4));
			doc.setSpeciality(rs.getString(5));
			doc.setEmail(rs.getString(6));
			doc.setMobNo(rs.getString(7));
			doc.setPass(rs.getString(8));
		}

		return doc;
	}
	
	public boolean updateDcotor(Doctor doc) throws Exception {

		boolean res = false;
		String query = "update doctor set name=?, dob=?, qualification=?, speciality=?, email=?, mobno=?, pass=? where id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, doc.getName());
		st.setString(2, doc.getDob());
		st.setString(3, doc.getQualification());
		st.setString(4, doc.getSpeciality());
		st.setString(5, doc.getEmail());
		st.setString(6, doc.getMobNo());
		st.setString(7, doc.getPass());
		st.setInt(8, doc.getId());

		int i = st.executeUpdate();

		if (i == 1) {
			res = true;
		}

		return res;
	}
	
	public boolean deleteDoctor(int id) throws Exception{
		boolean res = false;
		
		String query = "delete from doctor where id=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		int i = st.executeUpdate();
		
		if(i == 1) {
			res= true;
		}
		
		return res;
	}
	
	public Doctor login(String email, String pass) throws Exception{
		Doctor doc = null;
		
		String query = "select * from doctor where email=? and pass=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, email);
		st.setString(2, pass);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			doc = new Doctor();

			doc.setId(rs.getInt(1));
			doc.setName(rs.getString(2));
			doc.setDob(rs.getString(3));
			doc.setQualification(rs.getString(4));
			doc.setSpeciality(rs.getString(5));
			doc.setEmail(rs.getString(6));
			doc.setMobNo(rs.getString(7));
			doc.setPass(rs.getString(8));
		}
		return doc;
		
	}
	
	public int countDoctor() throws Exception {
		int i = 0;
		
		PreparedStatement st = con.prepareStatement("select * from doctor");
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			i++;
		}
		
		return i;
	}
	
	public int countUser() throws Exception {
		int i = 0;
		
		PreparedStatement st = con.prepareStatement("select * from userdata");
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			i++;
		}
		
		return i;
	}
	
	public int countSpecialist() throws Exception {
		int i = 0;
		
		PreparedStatement st = con.prepareStatement("select * from specialist");
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			i++;
		}
		
		return i;
	}
	
	public int countAppointment() throws Exception {
		int i = 0;
		
		PreparedStatement st = con.prepareStatement("select * from appointment");
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			i++;
		}
		
		return i;
	}
	
	public boolean checkPass(int id, String oldPass) throws Exception {
		boolean res = false;
		
		String query = "select * from doctor where id=? and pass=?";
		
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
		
		String query = "update doctor set pass=? where id=? ";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, newPass);
		st.setInt(2, id);
		int i = st.executeUpdate();
		
		if(i == 1) {
			res = true;
		}
		
		return res;
	}
	
	public boolean editDcotor(Doctor doc) throws Exception {

		boolean res = false;
		String query = "update doctor set name=?, dob=?, qualification=?, speciality=?, email=?, mobno=? where id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, doc.getName());
		st.setString(2, doc.getDob());
		st.setString(3, doc.getQualification());
		st.setString(4, doc.getSpeciality());
		st.setString(5, doc.getEmail());
		st.setString(6, doc.getMobNo());
		st.setInt(7, doc.getId());

		int i = st.executeUpdate();

		if (i == 1) {
			res = true;
		}

		return res;
	}
}
