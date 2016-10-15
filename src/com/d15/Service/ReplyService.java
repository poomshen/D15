/*
 * @Class : ReplyDelete_Service
 * @Date : 2016.10.14
 * @Author : 조한솔
 * @Desc : 댓글을 처리하는 Service
 */

package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.BoardReply_DAO;
import com.d15.DTO.BoardReply_DTO;
import com.d15.DTO.Member_DTO;


public class ReplyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){		

		BoardReply_DAO breplydao = new BoardReply_DAO();
		BoardReply_DTO breplydto = new BoardReply_DTO ();
		System.out.println("컨트롤러를 타고 ReplyService로 왔다");
	    Calendar cal=Calendar.getInstance();
	    Date sqldate=null;
	    
	    try {
	    
	    	SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
	    	java.util.Date date = transFormat.parse(transFormat.format(cal.getTime()));
	    	sqldate=new Date(date.getTime());

	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	    }
		
		
		int result = 0;
		
		//breplydto.setRe_no(re_no); db 시퀀스에서
		HttpSession session=request.getSession();
		Member_DTO memberdto=(Member_DTO)session.getAttribute("memberdto");
		breplydto.setM_id(memberdto.getM_id());
		breplydto.setB_no(Integer.parseInt(request.getParameter("b_no")));
		breplydto.setRe_content(request.getParameter("re_content").replace("\r\n", "<br>"));
		//breplydto.setRe_date(re_date); 
		
		
		//String pageName=(String)request.getParameter("name");
		
		result = breplydao.replywrite(breplydto);
		
		if(result>0) {
			System.out.println("댓글 입력 성공");
			request.setAttribute("result", "success");
		}
		else {
			System.out.println("댓글 입력 실패");
			request.setAttribute("result", "fail");
		}

		
		ActionForward forward = new ActionForward();   
	    forward.setRedirect(false);
		forward.setPath(null);
		
		return forward;


		}
}
