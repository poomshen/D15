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
import com.d15.Service.InsertMassage_Service;

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
		if(Command.equals("insertMassage.Message")){
			action = new InsertMassage_Service();
			try {
				forward  = action.execute(request, response);
			} catch (Exception e) {
			}
		}else if(Command.equals("myTakeMassgelist.Message")){
			
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
