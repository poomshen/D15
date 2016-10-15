/*
 * @Class : Message_DTO
 * @Date : 2016.10.13
 * @Author : 이성준
 * @Desc : 메세지 테이블에 대한 DTO
 */


package com.d15.DTO;

import java.sql.Date;

public class Message_DTO {
	private String m_id;
	private int mes_no;
	private int m_no;
	private String mes_content;
	private Date mes_date;
	private int mes_send;
	private String mes_check;
	
	public Message_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Message_DTO(int mes_no, int m_no, String mes_content, Date mes_date, int mes_send, String mes_check) {
		super();
		this.mes_no = mes_no;
		this.m_no = m_no;
		this.mes_content = mes_content;
		this.mes_date = mes_date;
		this.mes_send = mes_send;
		this.mes_check = mes_check;
	}
	
	


	public Message_DTO(int m_no, String mes_content, Date mes_date, String mes_check) {
		super();
		this.m_no = m_no;
		this.mes_content = mes_content;
		this.mes_date = mes_date;
		this.mes_check = mes_check;
	}

	

	public Message_DTO(String mes_content, Date mes_date, int mes_send, String mes_check) {
		super();
		this.mes_content = mes_content;
		this.mes_date = mes_date;
		this.mes_send = mes_send;
		this.mes_check = mes_check;
	}

	

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getMes_no() {
		return mes_no;
	}
	public void setMes_no(int mes_no) {
		this.mes_no = mes_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getMes_content() {
		return mes_content;
	}
	public void setMes_content(String mes_content) {
		this.mes_content = mes_content;
	}
	public Date getMes_date() {
		return mes_date;
	}
	public void setMes_date(Date mes_date) {
		this.mes_date = mes_date;
	}
	public int getMes_send() {
		return mes_send;
	}
	public void setMes_send(int mes_send) {
		this.mes_send = mes_send;
	}
	public String getMes_check() {
		return mes_check;
	}
	public void setMes_check(String mes_check) {
		this.mes_check = mes_check;
	}
	
	
	
}
