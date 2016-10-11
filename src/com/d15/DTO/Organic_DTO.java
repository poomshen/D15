package com.d15.DTO;

public class Organic_DTO {
	int org_no;
	int st_no;
	String org_animal;
	String org_img;
	String org_code;
	String org_gender;
	String org_situation;
	int org_count;
	int org_date;
	String org_desc;
	
	public Organic_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Organic_DTO(String org_animal, String org_img, String org_gender, String org_situation, int org_date ,String org_code) {
		super();
		this.org_animal = org_animal;
		this.org_img = org_img;
		this.org_gender = org_gender;
		this.org_situation = org_situation;
		this.org_date = org_date;
		this.org_code = org_code;
	}


	public Organic_DTO(int st_no, String org_animal, String org_img, String org_code, String org_gender, String org_situation,
			int org_count, int org_date, String org_desc) {
		super();
		this.st_no = st_no;
		this.org_animal = org_animal;
		this.org_img = org_img;
		this.org_code = org_code;
		this.org_gender = org_gender;
		this.org_situation = org_situation;
		this.org_count = org_count;
		this.org_date = org_date;
		this.org_desc = org_desc;
	}




	public int getOrg_no() {
		return org_no;
	}
	public void setOrg_no(int org_no) {
		this.org_no = org_no;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public String getOrg_animal() {
		return org_animal;
	}
	public void setOrg_animal(String org_animal) {
		this.org_animal = org_animal;
	}
	public String getOrg_img() {
		return org_img;
	}
	public void setOrg_img(String org_img) {
		this.org_img = org_img;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getOrg_gender() {
		return org_gender;
	}
	public void setOrg_gender(String org_gender) {
		this.org_gender = org_gender;
	}
	public String getOrg_situation() {
		return org_situation;
	}
	public void setOrg_situation(String org_situation) {
		this.org_situation = org_situation;
	}
	public int getOrg_count() {
		return org_count;
	}
	public void setOrg_count(int org_count) {
		this.org_count = org_count;
	}
	public int getOrg_date() {
		return org_date;
	}
	public void setOrg_date(int org_date) {
		this.org_date = org_date;
	}
	public String getOrg_desc() {
		return org_desc;
	}
	public void setOrg_desc(String org_desc) {
		this.org_desc = org_desc;
	}
	
	
	
}
