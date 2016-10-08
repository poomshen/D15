/*
 * @Class : MissingDetail_DTO
 * @Date : 2016.10.7
 * @Author : 박문수
 * @Desc : 상세 페이지   DTO 정의
 * 
 * */

package com.d15.DTO;

import java.sql.Date;

public class MissingDetail_DTO {
	private int mis_no; // 게시판 번호
	private String p_image; // 펫 사진 
	private String m_id; // 멤버 아이디 
	private String k_kind; // 견종 
	private String p_gender; // 성별 
	private String p_color; // 색상 
	private String p_feature; // 특징 
	private int p_age; // 펫 나이
	private int p_weight; //펫 체중
	private Date mis_date; // 실종 날짜 
	private String mis_loc; // 실종 위치
	private String mis_content; // 내용
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
	public String getK_kind() {
		return k_kind;
	}
	public void setK_kind(String k_kind) {
		this.k_kind = k_kind;
	}
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getP_feature() {
		return p_feature;
	}
	public void setP_feature(String p_feature) {
		this.p_feature = p_feature;
	}
	public int getP_age() {
		return p_age;
	}
	public void setP_age(int p_age) {
		this.p_age = p_age;
	}
	public int getP_weight() {
		return p_weight;
	}
	public void setP_weight(int p_weight) {
		this.p_weight = p_weight;
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
	@Override
	public String toString() {
		return "MissingDetail_DTO [mis_no=" + mis_no + ", p_image=" + p_image + ", m_id=" + m_id + ", k_kind=" + k_kind
				+ ", p_gender=" + p_gender + ", p_color=" + p_color + ", p_feature=" + p_feature + ", p_age=" + p_age
				+ ", p_weight=" + p_weight + ", mis_date=" + mis_date + ", mis_loc=" + mis_loc + ", mis_content="
				+ mis_content + "]";
	}
	
	
	
}
