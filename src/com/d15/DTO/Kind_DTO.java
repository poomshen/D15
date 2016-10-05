/*
 * @Class : Kind_DTO
 * @Date : 2016.10.5
 * @Author : 박문수
 * @Desc : 펫 또는 유기견의 견종을   DTO 정의
 * 
 * */

package com.d15.DTO;

public class Kind_DTO {
	private int k_code; // 견종코드
	private String k_kind; // 견종
	public int getK_code() {
		return k_code;
	}
	public void setK_code(int k_code) {
		this.k_code = k_code;
	}
	public String getK_kind() {
		return k_kind;
	}
	public void setK_kind(String k_kind) {
		this.k_kind = k_kind;
	}
	
	
	@Override
	public String toString() {
		return "Kind_DTO [k_code=" + k_code + ", k_kind=" + k_kind + "]";
	}
	
	
}
