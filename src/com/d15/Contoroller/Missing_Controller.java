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
import com.d15.Service.MissingDetail_Service;
import com.d15.Service.MissingList_Service;
import com.d15.Service.MissingUpdate_Service;
import com.d15.Service.PetInsert_Service;

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
		System.out.println(url_command);
		//인터페이스 추가
		ActionForward forward=null;
		Action action=null;
				
		//2.판단
		if(url_command.equals("/D15/Missing/BoardWrite.missing")){
			//신고폼 보여주기
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("petwrite.jsp");
			/*try{
				forward= action.execute(request, response);
				System.out.println(request.getAttribute("result"));
			}catch(Exception e){
				e.getMessage();
			}*/
			
		}else if(url_command.equals("/D15/Missing/BoardWriteOk1.missing")){
			
			action = new PetInsert_Service(); 
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}/*else if(url_command.equals("/D15/Missing/BoardWriteOk2.missing")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("petwrite.jsp");
			
		
		}else if(url_command.equals("/D15/Missing/BoardWriteOk3.missing")){
			action = new MissingInsertService();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}*/else if(url_command.equals("/D15/Missing/BoardList.missing")){
			action = new MissingList_Service();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(url_command.equals("/D15/Missing/ListDetail.missing")){
			action = new MissingDetail_Service();
			
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(url_command.equals("/D15/Missing/update.missing")){
			action = new MissingUpdate_Service();
			
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
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
