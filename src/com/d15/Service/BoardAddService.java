/*
 * @Class : BoardAddService_Service
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글쓰는 기능을 위한  Service 클래스
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
import com.d15.DAO.Board_DAO;
import com.d15.DAO.Review_DAO;
import com.d15.DTO.Board_DTO;
import com.d15.DTO.MemberJoin_DTO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Review_DTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddService implements Action {
		
	@Override
	public ActionForward execute(HttpServletRequest request,
		   HttpServletResponse response){

		System.out.println("보드 애드 서비스");
		   Board_DAO boarddao = new Board_DAO();
		   
		   Board_DTO boarddto = new Board_DTO();

		   
		//파일처리
/*		String realFolder = "";
		String saveFolder = "boardUpload";
		int filesize = 10 * 1024 * 1024; // 10M
		//11//
		realFolder = request.getSession().getServletContext()
				    .getRealPath(saveFolder);*/
		
		
		/*
		try {
			boarddata.setB_name(request.getParameter("B_NAME"));
			boarddata.setB_content(request.getParameter("B_CONTENT").replace("\r\n", "<br>"));
			//boarddata.setB_file(upload.getFilesystemName((String) upload.getFileNames().nextElement()));*/
	   
		
	    Calendar cal=Calendar.getInstance();
	    Date sqldate=null;
	    //MultipartRequest multi = null;
	    
	    try {
	    	/*
	    	MultipartRequest upload = new MultipartRequest(request,
						    		  realFolder,
						    		  filesize, 
						    		  "utf-8",
						    		  new DefaultFileRenamePolicy());
	    	*/

	    	SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
	    	java.util.Date date = transFormat.parse(transFormat.format(cal.getTime()));
	    	sqldate=new Date(date.getTime());
		    //memberdto.setM_lastdate(sqldate); db에서 자동입력

	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	    }
		
	    
	    boarddto.setB_name(request.getParameter("B_NAME"));
	    System.out.println("확인111"  + request.getParameter("B_NAME"));
		boarddto.setB_content(request.getParameter("B_CONTENT").replace("\r\n", "<br>"));
		System.out.println("내용 들어왔나" +request.getParameter("B_CONTENT"));
		String pageName=(String)request.getParameter("name");
		
		
		//지금
		//boarddto.setB_file(upload.getFilesystemName((String) upload.getFileNames().nextElement()));		
		//boarddto.setB_file(multi.getFilesystemName((String) multi
		//		.getFileNames().nextElement()));
		HttpSession session = request.getSession();
		Member_DTO mdto = (Member_DTO)session.getAttribute("memberdto");
		int m_no = mdto.getM_no();
		
		try {
			
			int result = boarddao.boardInsert(boarddto,m_no);	
			
			if (result > 0) {
				System.out.println("글 입력 성공");
				request.setAttribute("result", "success");
			}else {
				System.out.println("글 입력 실패");
				request.setAttribute("result", "fail");
			} 
		} catch (Exception e) {

		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("BoardList.Board?name=qna");

		return forward;
	}
		
}


