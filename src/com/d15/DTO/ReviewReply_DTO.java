/*
 * @Class : ReviewPeply_DTO
 * @Date : 2016.10.12
 * @Author : 조한솔
 * @Desc : 후기게시판에 사용할 펫에 대한  DTO 정의
 * 
 * */

package com.d15.DTO;

import java.sql.Date;

public class ReviewReply_DTO {

	private int rer_no;
	private String m_id;
	private int br_no;
	private String rer_content;
	private String rer_date;
	
	
	public int getRer_no() {
		return rer_no;
	}
	public void setRer_no(int rer_no) {
		this.rer_no = rer_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	public String getRer_content() {
		return rer_content;
	}
	public void setRer_content(String rer_content) {
		this.rer_content = rer_content;
	}
	public String getRer_date() {
		return rer_date;
	}
	public void setRer_date(String rer_date) {
		this.rer_date = rer_date;
	}
	
	@Override
	public String toString() {
		return "ReviewReply_DTO [rer_no=" + rer_no + ", m_id=" + m_id + ", br_no=" + br_no + ", rer_content="
				+ rer_content + ", rer_date=" + rer_date + ", getRer_no()=" + getRer_no() + ", getM_id()=" + getM_id()
				+ ", getBr_no()=" + getBr_no() + ", getRer_content()=" + getRer_content() + ", getRer_date()="
				+ getRer_date() + "]";
	}


	

	
	
}
