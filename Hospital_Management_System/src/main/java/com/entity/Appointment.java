package com.entity;

public class Appointment {

	int id, id2, userId, doctorId, age;
	private String name, gender, date, email, phoNo, diseases, status, address;
	
	public Appointment() {

	}

	public Appointment(String name, String gender, int age, String date, String email, String phoNo, String diseases,
			int doctorId,int userId, String status, String address) {
		super();
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.date = date;
		this.email = email;
		this.phoNo = phoNo;
		this.diseases = diseases;
		this.doctorId = doctorId;
		this.status = status;
		this.address = address;
		this.userId = userId;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getId2() {
		return id2;
	}

	public void setId2(int id) {
		this.id2 = id;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int id) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoNo() {
		return phoNo;
	}

	public void setPhoNo(String phoNo) {
		this.phoNo = phoNo;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
