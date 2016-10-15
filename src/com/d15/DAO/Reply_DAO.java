/*
 10/07
*/
package com.d15.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.d15.DTO.Reply_DTO;

public class Reply_DAO {

	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public Reply_DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	public int replywrite(Reply_DTO reply) {
		Reply_DTO replydto = new Reply_DTO();
		String board_max_sql = "select max(b_no) from D15_board";
		String sql = "";
		int num = 0;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
			sql = "insert into D15_reply (RE_NO,M_ID,RE_CONTENT,RE_DATE,B_NO "
					+ "values(RE_NO_SEQ.nextval,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,replydto.getM_id());
			pstmt.setString(2, replydto.getRe_content());
			pstmt.setInt(3, replydto.getB_no());

			int row = pstmt.executeUpdate();
			return row;
			
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
		return 0;
	}
		

	public boolean replyDelete(int b_no) {
	
		String replydelete = "delete from d_15Reply where b_no=?";
		
		int result=0;
		
		try{	
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(replydelete);
			pstmt.setInt(1, b_no);
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

