/*
 * @Class : MypageStatus_Service.java
 * @Date : 2016.10.12
 * @Author : 길한종
 * @Desc : 마이페이지-분양상태 확인 서비스
 */
package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Parcel_DTO;

public class MypageStatus_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		Member_DTO memberdto=(Member_DTO)session.getAttribute("memberdto");
		Member_DAO memberdao=new Member_DAO();
		
		Parcel_DTO parceldto=memberdao.MypageStatus(memberdto);
		
		request.setAttribute("parceldto", parceldto);
		
		forward.setRedirect(false);
		forward.setPath("MypageStatus.jsp"); //뷰단
		
		return forward;
	}

}
