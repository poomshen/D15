/*
 * @Class : D15_Key
 * @Date : 2016.10.6
 * @Author : 이성준
 * @Desc : 공공데이터 키값 설정
 */


package com.d15.keyURL;

import java.util.HashMap;
import java.util.Map;


public class D15_key {
	public static String keyurl ;
	D15_Property_animalKey key = D15_Property_animalKey.init();
	
	//받은 문자을 합쳐서 제대로된 url 코드로 변환 시키는 함수
	public String urlKey(String url , HashMap<String , String> select){
		//keyurl= 주소 =key="key"&받을파라미터=받은파라미터  
		keyurl = url+ key.ptAnimalKey.getProperty("Key");
		for (Map.Entry<String, String> entry : select.entrySet()) {
			keyurl += String.format("&%s=%s",entry.getKey(), entry.getValue() );
		}
		return keyurl;
	}
}
