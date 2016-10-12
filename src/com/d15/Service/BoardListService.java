/*
 * @Class : BoardList_Service
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글쓰기 목록보기 기능을 위한  Service 클래스
 */

package com.d15.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Board_DAO;

public class BoardListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response){
			
		Board_DAO boarddao = new Board_DAO();
		
		List boardList = new ArrayList();
		List reviewList = new ArrayList();

		int page = 1;   //pagenumber
		int limit = 10; //pagesize 
		
		String pageName=(String)request.getParameter("name");

		if (request.getParameter("page") != null) {
			
			page = Integer.parseInt(request.getParameter("page"));
			
		}
			
		int listCount = boarddao.getListCount(); 
		System.out.println("리스트카운트"+listCount);
		boardList = boarddao.getBoardList(page, limit); 
		reviewList = boarddao.getBoardList(page, limit);

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
				
		if(pageName.equals("qna")){
			forward.setPath("Board/Board_List.jsp");
		}
		else if(pageName.equals("review")){
			forward.setPath("Board/Review_List.jsp");
		}
		return forward; 
	}
}
 