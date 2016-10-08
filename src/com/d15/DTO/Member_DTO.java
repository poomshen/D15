package com.d15.DTO;

import java.sql.Date;

public class Member_DTO {
	private int m_no;
	private String m_id;
	private String m_pwd;
	private Date m_lastdate;
	private String c_code;
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public Date getM_lastdate() {
		return m_lastdate;
	}
	public void setM_lastdate(Date m_lastdate) {
		this.m_lastdate = m_lastdate;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_lastdate=" + m_lastdate
				+ ", c_code=" + c_code + "]";
	}	
}
