/*
 * @Class : BoardController
 * @Date : 2016.10.06
 * @Author : 조한솔
 * @Desc : Q&A게시판을 처리할 Controller
 */

package com.d15.Contoroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.Service.BoardAddService;
import com.d15.Service.BoardDeleteService;
import com.d15.Service.BoardDetailService;
import com.d15.Service.BoardListService;
import com.d15.Service.BoardModifyService;
import com.d15.Service.BoardModifyView;
import com.d15.Service.BoardReplyService;
import com.d15.Service.BoardReplyView;


@WebServlet("*.Board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardController() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();

		String Command = RequestURI.substring(ContextPath.length());

		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("Command : " + Command);
		
		ActionForward forward = null;
		Action action = null;
		
		if (Command.equals("/D15/BoardList.Board")) {
			
			action = new BoardListService(); 
			
			try {
				
				forward = action.execute(request, response);
			
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (Command.equals("/D15/BoardWrite.Board")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Board/Board_Write.jsp");

		} else if (Command.equals("/D15/BoardAddService.Board")) {
			
			System.out.println("게시판 글쓰기");
			action = new BoardAddService();
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 처리 완료");
				
			} catch (Exception e) {

				e.printStackTrace();
			}					
		} else if (Command.equals("/D15/BoardDetail.Board")) { 
			
			System.out.println("게시판 상세");
			action = new BoardDetailService(); 
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 상세보기 처리");
			
			} catch (Exception e) {

				e.printStackTrace();
			}

		}  else if (Command.equals("/D15/BoardDelete.Board")) {
			
			System.out.println("게시판 삭제");
			action = new BoardDeleteService(); 
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 삭제 처리 완료");
			
			} catch (Exception e) {

				e.printStackTrace();
			}

		} else if (Command.equals("/D15/BoardModify.Board")) {
			
			System.out.println("게시판 수정화면");
			action = new BoardModifyView(); 
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 수정 페이지 처리");
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (Command.equals("/D15/BoardModifyService.Board")) {
			
			System.out.println("게시판 수정 처리");

			action = new BoardModifyService(); 
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 업데이트 완료");
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		} else if (Command.equals("/D15/BoardReplyView.Board")) {
			
			System.out.println("게시판 답변 화면");
			action = new BoardReplyView();
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 답변 완료");
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		} else if(Command.equals("/D15/BoardReplyService.Board")){
			
			System.out.println("게시판 답변 처리");

			action = new BoardReplyService(); 
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 답변처리 완료");
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}

		// 전체 설정
		if (forward != null) {
			
			if (forward.isRedirect()) { 

				System.out.println("forward.isRedirect : "
						+ forward.isRedirect());

				response.sendRedirect(forward.getPath());
			} else {

				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
}
