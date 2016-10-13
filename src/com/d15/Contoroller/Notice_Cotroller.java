/*
 * @Class : Notice_Controller
 * @Date : 2016.10.14
 * @Author : 박문수
 * @Desc : 공지사항  Controller
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
import com.d15.Service.NoticeDetail_Service;
import com.d15.Service.NoticeInsert_Service;
import com.d15.Service.NoticeList_Service;
import com.d15.Service.NoticeUpdateGo_Service;
import com.d15.Service.NoticeUpdate_Service;

@WebServlet("*.notice")
public class Notice_Cotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Notice_Cotroller() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();

		String Command = RequestURI.substring(ContextPath.length());
		System.out.println("Command path : " + Command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(Command.equals("/D15/Notice/NoticeList.notice")){
			System.out.println("공지사항 리스트 보기");
			action = new NoticeList_Service();
			
			try{
				forward = action.execute(request, response);
				
			}catch(Exception e){
				System.out.println("NoticeList error");
				e.printStackTrace();
			}
			
		}else if(Command.equals("/D15/Notice/NoticeInsert.notice")){
			System.out.println("공지사항 글쓰기");
			action = new NoticeInsert_Service();
			
			try{
				forward = action.execute(request, response);
				
			}catch(Exception e){
				System.out.println("NoticeInsert controller error");
				e.printStackTrace();
			}
			
		}else if(Command.equals("/D15/Notice/NoticeDetail.notice")){
			System.out.println("공지사항 상세 글 보기");
			action = new NoticeDetail_Service();
			
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				System.out.println("NoticeDetail error");
				e.printStackTrace();
			}
		}else if(Command.equals("/D15/Notice/NoticeUpdateGo.notice")){
			System.out.println("공지사항 수정하기1");
			action = new NoticeUpdateGo_Service();
			
			try{
				forward = action.execute(request, response);
				
			}catch(Exception e){
				System.out.println("NoticeUpdate error");
				e.printStackTrace();
			}
		}else if(Command.equals("/D15/Notice/NoticeUpdate.notice")){
			System.out.println("공지사항 수정하기2");
			action = new NoticeUpdate_Service();
			
			try{
				forward = action.execute(request, response);
				
			}catch(Exception e){
				System.out.println("NoticeUpdate error");
				e.printStackTrace();
			}
		}
		
		
		
		
		
		if (forward != null) {
			if(forward.isRedirect()){

				response.sendRedirect(forward.getPath());
			} else {

				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	
	
	
}


