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
import com.d15.Service.BoardDeleteService;
import com.d15.Service.ReviewAdd_Service;
import com.d15.Service.ReviewDelete_Service;
import com.d15.Service.ReviewDetail_Service;
import com.d15.Service.ReviewList_Service;
import com.d15.Service.ReviewModifyView_Service;
import com.d15.Service.ReviewModify_Service;
import com.d15.Service.ReviewReplyView_Service;
import com.d15.Service.ReviewReply_Service;


@WebServlet("*.Review")
public class Review_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Review_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String Command = RequestURI.substring(ContextPath.length());

		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("Command : " + Command);
		
		ActionForward forward = null;
		Action action = null;
							   
		if (Command.equals("/D15/Board/ReviewList.Review")) {
			
			System.out.println("리스트");
			action = new ReviewList_Service(); 
			
			try {
				
				forward = action.execute(request, response);
			
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (Command.equals("/D15/ReviewWrite.Review")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Board/Review_Write.jsp");

		} else if (Command.equals("/D15/ReviewAddService.Review")) {
			
			System.out.println("게시판 글쓰기");
			action = new ReviewAdd_Service();
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 처리");
				
			} catch (Exception e) {

				e.printStackTrace();
			}					
		} else if (Command.equals("/D15/ReviewDetail.Review")) { 
			
			System.out.println("게시판 상세");
			action = new ReviewDetail_Service(); 
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 상세보기 처리 완료");
			
			} catch (Exception e) {

				e.printStackTrace();
			}
							
		}  else if (Command.equals("/D15/ReviewDelete.Review")) {
			
			System.out.println("게시판 삭제");
			action = new ReviewDelete_Service();
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 삭제 처리 완료");
			
			} catch (Exception e) {

				e.printStackTrace();
			}
			                            
		} else if (Command.equals("/D15/ReviewModify.Review")) {
			System.out.println("게시판 수정화면");

			action = new ReviewModifyView_Service(); 
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 수정 페이지 처리 완료");
				
			} catch (Exception e) {

				e.printStackTrace();
			}                                 
		} else if (Command.equals("/D15/ReviewModifyService.Review")) {
			// 실제 업데이트 처리
			System.out.println("게시판 수정 처리");

			action = new ReviewModify_Service(); 
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 업데이트 완료");
			} catch (Exception e) {
				
				e.printStackTrace();
			}                          
		} else if (Command.equals("/D15/ReviewReplyView.Review")) {
			
			System.out.println("게시판 답변 화면");
			action = new ReviewReplyView_Service();
			
			try {
				
				forward = action.execute(request, response);
				System.out.println("게시판 답변 완료");
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}                        
		} else if(Command.equals("/D15/ReviewReplyService.Review")){
			
			System.out.println("게시판 답변 처리");
			action = new ReviewReply_Service(); 
			
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

