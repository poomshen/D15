/*
 * @Class : MissingJoin_DTO
 * @Date : 2016.10.17
 * @Author : 이성준
 * @Desc : 마이페이지 분양 테이블 조인 DTO 정의
 * 
 * */
package com.d15.DTO;

import java.sql.Date;

public class Myparcel_DTO {
	int pc_no;//
	Date pc_reqdate;
	Date pc_begdate;
	String org_img;
	String org_gender;
	String org_code;
	String org_situatton;
	String st_no;
	String org_addr;
	Date pc_argdate;
	
	public Myparcel_DTO() {
	// TODO Auto-generated constructor stub
	}
	
	
	


	public Myparcel_DTO(int pc_no, Date pc_reqdate, Date pc_begdate,
			String org_img, String org_gender, String org_code,
			String org_situatton, String st_no, String org_addr, Date pc_argdate) {
		super();
		this.pc_no = pc_no;
		this.pc_reqdate = pc_reqdate;
		this.pc_begdate = pc_begdate;
		this.org_img = org_img;
		this.org_gender = org_gender;
		this.org_code = org_code;
		this.org_situatton = org_situatton;
		this.st_no = st_no;
		this.org_addr = org_addr;
		this.pc_argdate = pc_argdate;
	}





	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	public Date getPc_reqdate() {
		return pc_reqdate;
	}
	public void setPc_reqdate(Date pc_reqdate) {
		this.pc_reqdate = pc_reqdate;
	}
	public Date getPc_begdate() {
		return pc_begdate;
	}
	public void setPc_begdate(Date pc_begdate) {
		this.pc_begdate = pc_begdate;
	}
	public String getOrg_img() {
		return org_img;
	}
	public void setOrg_img(String org_img) {
		this.org_img = org_img;
	}
	public String getOrg_gender() {
		return org_gender;
	}
	public void setOrg_gender(String org_gender) {
		this.org_gender = org_gender;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getOrg_situatton() {
		return org_situatton;
	}
	public void setOrg_situatton(String org_situatton) {
		this.org_situatton = org_situatton;
	}
	public String getSt_no() {
		return st_no;
	}
	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
	public String getOrg_addr() {
		return org_addr;
	}
	public void setOrg_addr(String org_addr) {
		this.org_addr = org_addr;
	}





	public Date getPc_argdate() {
		return pc_argdate;
	}





	public void setPc_argdate(Date pc_argdate) {
		this.pc_argdate = pc_argdate;
	}
	
	
	
}
