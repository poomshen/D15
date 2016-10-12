/*
  @Class : Review_DAO
  @Date : 2016.10.11
  @Author : 조한솔
  @Desc : 후기게시판 테이블에 대한 DAO
 */

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

import com.d15.DTO.Review_DTO;

public class Review_DAO {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public Review_DAO() {
		
		try {
			
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	// 글의 전체 개수
	public int getListCount() {
		
		int rowcount = 0;
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from D15_Breview");
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
		return rowcount;
	}

	//글의 목록
	public List getReviewList(int page, int limit) {
		String review_list_sql =	" SELECT * FROM "
				+ "( SELECT ROWNUM rn , br_no , m_no , br_name, br_content, br_count , br_file , br_date, "
				+ " br_ref , br_depth , br_step "
				+ " FROM (	SELECT * FROM D15_Breview ORDER  BY  br_ref DESC , br_step ASC  ) "
				+ " ) WHERE rn BETWEEN ? AND ?";

		List<Review_DTO> blist = new ArrayList<Review_DTO>();
		
		int startrow = (page - 1) * 10 + 1;					
		int endrow = startrow + limit - 1;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(review_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow); 
			rs = pstmt.executeQuery();
		
			while(rs.next()){
				Review_DTO review = new Review_DTO();
				review.setBr_no(rs.getInt("BR_NO"));
				//member.setM_id(rs.getString("M_ID"));
				review.setBr_name(rs.getString("BR_NAME"));
				review.setBr_content(rs.getString("BR_CONTENT"));
				review.setBr_count(rs.getInt("BR_COUNT"));
				review.setBr_file(rs.getString("BR_FILE"));
				review.setBr_date(rs.getDate("BR_DATE"));
				review.setBr_ref(rs.getInt("BR_REF"));		//참조	
				review.setBr_depth(rs.getInt("BR_DEPTH"));	//들여쓰기
				review.setBr_step(rs.getInt("BR_STEP"));	//글순서	

				blist.add(review);		
			}
			
			return blist;
			
		} catch (Exception ex) {
			System.out.println("getReviewList 에러 : " + ex);
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
	public Review_DTO getDetail(int num) throws Exception{

		Review_DTO review = null;
		
		try {
		
			conn = ds.getConnection();
			String sql = "select BR_NO,M_ID,BR_NAME,BR_COUNT,BR_CONTENT,BR_date, "
					+"BR_FILE,BR_REF,BR_DEPTH,BR_STEP "
					+"from D15_Breview br join D15_member m on br.M_NO = m.M_NO where BR_NO = ? ";
			
			pstmt = conn.prepareStatement(sql);							

			pstmt.setInt(1, num);
			
			rs =pstmt.executeQuery();
			
			if (rs.next()) {

				review = new Review_DTO();
			
				review.setBr_no(rs.getInt("BR_NO"));
				review.setBr_name(rs.getString("BR_NAME"));
				review.setBr_content(rs.getString("BR_CONTENT"));
				review.setBr_count(rs.getInt("BR_COUNT"));
				//review.setB_file(rs.getString("B_FILE"));
				review.setBr_date(rs.getDate("BR_DATE"));
				review.setBr_ref(rs.getInt("BR_REF"));	
				review.setBr_depth(rs.getInt("BR_DEPTH"));
				review.setBr_step(rs.getInt("BR_STEP"));
			}
			return review;
			
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
		return review;
	}

	// 글 등록	
	public int reviewInsert(Review_DTO review) throws Exception {
		try {
			
			conn = ds.getConnection();
			String sql = "insert into D15_Breview (BR_NO, M_no, BR_NAME, BR_CONTENT,"
					+ "BR_COUNT, BR_FILE, BR_DATE, BR_REF, BR_DEPTH, BR_STEP)"
					+ "values(BR_NO_SEQ.nextval,2,?,?,0,?,sysdate,?,0,0)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, review.getBr_name());
			pstmt.setString(2, review.getBr_content());
			pstmt.setString(3, review.getBr_file());

			int refer_max = getMaxRefer(conn);
			int refer = refer_max + 1;
			
			pstmt.setInt(4, refer);
			
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
			
			String maxRefer_sql = "select nvl(max(br_ref),0) from D15_Breview";
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
	

	// 글 답변 
	public int reviewReply(Review_DTO review) {
	
		String review_max_sql = "select br_ref , br_depth , br_step from D15_Breview where br_no=? ";

		String sql = "";
		int num = 0;
		int result = 0;

		// 현재 내가 읽고 답변을 하려는 원본글의 정보
		int ref = review.getBr_ref();
		int depth = review.getBr_depth();
		int step = review.getBr_step();

		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(review_max_sql);
		    pstmt.setInt(1, review.getBr_no());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				num = rs.getInt(1) + 1;
			} else {
				
				num = 1;
			}

			// 워본 글의 위치 
			sql = " UPDATE D15_Breview SET br_step = br_step +1 "
					+ " WHERE br_ref = ? AND br_step > ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, step);

			result = pstmt.executeUpdate();
		
			step = step + 1; // 현재 읽은 글 + 1
			depth = depth + 1; // 현재 읽은 글 + 1
			
			sql = "insert into D15_Breview (BR_NO,M_NO,BR_NAME, BR_CONTENT,BR_COUNT, BR_DATE, BR_REF,"
					+ "BR_DEPTH,BR_STEP) "
					+ "values(BR_NO_SEQ.nextval,2,?,?,0,sysdate,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, review.getBr_name());
			pstmt.setString(2, review.getBr_content());	
			//pstmt.setString(3, review.getB_file());
			pstmt.setInt(3, review.getBr_ref());
			pstmt.setInt(4, review.getBr_depth()+1);
			pstmt.setInt(5, review.getBr_step()+1);
			
			pstmt.executeUpdate();
			System.out.println("review no : " + review.getBr_no());
			
			return review.getBr_no();
		
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
	public boolean reviewModify(Review_DTO modifyreview) throws Exception {

		String sql = "update D15_Breview set BR_NAME=?,BR_CONTENT=? where BR_NO=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifyreview.getBr_name());
			pstmt.setString(2, modifyreview.getBr_content());
			pstmt.setInt(3, modifyreview.getBr_no());
			pstmt.executeUpdate();
			
			return true;
		
		} catch (Exception ex) {
			System.out.println("reviewModify 에러 : " + ex);
		
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

	// 글목록 삭제
	public boolean reviewDelete(int num) {

		String review_delete_sql = "delete from D15_Breview where BR_NO=?";

		int result = 0;

		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(review_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("reviewDelete 에러 : " + ex);
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

		String sql = "update D15_Breview set BR_COUNT = "
				+ "BR_COUNT+1 where BR_NO = " + num;

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
			String sql = "select max(br_no) from d15_breview";
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
