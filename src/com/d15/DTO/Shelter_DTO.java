/*
 * @Class : Shelter_DTO.java
 * @Date : 2016.10.10
 * @Author : 길한종
 * @Desc : 보호소 DTO 정의
 */

package com.d15.DTO;

public class Shelter_DTO {
	private int st_no;
	private String st_phone;
	private String st_loc;
	private String st_name;
	private String st_mgr;
	private String st_mgrphone;
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public String getSt_phone() {
		return st_phone;
	}
	public void setSt_phone(String st_phone) {
		this.st_phone = st_phone;
	}
	public String getSt_loc() {
		return st_loc;
	}
	public void setSt_loc(String st_loc) {
		this.st_loc = st_loc;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getSt_mgr() {
		return st_mgr;
	}
	public void setSt_mgr(String st_mgr) {
		this.st_mgr = st_mgr;
	}
	public String getSt_mgrphone() {
		return st_mgrphone;
	}
	public void setSt_mgrphone(String st_mgrphone) {
		this.st_mgrphone = st_mgrphone;
	}
	@Override
	public String toString() {
		return "Shelter_DTO [st_no=" + st_no + ", st_phone=" + st_phone + ", st_loc=" + st_loc + ", st_name=" + st_name
				+ ", st_mgr=" + st_mgr + ", st_mgrphone=" + st_mgrphone + "]";
	}
}
