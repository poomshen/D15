/*
 * @Class : ActionForward
 * @Date : 2016.10.5
 * @Author : 이성준
 * @Desc : 실제 요청 담당하는 dto 클래스
 */


package com.d15.Action;

public class ActionForward {
	private boolean isRedirect = false;
	private String path =null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
