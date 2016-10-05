/*
 * @Class : Missing_Controller
 * @Date : 2016.10.5
 * @Author : 길한종
 * @Desc : 실종신고 게시판에 사용할 Controller
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
import com.d15.DAO.Pet_DAO;
import com.d15.Service.MissingInsertService;

@WebServlet("*.missing")
public class Missing_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Missing_Controller() {
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청받기
		String request_uri=request.getRequestURI();
		String context_path=request.getContextPath();
		String url_command=request_uri.substring(context_path.length());
							
		//인터페이스 추가
		ActionForward forward=null;
		Action action=null;
				
		//2.판단
		if(url_command.equals("/BoardWrite.missing")){
			//신고폼 보여주기
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("D15/Missing/petwrite.jsp");
			try{
				forward=action.execute(request, response);
				System.out.println(request.getAttribute("result"));
			}catch(Exception e){
				e.getMessage();
			}
		} else if(url_command.equals("/BoardWriteOk.missing")){
			//글쓰기
			action = new MissingInsertService(); // 다형성 (BoardListAction 이 action 구현)
			try {
				forward = action.execute(request, response);
				// BoardListActon.java 설정한 (request)정보 :
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//3.결과저장
		//4.뷰 정의
				
		//5.forward
		if(forward!=null){
			if(forward.isRedirect()){
				 response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis=request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
}
