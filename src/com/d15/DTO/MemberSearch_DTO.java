/*
 * @Class : Missing_DTO.java
 * @Date : 2016.10.8
 * @Author : 길한종
 * @Desc : 마이페이지 DTO 정의
 */

package com.d15.DTO;

public class MemberSearch_DTO {
	
	private int m_no;
	private String m_id;
	private String m_pwd;
	private String m_lastdate;
	private String c_code;
	
	private String m_name;
	private String m_phone;
	private int m_birth;
	private String m_email;
	private String m_addr;
	private String m_daddr;
	private String m_petok;
	private String m_update;
	private String m_regdate;
	
	
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
	public String getM_lastdate() {
		return m_lastdate;
	}
	public void setM_lastdate(String m_lastdate) {
		this.m_lastdate = m_lastdate;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
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
	public String getM_update() {
		return m_update;
	}
	public void setM_update(String m_update) {
		this.m_update = m_update;
	}
	public String getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getM_daddr() {
		return m_daddr;
	}
	public void setM_daddr(String m_daddr) {
		this.m_daddr = m_daddr;
	}
	@Override
	public String toString() {
		return "MemberJoin_DTO [m_no=" + m_no + ", m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_lastdate=" + m_lastdate
				+ ", c_code=" + c_code + ", m_name=" + m_name + ", m_phone=" + m_phone + ", m_birth=" + m_birth
				+ ", m_email=" + m_email + ", m_addr=" + m_addr + ", m_petok=" + m_petok + ", m_update=" + m_update
				+ ", m_regdate=" + m_regdate + ", m_file=" + m_daddr + "]";
	}
	
}
