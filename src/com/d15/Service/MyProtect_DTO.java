package com.d15.Service;

import java.sql.Date;

public class MyProtect_DTO {
	int pr_no;//
	Date pr_reqdate;
	Date pr_argdate;
	Date pr_begdate;
	Date  pr_enddate;
	String org_img;
	String org_gender;
	String org_code;
	String org_situatton;
	String st_no;
	String org_addr;
	
	public MyProtect_DTO() {
		// TODO Auto-generated constructor stub
	}

	public MyProtect_DTO(int pr_no, Date pr_reqdate, Date pr_argdate,
			Date pr_begdate, Date pr_enddate, String org_img,
			String org_gender, String org_code, String org_situatton,
			String st_no, String org_addr) {
		super();
		this.pr_no = pr_no;
		this.pr_reqdate = pr_reqdate;
		this.pr_argdate = pr_argdate;
		this.pr_begdate = pr_begdate;
		this.pr_enddate = pr_enddate;
		this.org_img = org_img;
		this.org_gender = org_gender;
		this.org_code = org_code;
		this.org_situatton = org_situatton;
		this.st_no = st_no;
		this.org_addr = org_addr;
	}

	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}

	public Date getPr_reqdate() {
		return pr_reqdate;
	}

	public void setPr_reqdate(Date pr_reqdate) {
		this.pr_reqdate = pr_reqdate;
	}

	public Date getPr_argdate() {
		return pr_argdate;
	}

	public void setPr_argdate(Date pr_argdate) {
		this.pr_argdate = pr_argdate;
	}

	public Date getPr_begdate() {
		return pr_begdate;
	}

	public void setPr_begdate(Date pr_begdate) {
		this.pr_begdate = pr_begdate;
	}

	public Date getPr_enddate() {
		return pr_enddate;
	}

	public void setPr_enddate(Date pr_enddate) {
		this.pr_enddate = pr_enddate;
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
	
}
