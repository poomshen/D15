/*
 * @Class : ReviewAdd_Service
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기게시판의 글쓰기기능을 위한  Service 클래스
*/

package com.d15.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.d15.Action.Action;
import com.d15.Action.ActionForward;
import com.d15.DAO.Review_DAO;
import com.d15.DTO.Review_DTO;

public class ReviewAdd_Service implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		   Review_DAO reviewdao = new Review_DAO();
		   Review_DTO reviewdto = new Review_DTO();
		   
		   String pageName=(String)request.getParameter("name");
		   
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

		reviewdto.setBr_name(request.getParameter("BR_NAME"));
		reviewdto.setM_id(request.getParameter("M_ID"));
		reviewdto.setBr_content(request.getParameter("BR_CONTENT").replace("\r\n", "<br>"));
		
		//지금
		//boarddto.setB_file(upload.getFilesystemName((String) upload.getFileNames().nextElement()));		
		//boarddto.setB_file(multi.getFilesystemName((String) multi
		//		.getFileNames().nextElement()));
		
		
		try {
			
			int result = reviewdao.reviewInsert(reviewdto);

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
		forward.setPath("ReviewList.Review?name=review");
	
		return forward;
	}

}
