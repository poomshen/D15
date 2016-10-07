/*
 * @Class : Login_Service.java
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 로그인, 세션을 처리하는 Service
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;

public class Login_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String m_id=request.getParameter("m_id");
		String m_pwd=request.getParameter("m_pwd");
		ActionForward forward = new ActionForward();
		
		//select 함수를 돌리는 Member_DAO
		Member_DAO memberdao=new Member_DAO();
		
		//세션 생성
		HttpSession session=request.getSession();
		
		int n=memberdao.checkMember(m_id, m_pwd);
		if (n!=0){
			forward.setRedirect(false);
			forward.setPath("testpage.jsp"); //view단 jsp파일 지정

			session.setAttribute("m_id", m_id);
			//session.setAttribute("m_no", m_id);
		} else {
			forward.setRedirect(false);
			forward.setPath("testpage.jsp"); //view단 jsp파일 지정
			session.invalidate();
		}
		
		return forward;
	}
}
