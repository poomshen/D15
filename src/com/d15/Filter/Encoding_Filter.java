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
    		System.out.println("Before : " + request.getCharacterEncoding());
    		request.setCharacterEncoding(this.encoding);
    		System.out.println("After : " + request.getCharacterEncoding());
    	}
    	chain.doFilter(request, response);
    	
    	//2.response(나갈때)
    	System.out.println("response 응답 처리");
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
