/*
 * @Class : New_Controller
 * @Date : 2016.10.13
 * @Author : 이성준
 * @Desc : 새로운 메세지에 대한 Controller
 */

package com.d15.Contoroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.DAO.Message_DAO;

/**
 * Servlet implementation class New_Controller
 */
@WebServlet("*.New")
public class New_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public New_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		Message_DAO massage_DAO = new Message_DAO();
		int outcount = massage_DAO.selectNos(m_no);
		
		try {
			response.getWriter().print(outcount);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
