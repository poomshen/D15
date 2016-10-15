/*
 * @Class : Board_DTO
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : 게시판 페이지에서 사용할  DTO 정의
 * 
 * */

package com.d15.DTO;

import java.sql.Date;


public class Board_DTO {
	private int b_no;		//게시물번호
	private int m_no;		//회원번호
	private String b_name;
	private String b_content;
	private int b_count;
	private String b_file;
	private Date b_date;
	private int b_ref;		//참조
	private int b_depth;	//들여쓰기
	private int b_step;		//글순서
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_file() {
		return b_file;
	}
	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	
	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_depth() {
		return b_depth;
	}
	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	@Override
	public String toString() {
		return "Board_DTO [b_no=" + b_no + ", m_no=" + m_no + ", b_name=" + b_name + ", b_content=" + b_content
				+ ", b_count=" + b_count + ", b_file=" + b_file + ", b_date=" + b_date + ", b_ref=" + b_ref
				+ ", b_depth=" + b_depth + ", b_step=" + b_step + ", getB_no()=" + getB_no() + ", getM_no()="
				+ getM_no() + ", getB_name()=" + getB_name() + ", getB_content()=" + getB_content() + ", getB_count()="
				+ getB_count() + ", getB_file()=" + getB_file() + ", getB_date()=" + getB_date() + ", getB_ref()="
				+ getB_ref() + ", getB_depth()=" + getB_depth() + ", getB_step()=" + getB_step() + "]";
	}
	
	
}