/*
 * @Interface : Action
 * @Date : 2016.10.5
 * @Author : 이성준
 * @Desc : Service 의 상위 Interface 
 */


package com.d15.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request ,HttpServletResponse response);
}
