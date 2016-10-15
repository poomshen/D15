/*
 * @Class : Review_DTO
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기게시판 페이지에서 사용할  DTO 정의
 * 
 * */

package com.d15.DTO;

import java.sql.Date;

public class Review_DTO {
	private int br_no;		//게시물번호
	private String m_id;		//회원번호
	private String br_name;
	private String br_content;
	private int br_count;
	private String br_file;
	private Date br_date;
	private int br_ref;		//참조
	private int br_depth;	//들여쓰기
	private int br_step;		//글순서
	
	
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public int getBr_count() {
		return br_count;
	}
	public void setBr_count(int br_count) {
		this.br_count = br_count;
	}
	public String getBr_file() {
		return br_file;
	}
	public void setBr_file(String br_file) {
		this.br_file = br_file;
	}
	public Date getBr_date() {
		return br_date;
	}
	public void setBr_date(Date br_date) {
		this.br_date = br_date;
	}
	public int getBr_ref() {
		return br_ref;
	}
	public void setBr_ref(int br_ref) {
		this.br_ref = br_ref;
	}
	public int getBr_depth() {
		return br_depth;
	}
	public void setBr_depth(int br_depth) {
		this.br_depth = br_depth;
	}
	public int getBr_step() {
		return br_step;
	}
	public void setBr_step(int br_step) {
		this.br_step = br_step;
	}
	
	@Override
	public String toString() {
		return "Review_DTO [br_no=" + br_no + ", m_id=" + m_id + ", br_name=" + br_name + ", br_content=" + br_content
				+ ", br_count=" + br_count + ", br_file=" + br_file + ", br_date=" + br_date + ", br_ref=" + br_ref
				+ ", br_depth=" + br_depth + ", br_step=" + br_step + ", getBr_no()=" + getBr_no() + ", getM_id()="
				+ getM_id() + ", getBr_name()=" + getBr_name() + ", getBr_content()=" + getBr_content()
				+ ", getBr_count()=" + getBr_count() + ", getBr_file()=" + getBr_file() + ", getBr_date()="
				+ getBr_date() + ", getBr_ref()=" + getBr_ref() + ", getBr_depth()=" + getBr_depth() + ", getBr_step()="
				+ getBr_step() + "]";
	}
}
