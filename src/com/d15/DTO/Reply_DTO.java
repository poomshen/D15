package com.d15.DTO;

import java.sql.Date;


public class Reply_DTO {
	private int re_no;
	private int m_no;
	private String re_content;
	private Date re_date;
	private int b_no;
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	@Override
	public String toString() {
		return "Reply_DTO [re_no=" + re_no + ", m_no=" + m_no + ", re_content=" + re_content + ", re_date=" + re_date
				+ ", b_no=" + b_no + ", getRe_no()=" + getRe_no() + ", getM_no()=" + getM_no() + ", getRe_content()="
				+ getRe_content() + ", getRe_date()=" + getRe_date() + ", getB_no()=" + getB_no() + "]";
	}
	
	
	
}
