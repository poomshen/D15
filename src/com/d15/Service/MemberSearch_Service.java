/*
 * @Class : MemberSearch_Service
 * @Date : 2016.10.12
 * @Author : 박문수
 * @Desc : 회원 조회에 대한 Controller
 */

package com.d15.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Member_DAO;
import com.d15.DTO.MemberJoin_DTO;

public class MemberSearch_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Member_DAO dao = new Member_DAO();
		List<MemberJoin_DTO> list = new ArrayList<MemberJoin_DTO>();
		
		String search = request.getParameter("search");
		System.out.println("search : " + search);
		list = dao.MemberSearch(search);
		if(list == null){
			System.out.println("memberSearch_service : list null");
		}
		
		request.setAttribute("list", list);
		
		forward.setPath("membersearch.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
