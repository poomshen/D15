/*
 * @Class : Board_DAO
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : 게시판 테이블에 대한 DAO
 * 
 * */

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

import com.d15.DTO.Board_DTO;
import com.d15.DTO.Member_DTO;


public class Board_DAO {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public Board_DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	// 전체 글의 개수
	public int getListCount() {
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from D15_board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rowcount = rs.getInt(1);
			}
		} catch (Exception e) {

		} finally {
			try {
				rs.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
			try {
				pstmt.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		System.out.println(rowcount);
		return rowcount;
	}

	// List.jsp
	public List getBoardList(int page, int limit) {
		String board_list_sql =	" SELECT * FROM "
				+ "( SELECT ROWNUM rn , b_no , m_no , b_name, b_content, b_count , b_file , b_date, "
				+ " b_ref , b_depth , b_step "
				+ " FROM (	SELECT * FROM D15_BOARD ORDER  BY  b_ref DESC , b_step ASC  ) "
				+ " ) WHERE rn BETWEEN ? AND ?";

		List<Board_DTO> blist = new ArrayList<Board_DTO>();
		List<Member_DTO> mlist = new ArrayList<Member_DTO>();
		
		int startrow = (page - 1) * 10 + 1;					
		int endrow = startrow + limit - 1;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow); 
			rs = pstmt.executeQuery();
		
			while(rs.next()){
				Board_DTO board = new Board_DTO();
				System.out.println("들어옴");
				board.setB_no(rs.getInt("B_NO"));
				board.setB_name(rs.getString("B_NAME"));
				board.setB_content(rs.getString("B_CONTENT"));
				board.setB_count(rs.getInt("B_COUNT"));
				board.setB_file(rs.getString("B_FILE"));
				board.setB_date(rs.getDate("B_DATE"));
				board.setB_ref(rs.getInt("B_REF"));		//참조	
				board.setB_depth(rs.getInt("B_DEPTH"));	//들여쓰기
				board.setB_step(rs.getInt("B_STEP"));	//글순서	

				blist.add(board); 
			}
			
			return blist;
			
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
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
		return blist;
	}

	
	// 글 상세보기.
	public Board_DTO getDetail(int num) throws Exception{
		
		Board_DTO board = null;
		Member_DTO member = null;
		
		try {
			
			conn = ds.getConnection();
			String sql = "select B_NO,M_ID,B_NAME,B_COUNT,B_CONTENT,B_date, "
					+"B_FILE,B_REF,B_DEPTH,B_STEP "
					+"from D15_board b join D15_member m on b.M_NO = m.M_NO where B_NO = ? ";
			pstmt = conn.prepareStatement(sql);							

		
			pstmt.setInt(1, num);
			System.out.println("확인타임  " + num);
			rs =pstmt.executeQuery();
			System.out.println("rrrr");
			
			if (rs.next()) {

				board = new Board_DTO();
				board.setB_no(rs.getInt("B_NO"));
				board.setB_name(rs.getString("B_NAME"));
				board.setB_content(rs.getString("B_CONTENT"));
				board.setB_count(rs.getInt("B_COUNT"));
				//board.setB_file(rs.getString("B_FILE"));
				board.setB_date(rs.getDate("B_DATE"));
				board.setB_ref(rs.getInt("B_REF"));	
				board.setB_depth(rs.getInt("B_DEPTH"));
				board.setB_step(rs.getInt("B_STEP"));
			}
			return board;
		} catch (Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
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
		return board;
	}

	// 글 등록
	public int boardInsert(Board_DTO board , int m_no) throws Exception {
		try {
			
			conn = ds.getConnection();
			String sql = "insert into D15_board (B_NO, M_no, B_NAME, B_CONTENT,"
					+ "B_COUNT, B_FILE, B_DATE, B_REF, B_DEPTH, B_STEP)"
					+ "values(B_NO_SEQ.nextval,?,?,?,0,?,sysdate,?,0,0)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m_no );
			pstmt.setString(2, board.getB_name());
			pstmt.setString(3, board.getB_content());
			pstmt.setString(4, board.getB_file());

			int refer_max = getMaxRefer(conn);
			int refer = refer_max + 1;
			System.out.println("refer" + refer);
			
			pstmt.setInt(5, refer);
			
			int row = pstmt.executeUpdate();
			return row;
		}
		 catch (Exception e) {
		 
		 e.printStackTrace();
		}finally {

			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return 0;

	}
	
	//참조함수
	public int getMaxRefer(Connection conn) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int refer_max = 0;
		try {
			String maxRefer_sql = "select nvl(max(b_ref),0) from D15_board";
			pstmt = conn.prepareStatement(maxRefer_sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				System.out.println("rs_next :" + rs.getInt(1));
				refer_max = rs.getInt(1);
			}		
		} catch (Exception e) {			
			System.out.println(e.getMessage());					
		} finally {
			if (pstmt != null)
				pstmt.close();	
			
			return refer_max;
		}
	}
	
	// 글 답변 (key point)
	public int boardReply(Board_DTO board) {
	
		String board_max_sql ="select b_ref , b_depth , b_step from D15_board where b_no=? ";

		String sql = "";
		int num = 0;
		int result = 0;

		// 현재 내가 읽고 답변을 하려는 원본글의 정보
		int ref = board.getB_ref();
		int depth = board.getB_depth();
		int step = board.getB_step();
	    
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_max_sql);
		    pstmt.setInt(1, board.getB_no());
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				
				num = rs.getInt(1) + 1;				
			} else {	
				num = 1;
			}
			
			//원본글 위치파악
			sql = " UPDATE D15_board SET b_step = b_step +1 "
					+ " WHERE b_ref = ? AND b_step > ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, step);

			result = pstmt.executeUpdate();
		
			step = step + 1; // 현재 읽은 글 + 1
			depth = depth + 1; // 현재 읽은 글 + 1
			
			sql = "insert into D15_board (B_NO,M_NO,B_NAME, B_CONTENT,B_COUNT, B_DATE, B_REF,"
					+ "B_DEPTH,B_STEP) "
					+ "values(B_NO_SEQ.nextval,2,?,?,0,sysdate,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_content());
			//pstmt.setString(3, board.getB_file());
			pstmt.setInt(3, board.getB_ref());
			System.out.println("보드겟 ref : "+board.getB_ref());
			pstmt.setInt(4, board.getB_depth()+1);
			System.out.println("보드 겟 : "+board.getB_depth());
			pstmt.setInt(5, board.getB_step()+1);
			System.out.println("보드 겟 step : "+board.getB_step());
			
			pstmt.executeUpdate();
			
			return board.getB_no();
			
		} catch (SQLException e) {
			e.printStackTrace();
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
		return result;
	}

	
	// 글 수정
	public boolean boardModify(Board_DTO modifyboard) throws Exception {

		String sql = "update D15_board set B_NAME=?,B_CONTENT=? where B_NO=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getB_name());
			pstmt.setString(2, modifyboard.getB_content());
			pstmt.setInt(3, modifyboard.getB_no());
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
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
		return false;
	}

	// 글 삭제
	public boolean boardDelete(int num) {

		String board_delete_sql = "delete from D15_board where B_NO=?";

		int result = 0;

		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		} finally {
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

	// 조회수 업데이트
	public void setReadCountUpdate(int num) throws Exception {

		String sql = "update D15_board set B_COUNT = "
				+ "B_COUNT+1 where B_NO = " + num;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("setReadCountUpdate 에러 : " + ex);
		} finally {
			try {
				
				if (pstmt != null)
					pstmt.close();
				
				if (conn != null)
					conn.close();
				} catch (Exception ex) {
				}

		}
	}
	
	//게시판 가장 높은 번호 가져오기
		public int MaxNo(){
			try{
				conn = ds.getConnection();
				String sql = "select max(b_no) from D15_board";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					
					return rs.getInt(1);
				}else{
					
					System.out.println("삽입 없음 max_no");
				}
				
			}catch(Exception e){
				System.out.println("Max no error");
				e.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(Exception e){}
				if(pstmt != null)try{rs.close();}catch(Exception e){}
				if(conn != null)try{rs.close();}catch(Exception e){}
				
			}
		
			return 0;			
		}

}
