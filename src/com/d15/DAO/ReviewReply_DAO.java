package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.d15.DTO.BoardReply_DTO;
import com.d15.DTO.ReviewReply_DTO;
import com.d15.DTO.Review_DTO;

public class ReviewReply_DAO {

	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public ReviewReply_DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	//댓글작성
	public int replywrite(ReviewReply_DTO replydto) {
		
		ReviewReply_DTO reviewreplydto = new ReviewReply_DTO();
		
		/*String board_max_sql = "select max(br_no) from D15_reply2";
		String sql = "";*/
		int num = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into D15_reply2 (RER_NO,M_NO,RER_CONTENT,RER_DATE,BR_NO) "
					+ "values(RER_NO_SEQ.nextval,2,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, replydto.getRer_content()); //요기
			pstmt.setInt(2, replydto.getBr_no());

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
		return num;
	}
		
	//댓글삭제함수(덧글 번호를 키로잡아서)
	public boolean replyDelete(int br_no) {
		String replydelete = "delete from d_15Reply2 where br_no=?";
		
		int result=0;
		
		try{	
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(replydelete);
			pstmt.setInt(1, br_no);
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
	


//reply 덧글 리스트
	public List<ReviewReply_DTO> replylist(String br_no) throws SQLException{

	try{
			conn = ds.getConnection();
			String reply_sql ="select * from d15_reply2 where br_no=? order by re_no desc";
			
			pstmt = conn.prepareStatement(reply_sql);
			pstmt.setString(1, br_no);
		
			 rs =pstmt.executeQuery();
		    
		    ArrayList<ReviewReply_DTO> list = new ArrayList<ReviewReply_DTO>();
		    
			while(rs.next()){
				int re_no = Integer.parseInt(rs.getString("rer_no"));
				int m_no = rs.getInt("m_no");
				int b_no = rs.getInt("br_no");
				String re_content = rs.getString("re_content");
				String content = rs.getString("content");
				java.sql.Date re_date = rs.getDate("re_date");
	         
				ReviewReply_DTO replyDTO = new ReviewReply_DTO();
				
				list.add(replyDTO);
			}
			return list;	
	 }finally{
		 
	 	if(pstmt !=null)pstmt.close();
	 	if(rs !=null) rs.close();
	 	if(conn !=null)conn.close();
	 }
}
}
