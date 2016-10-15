/*
 * @Class : BoardReply_DTO
 * @Date : 2016.10.12
 * @Author : 조한솔
 * @Desc : Q&A 게시판에 댓글을 일력시 사용할  DTO 정의
 * 
 * */

package com.d15.DTO;

import java.sql.Date;

public class BoardReply_DTO {
	
	private int re_no;
	private String m_id;
	private int b_no;
	private String re_content;
	private String re_date;
	
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	@Override
	public String toString() {
		return "Reply_DTO [re_no=" + re_no + ", m_id=" + m_id + ", b_no=" + b_no + ", re_content=" + re_content
				+ ", re_date=" + re_date + "]";
	}
	
}
