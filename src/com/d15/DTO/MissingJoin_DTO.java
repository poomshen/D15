/*
 * @Class : MissingJoin_DTO
 * @Date : 2016.10.6
 * @Author : 박문수
 * @Desc : 실종신고 게시판   멤버,펫,실종신고 테이블 조인 DTO 정의
 * 
 * */
package com.d15.DTO;

import java.sql.Date;

public class MissingJoin_DTO {
	private int mis_no; //게시판 번호
	private String p_image; // 펫 사진
	private String m_id; // 회원 아이디
	private Date mis_date; // 실종 날짜
	private String mis_loc; // 실종 위치
	private String mis_content; // 내용
	private String mis_pro; // 실종상태
	public int getMis_no() {
		return mis_no;
	}
	public void setMis_no(int mis_no) {
		this.mis_no = mis_no;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getMis_date() {
		return mis_date;
	}
	public void setMis_date(Date mis_date) {
		this.mis_date = mis_date;
	}
	public String getMis_loc() {
		return mis_loc;
	}
	public void setMis_loc(String mis_loc) {
		this.mis_loc = mis_loc;
	}
	public String getMis_content() {
		return mis_content;
	}
	public void setMis_content(String mis_content) {
		this.mis_content = mis_content;
	}
	public String getMis_pro() {
		return mis_pro;
	}
	public void setMis_pro(String mis_pro) {
		this.mis_pro = mis_pro;
	}
	@Override
	public String toString() {
		return "MissingJoin_DTO [mis_no=" + mis_no + ", p_image=" + p_image + ", m_id=" + m_id + ", mis_date="
				+ mis_date + ", mis_loc=" + mis_loc + ", mis_content=" + mis_content + ", mis_pro=" + mis_pro + "]";
	}
	
	
}
