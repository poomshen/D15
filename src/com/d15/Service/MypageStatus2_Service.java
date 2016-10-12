/*
 * @Class : MypageStatus2_Service.java
 * @Date : 2016.10.12
 * @Author : 길한종
 * @Desc : 마이페이지-임시보호상태 확인 서비스
 */
package com.d15.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Parcel_DTO;
import com.d15.DTO.Protect_DTO;

public class MypageStatus2_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		Member_DTO memberdto=(Member_DTO)session.getAttribute("memberdto");
		Member_DAO memberdao=new Member_DAO();
		
		List<Protect_DTO> dtolist=memberdao.MypageStatus2(memberdto);
		
		request.setAttribute("dtolist", dtolist);
		
		forward.setRedirect(false);
		forward.setPath("MypageStatus2.jsp"); //뷰단
		
		return forward;
	}

}
