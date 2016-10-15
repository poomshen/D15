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
import com.d15.Service.InsertMessage_Service;
import com.d15.Service.MakeMessageList_Service;
import com.d15.Service.MessageRemoveM_Service;
import com.d15.Service.MessageRemoveT_Service;
import com.d15.Service.MessgeDetail_Service;
import com.d15.Service.TakeMessageList_Service;
import com.d15.Service.TakeNoMessageList_Service;

/**
 * Servlet implementation class Message_Contoroller
 */
@WebServlet("*.Message")
public class Message_Contoroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Message_Contoroller() {
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
		System.out.println(Command);
		
		ActionForward forward = null;
		Action action = null;
		if(Command.equals("/D15/Missing/insertMessage.Message")){
			//메시지 보내기
			action = new InsertMessage_Service();
			try {
				forward  = action.execute(request, response);
			} catch (Exception e) {
			}
		}else if(Command.equals("/D15/Login/myTakeMessagelist.Message")){
			//받은 메시지  -> 메시지 체크중 N 과 Y와 W를 보게됨
			action = new TakeMessageList_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(Command.equals("/D15/Login/myTakeNoMessagelist.Message")){
			//받은 메시지중 읽지 않은 메시지 체크중 N 만 보게됨
			action = new TakeNoMessageList_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(Command.equals("/D15/Login/myMakeMessagelist.Message")){
			//보낸 메세지 -> 메시지 체크중 Y와 N 과 R를 보게 됨
			action = new MakeMessageList_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
			}
			
		}else if(Command.equals("/D15/Login/myMakeNoMessagelist.Message")){
			//읽지 않은 것 만 뿌리기 나중 구현
		}else if(Command.equals("/D15/Login/MessageRemoveT.Message")){
			//받은 메시지자가 선택 메세지 지우기 -> 업데이트 받은 메시지 ->(R) 상태 바꿔줌 -> 만약 W 이 있다면 완전 지움
			action = new MessageRemoveT_Service(); 
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
			}
		}else if(Command.equals("/D15/Login/MessageRemoveM.Message")){
			//보낸 메시지자가 선택 메시지 지우기 -> 업데이트 보낸 메시지 ->(W)는 안읽음 (M) 읽은 상태 바꿔줌 -> 만약 R 이 있다면 완전 지움 
			action = new MessageRemoveM_Service(); 
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
			}
		}else if(Command.equals("/D15/Login/MessagedDetail.Message")){
			//선택 메시지 클릭시 (읽음 표시)
			action = new MessgeDetail_Service();
			try{
				forward  = action.execute(request, response);
			}catch(Exception e){
				
			}
			
		}else if(Command.equals("/D15/Login/insertMessage.Message")){
			//메시지 보내기
			action = new InsertMessage_Service();
			try {
				forward  = action.execute(request, response);
			} catch (Exception e) {
			}
		}else if(Command.equals("/D15/Manger/myTakeMessagelist.Message")){
			//받은 메시지  -> 메시지 체크중 N 과 Y와 W를 보게됨
			action = new TakeMessageList_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(Command.equals("/D15/Manger/myTakeNoMessagelist.Message")){
			//받은 메시지중 읽지 않은 메시지 체크중 N 만 보게됨
			action = new TakeNoMessageList_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else if(Command.equals("/D15/Manger/myMakeMessagelist.Message")){
			//보낸 메세지 -> 메시지 체크중 Y와 N 과 R를 보게 됨
			action = new MakeMessageList_Service();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
			}
		}else{
			
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
