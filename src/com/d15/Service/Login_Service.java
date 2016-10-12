/*
 * @Class : Login_Service.java
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 로그인, 세션을 처리하는 Service
 */

package com.d15.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.Member_DTO;

public class Login_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String m_id=request.getParameter("m_id");
		String m_pwd=request.getParameter("m_pwd");
		ActionForward forward = new ActionForward();
		
		System.out.println(m_id + "/" + m_pwd);
		//select 함수를 돌리는 Member_DAO
		Member_DAO memberdao=new Member_DAO();
		
		//세션 생성
		Member_DTO memberdto=memberdao.checkMember(m_id, m_pwd);
		//System.out.println("memberdto : " + memberdto.toString());
		if(memberdto == null){
			System.out.println("널");
		}
		if (memberdto!=null){
			HttpSession session=request.getSession();
			session.setAttribute("memberdto", memberdto);
			forward.setRedirect(false);
			forward.setPath("loginsuccess.jsp");
			System.out.println("true");
		} else {	
			System.out.println("fail");
			//HttpSession session=request.getSession();
			//session.invalidate();
			forward.setRedirect(false);
			forward.setPath("loginfail.jsp");
			System.out.println("false");
		}
		System.out.println("login");
		
		
		return forward;
	}
}
