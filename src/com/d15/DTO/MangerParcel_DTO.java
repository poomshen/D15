/*
 * @Class : ManagerParcel_DTO
 * @Date : 2016.10.10
 * @Author : 이성준
 * @Desc : 회원과 분양 조인테이블 DTO
 */

package com.d15.DTO;

import java.sql.Date;

public class MangerParcel_DTO {
<<<<<<< HEAD
	private String id ;
	private String  name;
	private String Phone;
	private String email;
	private String addr;
	private int petOk;
=======
	private String id ; // 회원 아이디
	private String  name; // 회원 이름
	private String Phone; // 회원 연락처
	private String email; // 회원 이메일
	private String addr; // 회원 주소 
	private String petOk; // 회원 입양경험여부
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
	private Date reqdate;//승인 신청일
	private Date begdate;// 분양 일
	private String img; // 유기견 이미지
	private String  gender; // 유기견 성별
	private String code;//유기견 견종
	private int count; //조회수
	private int date; // 남은날짜
	private int pc_no; // 분양 번호
	
	public MangerParcel_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	public MangerParcel_DTO(String id, String name, String phone, String email,
			String addr, int petOk, Date reqdate, Date begdate, String img,
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
	public int getPetOk() {
		return petOk;
	}
	public void setPetOk(int petOk) {
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
