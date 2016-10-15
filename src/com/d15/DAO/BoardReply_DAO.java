/*
  @Class :BoardReply_DAO
  @Date : 2016.10.12
  @Author : 조한솔
  @Desc : Q&A게시판 게시글 댓글에 대한 DAO
 */


//Q&A게시판 게시글 댓글
package com.d15.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.d15.DTO.BoardReply_DTO;

public class BoardReply_DAO {

	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public BoardReply_DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	//댓글작성
	public int replywrite(BoardReply_DTO replydto) {
		
		BoardReply_DTO boardreplydto = new BoardReply_DTO();
		
		/*String board_max_sql = "select max(b_no) from D15_reply";
		String sql = ""; */
		int num = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into D15_reply (RE_NO,M_NO,RE_CONTENT,RE_DATE,B_NO) "
					+ "values(RE_NO_SEQ.nextval,2,?,sysdate,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, replydto.getRe_content());
			pstmt.setInt(2, replydto.getB_no());
			
			num = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Reply Error : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		System.out.println("입력된 행 수: "+ num);
		return num;
	}
		
	//댓글삭제
	public boolean replyDelete(int re_no) {
		String replydelete = "delete from d_15Reply where re_no=?";
		
		int result=0;
		
		try{	
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(replydelete);
			pstmt.setInt(1, re_no);
			result =pstmt.executeUpdate();
			if (result == 0)
				return false;
			
			return true;	
		}catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		}finally{
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}
		}
		return false;
	}
	

/*
//reply 덧글 리스트
	public List<BoardReply_DTO> replylist(String idx_fk) throws SQLException{

	try{
			conn = ds.getConnection();
			String reply_sql ="select * from reply where idx_fk=? order by re_no desc";
			
			pstmt = conn.prepareStatement(reply_sql);
			pstmt.setString(1, idx_fk);
		
			 rs =pstmt.executeQuery();
		    
		    ArrayList<BoardReply_DTO> list = new ArrayList<BoardReply_DTO>();
			while(rs.next()){
				int re_no = Integer.parseInt(rs.getString("re_no"));
				int m_no = rs.getInt("m_no");
				int b_no = rs.getInt("b_no");
				String re_content = rs.getString("re_content");
				String content = rs.getString("content");
				java.sql.Date re_date = rs.getDate("re_date");
	         
				BoardReply_DTO replyDTO = new BoardReply_DTO();
				
				list.add(replyDTO);
			}
			return list;	
	 }finally{
		 
	 	if(pstmt !=null)pstmt.close();
	 	if(rs !=null) rs.close();
	 	if(conn !=null)conn.close();
	 }*/
}



