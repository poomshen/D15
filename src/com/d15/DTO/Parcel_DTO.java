/*
 * @Class : Parcel_DTO
 * @Date : 2016.10.6
 * @Author : 이성준
 * @Desc : 분양 테이블 DTO
 */

package com.d15.DTO;


import java.sql.Date;

//분양
public class Parcel_DTO {
	int pc_no;
	int m_no;
	int org_no;
	Date fc_reqdate;
	Date fc_begdate;
	Date pc_argdate;
	
	public Parcel_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Parcel_DTO(int pc_no, int m_no, int org_no, Date fc_reqdate) {
		super();
		this.pc_no = pc_no;
		this.m_no = m_no;
		this.org_no = org_no;
		this.fc_reqdate = fc_reqdate;
	}



	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getOrg_no() {
		return org_no;
	}
	public void setOrg_no(int org_no) {
		this.org_no = org_no;
	}
	public Date getFc_reqdate() {
		return fc_reqdate;
	}
	public void setFc_reqdate(Date fc_reqdate) {
		this.fc_reqdate = fc_reqdate;
	}
	public Date getFc_begdate() {
		return fc_begdate;
	}
	public void setFc_begdate(Date fc_begdate) {
		this.fc_begdate = fc_begdate;
	}
	public Date getPc_argdate() {
		return pc_argdate;
	}
	public void setPc_argdate(Date pc_argdate) {
		this.pc_argdate = pc_argdate;
	}
	
	
}
