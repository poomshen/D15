/*
 * @Class : D15_Property_animalKey
 * @Date : 2016.10.6
 * @Author : 이성준
 * @Desc : 키값 가지고 있는 property
 */



package com.d15.keyURL;

import java.util.Properties;

public class D15_Property_animalKey {
	static D15_Property_animalKey key;
	public static Properties ptAnimalKey =null;
	
	
	public static D15_Property_animalKey init(){
		if(ptAnimalKey == null){
		ptAnimalKey = new Properties();
		key = new D15_Property_animalKey();
		
		//공공데이터 인증 키 값 
		ptAnimalKey.setProperty("Key", "IKwk30HjaqKfkwD9wb%2BEhqEnjKZqdoWTAE9HDdX93yiDxn0COn1RfvCM9rtoHlkOmt061JjZyZXGTM73vtB%2B%2FA%3D%3D");
		
		//이 조건은 모든 조회에 적용 된다.
		ptAnimalKey.setProperty("검색건수", "numOfRows");
		ptAnimalKey.setProperty("페이지번호", "pageNo");
		ptAnimalKey.setProperty("시군구상위코드", "upr_cd");//지역의 시,군,구 조건
		ptAnimalKey.setProperty("시도코드", "upr_cd");//지역 시 조건
		ptAnimalKey.setProperty("시군구코드", "org_cd");//시군구 조건
		ptAnimalKey.setProperty("kind축종코드", "up_kind_cd");
		ptAnimalKey.setProperty("유기날짜_시작", "bgnde");
		ptAnimalKey.setProperty("유기날짜_종료", "endde");
		ptAnimalKey.setProperty("축종코드", "upkind");
		ptAnimalKey.setProperty("품종코드", "kind");
		ptAnimalKey.setProperty("보호소번호", "care_reg_no");
		ptAnimalKey.setProperty("상태", "state");
		
		//유기동물조회 조회조건의 '시도'조건	동물보호관리시스템의 유기동물조회 조회조건의 '시도'조건을 가져올 수 있다
		ptAnimalKey.setProperty("sido", "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido?ServiceKey=");
		
		//유기동물조회 조회조건의 '시군구'조건	동물보호관리시스템의 유기동물조회 조회조건의 '시군구'조건을 가져올 수 있다.
		ptAnimalKey.setProperty("sigungu","http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sigungu?ServiceKey=");
		
		//	유기동물조회 조회조건의 '보호소'조건	동물보호관리시스템의 유기동물조회 조회조건의 '보호소'조건을 가져올 수 있다.
		ptAnimalKey.setProperty("shelter", "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/shelter?ServiceKey=");
		
		//유기동물조회 조회조건의 '품종'조건	동물보호관리시스템의 유기동물조회 조회조건의 '품종'조건을 가져올 수 있다.
		ptAnimalKey.setProperty("kind","http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/kind?ServiceKey=");
		
		//유기동물 정보를 조회	동물보호관리시스템의 유기동물 정보를 조회한다.
		ptAnimalKey.setProperty("abandonmentPublic", "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?ServiceKey=");
		}
		return key;
	}
}

