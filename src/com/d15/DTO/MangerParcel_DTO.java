package com.d15.DTO;

import java.sql.Date;

public class MangerParcel_DTO {
	private String id ;
	private String  name;
	private String Phone;
	private String email;
	private String addr;
	private String petOk;
	private Date reqdate;//승인 신청일
	private Date begdate;// 분양 일
	private String img;
	private String  gender;
	private String code;//품종
	private int count;
	private int date;
	private int pc_no;
	
	public MangerParcel_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	public MangerParcel_DTO(String id, String name, String phone, String email,
			String addr, String petOk, Date reqdate, Date begdate, String img,
			String gender, String code, int count, int date) {
		super();
		this.id = id;
		this.name = name;
		Phone = phone;
		this.email = email;
		this.addr = addr;
		this.petOk = petOk;
		this.reqdate = reqdate;
		this.begdate = begdate;
		this.img = img;
		this.gender = gender;
		this.code = code;
		this.count = count;
		this.date = date;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPetOk() {
		return petOk;
	}
	public void setPetOk(String petOk) {
		this.petOk = petOk;
	}
	public Date getReqdate() {
		return reqdate;
	}
	public void setReqdate(Date reqdate) {
		this.reqdate = reqdate;
	}
	public Date getBegdate() {
		return begdate;
	}
	public void setBegdate(Date begdate) {
		this.begdate = begdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}

	public int getPc_no() {
		return pc_no;
	}

	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}  
	
	

}
