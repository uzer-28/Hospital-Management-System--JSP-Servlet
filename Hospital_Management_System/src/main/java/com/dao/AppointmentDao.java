package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {

	private Connection con;

	public AppointmentDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addAppointment(Appointment app) throws Exception {

		boolean res = false;

		String query = "insert into appointment(u_id,name, gender, age, date, email, phono, diseases, doctor_id, address, status) values(?,?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, app.getUserId());
		st.setString(2, app.getName());
		st.setString(3, app.getGender());
		st.setInt(4, app.getAge());
		st.setString(5, app.getDate());
		st.setString(6, app.getEmail());
		st.setString(7, app.getPhoNo());
		st.setString(8, app.getDiseases());
		st.setInt(9, app.getDoctorId());
		st.setString(10, app.getAddress());
		st.setString(11, app.getStatus());
		int i = st.executeUpdate();

		if (i == 1) {
			res = true;
		}

		return res;
	}

	public List getAppointmentByDoctorId(int doctorId) throws Exception {

		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;

		String query = "select * from appointment where doctor_id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, doctorId);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			app = new Appointment();					

			app.setId(rs.getInt(1));
			app.setId2(rs.getInt(1));
			app.setUserId(rs.getInt(2));
			app.setName(rs.getString(3));
			app.setGender(rs.getString(4));
			app.setAge(rs.getInt(5));
			app.setDate(rs.getString(6));
			app.setEmail(rs.getString(7));
			app.setPhoNo(rs.getString(8));
			app.setDiseases(rs.getString(9));
			app.setDoctorId(rs.getInt(10));
			app.setAddress(rs.getString(11));
			app.setStatus(rs.getString(12));

			list.add(app);
		}

		return list;
	}

	public List getAppointmentById(int userId) throws Exception {

		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;

		String query = "select * from appointment where u_id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, userId);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			app = new Appointment();
			
			app.setId(rs.getInt(1));
			app.setId2(rs.getInt(1));
			app.setUserId(rs.getInt(2));
			app.setName(rs.getString(3));
			app.setGender(rs.getString(4));
			app.setAge(rs.getInt(5));
			app.setDate(rs.getString(6));
			app.setEmail(rs.getString(7));
			app.setPhoNo(rs.getString(8));
			app.setDiseases(rs.getString(9));
			app.setDoctorId(rs.getInt(10));
			app.setAddress(rs.getString(11));
			app.setStatus(rs.getString(12));

			list.add(app);
		}

		return list;
	}
	
	public Appointment getAppointment(int id) throws Exception {

		Appointment app = null;

		String query = "select * from appointment where id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();

		if (rs.next()) {
		
			app = new Appointment();

			app.setId(rs.getInt(1));
			app.setId2(rs.getInt(1));
			app.setUserId(rs.getInt(2));
			app.setName(rs.getString(3));
			app.setGender(rs.getString(4));
			app.setAge(rs.getInt(5));
			app.setDate(rs.getString(6));
			app.setEmail(rs.getString(7));
			app.setPhoNo(rs.getString(8));
			app.setDiseases(rs.getString(9));
			app.setDoctorId(rs.getInt(10));
			app.setAddress(rs.getString(11));
			app.setStatus(rs.getString(12));
			
		}

		return app;
	}
	
	public boolean updateStatus(int id, int DoctorId, String comm) throws Exception {
		boolean res = false;
		
		String query = "update appointment set status=? where id=? and doctor_id=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, comm);
		st.setInt(2, id);
		st.setInt(3, DoctorId);		
		int i = st.executeUpdate();
		
		if(i == 1) {
			res = true;
		}
		
		return res;
	}
	
	public List getAllAppointment() throws Exception {

		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;

		String query = "select * from appointment order by id desc";

		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			app = new Appointment();
			
			app.setId(rs.getInt(1));
			app.setId2(rs.getInt(1));
			app.setUserId(rs.getInt(2));
			app.setName(rs.getString(3));
			app.setGender(rs.getString(4));
			app.setAge(rs.getInt(5));
			app.setDate(rs.getString(6));
			app.setEmail(rs.getString(7));
			app.setPhoNo(rs.getString(8));
			app.setDiseases(rs.getString(9));
			app.setDoctorId(rs.getInt(10));
			app.setAddress(rs.getString(11));
			app.setStatus(rs.getString(12));

			list.add(app);
		}

		return list;
	}
	
	public int countAppbyDcoId(int id) throws Exception {
		int i =0;
		
		PreparedStatement st = con.prepareStatement("select * from appointment where doctor_id=?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			i++;
		}
		
		return i;
	}
}
