/*
 * @Class : Pet_DTO
 * @Date : 2016.10.5
 * @Author : 박문수
 * @Desc : 실종신고 게시판에 사용할 펫에 대한  DTO 정의
 * 
 * */
package com.d15.DTO;

public class Pet_DTO {
	private int p_no; // 펫 번호
	private String p_image; // 펫 사진
	private String p_gender; // 펫 성별
	private String p_color; // 펫 색상
	private String p_feature; // 펫 특징
	private int p_age; // 펫 나이
	private int p_weight; // 펫 체중
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
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
	
	
	@Override
	public String toString() {
		return "Pet_DTO [p_no=" + p_no + ", p_image=" + p_image + ", p_gender=" + p_gender + ", p_color=" + p_color
				+ ", p_feature=" + p_feature + ", p_age=" + p_age + ", p_weight=" + p_weight + "]";
	}
	
	
	
	
}
