/*
 * @Class : Login_Controller
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 로그인, 회원가입 처리할 Controller
 */

package com.d15.Contoroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;

import com.d15.DAO.Pet_DAO;
import com.d15.Service.Login_Service;
import com.d15.Service.MemberInsert_Service;
import com.d15.Service.MissingList_Service;
import com.d15.Service.Mypage_Service;
import com.d15.Service.PetInsert_Service;


@WebServlet("*.login")
public class Login_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login_Controller() {
        
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
		System.out.println("asd12314s");
		//인터페이스 추가
		ActionForward forward=null;
		Action action=null;
		//2.판단
		if(url_command.equals("/D15/Login/RegisterPer.login")){
			//일반회원 가입폼 보여주기
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/D15/Login/register_per.jsp");
			try{
				forward= action.execute(request, response);
				System.out.println(request.getAttribute("result"));
			}catch(Exception e){
				e.getMessage();
			}
		}else if(url_command.equals("/D15/Login/RegisterPerOk.login")){
			//일반회원 가입폼 처리
			action = new MemberInsert_Service("03"); //서비스 
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else if(url_command.equals("/D15/Login/Login.login")){
			//로그인화면
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/D15/Login/login.jsp");
			try{
				forward= action.execute(request, response);
				System.out.println(request.getAttribute("result"));
			}catch(Exception e){
				e.getMessage();
			}
		}else if(url_command.equals("/D15/Login/LoginOk.login")){
			//로그인 처리
			action = new Login_Service(); //서비스 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else if(url_command.equals("/D15/Login/Logout.login")){
			//로그아웃 처리		
			HttpSession session=request.getSession();
			session.invalidate();
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("../../index.jsp");
		}else if(url_command.equals("/D15/Login/Mypage.login")){
			//마이페이지
			System.out.println("여기까진 오나??");
			
			action = new Mypage_Service(); 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else{

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
