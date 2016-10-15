/*
 * @Class : NoticeList_Service
 * @Date : 2016.10.14
 * @Author : 박문수
 * @Desc : 공지사항 글목록을  위한  Service
 */


package com.d15.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Notice_DAO;
import com.d15.DTO.Notice_DTO;

public class NoticeList_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Notice_DTO dto = new Notice_DTO();
		Notice_DAO dao = new Notice_DAO();
		
		int page = 1;   //pagenumber
		int limit = 10; //pagesize 
		

		if (request.getParameter("page") != null) {
			
			page = Integer.parseInt(request.getParameter("page"));
			
		}
		List<Notice_DTO> list = dao.noticeList(page,limit);
			
		int listCount = dao.getListCount(); 
		System.out.println("리스트카운트"+listCount);


		int maxPage = (int) ((double) listCount / limit + 0.95);  
	

		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;  

		int endPage = startPage + 10 - 1; 

		if (endPage > maxPage) {
			
			endPage = maxPage; 
		}
		
		request.setAttribute("page", page); 
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);  
		request.setAttribute("listCount", listCount); 
		request.setAttribute("noticelist", list);
		
		forward.setPath("noticelist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
