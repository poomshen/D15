package com.d15.keyURL;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.ActionForward;


/**
 * Servlet implementation class LoginManager
 */
@WebServlet("*.LoginManager")
public class LoginManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginManager() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*	Object s = request.getParameter("totalCount");
		Object s1 = request.getParameter("json");
		System.out.println(s);
		System.out.println(s1);
		response.getWriter().print("success");*/
		String pageno = request.getParameter("pageNo");
		String keyurl = request.getParameter("key");
		String numOfRows = request.getParameter("numOfRows");
		//String pageno = request.getAttribute("pageNo");
		request.setAttribute("pageNo", Integer.parseInt(pageno));
		request.setAttribute("numOfRows", numOfRows);
		request.setAttribute("keyurl", keyurl);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("WePet_SearchQuestion.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
		dispatcher.forward(request, response);
	}

	
}
