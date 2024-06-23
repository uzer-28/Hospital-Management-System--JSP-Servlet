package com.entity;

public class Doctor {

	private int id;
	private String name, dob, qualification, speciality, email, mobNo, pass;

	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Doctor(String name, String dob, String qualification, String speciality, String email, String mobNo,
			String pass) {
		super();
		this.name = name;
		this.dob = dob;
		this.qualification = qualification;
		this.speciality = speciality;
		this.email = email;
		this.mobNo = mobNo;
		this.pass = pass;
	}

	public Doctor(int id, String name, String dob, String qualification, String speciality, String email, String mobNo,
			String pass) {

		this.id = id;
		this.name = name;
		this.dob = dob;
		this.qualification = qualification;
		this.speciality = speciality;
		this.email = email;
		this.mobNo = mobNo;
		this.pass = pass;
	}
	
	

	public Doctor(int id, String name, String dob, String qualification, String speciality, String email,
			String mobNo) {
		
		this.id = id;
		this.name = name;
		this.dob = dob;
		this.qualification = qualification;
		this.speciality = speciality;
		this.email = email;
		this.mobNo = mobNo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

}
