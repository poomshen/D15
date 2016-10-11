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
import com.d15.Service.MangerParcelCheck_Service;
import com.d15.Service.MangerParcel_Service;
import com.d15.Service.MangerProtectCheck_Service;
import com.d15.Service.MangerProtect_Service;

@WebServlet("*.Manger")
public class Manger_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Manger_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequsetURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String search = RequsetURI.substring(ContextPath.length());
		
		System.out.println(search);
		 ActionForward  forward = null;
		 Action action = null;
		
		System.out.println(search);
		if(search.equals("/D15/Manger/StartManger.Manger")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("MangerStart.jsp");
		}else if(search.equals("/D15/Manger/ParcelManger.Manger")){
			//분양 리스트
			action =  new MangerParcel_Service();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
			}
		}else  if(search.equals("/D15/Manger/ProtectManger.Manger")){
			//임시 보호 리스트
			action = new  MangerProtect_Service();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/Manger/ProtectMangerCK.Manger")){
			//임시 보호 체크
			action = new MangerProtectCheck_Service();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else if(search.equals("/D15/Manger/ParcelMangerCK.Manger")){
			//분양 체크
			action  = new MangerParcelCheck_Service();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			
		}
		
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

}
