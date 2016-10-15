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
		
		//BoardReply_DTO boardreplydto = new BoardReply_DTO();
		
		/*String board_max_sql = "select max(b_no) from D15_reply";
		String sql = ""; */
		int num = 0;
		
		try {
			System.out.println("dao에서 replydto를 db에 저장");
			conn = ds.getConnection();
			String sql = "insert into D15_reply (RE_NO,b_no,m_id,RE_CONTENT,RE_DATE) "
					+ "values(RE_NO_SEQ.nextval,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(2, replydto.getM_id());
			pstmt.setString(3, replydto.getRe_content());
			pstmt.setInt(1, replydto.getB_no());
			
			num = pstmt.executeUpdate();
			System.out.println("조한솔 ㅡㅡ");
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

}



