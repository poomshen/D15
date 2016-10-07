/*
 * @Class : MissingList_Service
 * @Date : 2016.10.7
 * @Author : 박문수
 * @Desc : 실종신고 게시판의 상세 페이지를 위한  Service 클래스
 */

package com.d15.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Missing_DAO;
import com.d15.DTO.MissingDetail_DTO;


public class MissingDetail_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		Missing_DAO dao = new Missing_DAO();
		MissingDetail_DTO mdto = new MissingDetail_DTO();
		
		int mis_no = Integer.parseInt(request.getParameter("mis_no").trim()); //게시물 번호 
		String cp =	request.getParameter("cp"); //현재 페이지 번호
	    String ps =	request.getParameter("ps"); //pagesize 정보
	
	    //default 지정해주기
	    if(cp==null || cp.trim().equals("")){
			cp="1";
		}
		if(ps==null || ps.trim().equals("")){
			ps="9";
		}
		
		int cpage = Integer.parseInt(cp.trim());
		int pagesize = Integer.parseInt(ps.trim());
		
		mdto = dao.detailMissingPet(mis_no);
		
		request.setAttribute("dto", mdto);
		//request.setAttribute("dao", dao);
		request.setAttribute("mis_no", mis_no);
		request.setAttribute("cpage", cpage);
		request.setAttribute("pagesize", pagesize);
		
		forward.setRedirect(false);
		forward.setPath("petdetail.jsp");

		return forward;
	}

}
