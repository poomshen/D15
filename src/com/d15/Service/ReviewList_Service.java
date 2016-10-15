/*
 * @Class : ReviewList_Service
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기게시판의 글 목록 보기를 위한  Service 클래스
*/

package com.d15.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Review_DAO;

public class ReviewList_Service implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		Review_DAO boarddao = new Review_DAO();
		
		List reviewList = new ArrayList();
		List boardList = new ArrayList();

		int page = 1;   //pagenumber
		int limit = 10; //pagesize 
		
		String pageName=(String)request.getParameter("name");

		if (request.getParameter("page") != null) {
			
			page = Integer.parseInt(request.getParameter("page"));
			
		}
			
		int listCount = boarddao.getListCount(); 
		reviewList = boarddao.getReviewList(page, limit);

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
		request.setAttribute("boardList", boardList); 
		request.setAttribute("reviewList", reviewList); 

		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Board/Review_List.jsp");
		
		return forward; 
	}

}
