package com.d15.Action;

//실제 요청에 처리를 담당하는 클래스
//처리 담당
//forward, sendRedirect
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
