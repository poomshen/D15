/*
 * @Class : Missing_DTO
 * @Date : 2016.10.5
 * @Author : 박문수
 * @Desc : 실종신고 게시판   DTO 정의
 * 
 * */

package com.d15.DTO;

import java.util.Date;

public class Missing_DTO {
	private int mis_no; // 게시물 번호
	private Date mis_date; // 실종 날짜
	private String mis_loc; // 실종 위치
	private int mis_count; // 조회수
	private String mis_content; // 내용
	private String mis_pro; // 처리 상태
	public int getMis_no() {
		return mis_no;
	}
	public void setMis_no(int mis_no) {
		this.mis_no = mis_no;
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
	public int getMis_count() {
		return mis_count;
	}
	public void setMis_count(int mis_count) {
		this.mis_count = mis_count;
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
		return "Missing_DTO [mis_no=" + mis_no + ", mis_date=" + mis_date + ", mis_loc=" + mis_loc + ", mis_count="
				+ mis_count + ", mis_content=" + mis_content + ", mis_pro=" + mis_pro + "]";
	}
	
	
}
