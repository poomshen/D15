/*
 * @Class : Detail_DTO.java
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 회원상세정보 DTO
 */

package com.d15.DTO;

import java.sql.Date;

public class Detail_DTO {
	private int m_no;
	private String m_name;
	private String m_phone;
	private int m_birth;
	private String m_email;
	private String m_addr;
	private String m_petok;
	private Date m_update;
	private Date m_regdate;
	private String m_daddr;
	
	
	public int getM_no() {
		return m_no;
	}


	public void setM_no(int m_no) {
		this.m_no = m_no;
	}


	public String getM_name() {
		return m_name;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	public String getM_phone() {
		return m_phone;
	}


	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}


	public int getM_birth() {
		return m_birth;
	}


	public void setM_birth(int m_birth) {
		this.m_birth = m_birth;
	}


	public String getM_email() {
		return m_email;
	}


	public void setM_email(String m_email) {
		this.m_email = m_email;
	}


	public String getM_addr() {
		return m_addr;
	}


	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}


	public String getM_petok() {
		return m_petok;
	}


	public void setM_petok(String m_petok) {
		this.m_petok = m_petok;
	}


	public Date getM_update() {
		return m_update;
	}


	public void setM_update(Date m_update) {
		this.m_update = m_update;
	}


	public Date getM_regdate() {
		return m_regdate;
	}


	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}


	public String getM_daddr() {
		return m_daddr;
	}


	public void setM_daddr(String m_daddr) {
		this.m_daddr = m_daddr;
	}


	
	
}
