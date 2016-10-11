/*
 * @Class : Encoding_Filter
 * @Date : 2016.10.5
 * @Author : 박문수
 * @Desc : 모든 페이지 한글처리를 위한 Filter
 */

package com.d15.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter("/*")
public class Encoding_Filter implements Filter {

	//encoding 값을 저장 할 수 있는 변수
	private String encoding;
	
    public Encoding_Filter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//1.request(들어올때)
    	if(request.getCharacterEncoding() == null){
    		request.setCharacterEncoding("UTF-8");
    	}
    	chain.doFilter(request, response);
    	
    	//2.response(나갈때)
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
