/*
 * @Class : Mypage_Service.java
 * @Date : 2016.10.8
 * @Author : 길한종
 * @Desc : 마이페이지 상세정보 확인 Service
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.MemberJoin_DTO;
import com.d15.DTO.Member_DTO;

public class Mypage_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Member_DAO memberdao=new Member_DAO();
		ActionForward forward = new ActionForward();
		
		HttpSession session=request.getSession();
		Member_DTO memberdto = (Member_DTO)session.getAttribute("memberdto");
		
		MemberJoin_DTO memberjoindto=memberdao.selectMember(memberdto.getM_no());
		System.out.println("dto? " + memberjoindto);
		
		
		session.setAttribute("memberjoindto", memberjoindto);
		
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;
	}

}
