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
import com.d15.DTO.Notice_DTO;

public class Notice_DAO {
	
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public Notice_DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}
	
	//공지사항 글 작성
	public int NoticeWrite(int m_no ,String notice_name , String notice_content ){
		try{
			conn = ds.getConnection();
			String sql = "insert into d15_notice(notice_no,m_no,notice_name,notice_date,notice_content,notice_count) "
					+ "values(notice_no_seq.nextval,?,?,sysdate,?,0)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m_no);
			pstmt.setString(2, notice_name);
			pstmt.setString(3,notice_content);
			
			int row = pstmt.executeUpdate();
			
			if(row > 0){
				
				System.out.println("공지사항 등록 성공");
				return row;
				
			}else{
				
				System.out.println("등록 실패");
			}
			
			
		}catch(Exception e){
			System.out.println("NoticeWrite Error");
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		return 0;
	}
	
	//공지사항 리스트 가져오기
	public List<Notice_DTO> noticeList(int page, int limit){
		List<Notice_DTO> list = new ArrayList<Notice_DTO>();
		int startrow = (page - 1) * 10 + 1;					
		int endrow = startrow + limit - 1;
		
		try{
			conn = ds.getConnection();
			String sql = "select * from (select ROWNUM rn , notice_no , m_no , notice_name , notice_date , notice_content , notice_count "
					+ "from d15_notice order by notice_no desc) where rn between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startrow);
			pstmt.setInt(2, endrow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Notice_DTO dto = new Notice_DTO();
				dto.setNotice_no(rs.getInt(2));
				dto.setM_no(rs.getInt(3));
				dto.setNotice_name(rs.getString(4));
				dto.setNotice_date(rs.getDate(5));
				dto.setNotice_content(rs.getString(6));
				dto.setNotice_count(rs.getInt(7));
				
				list.add(dto);
				
			}
			return list;
		}catch(Exception e){
			System.out.println("noticeList error");
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
		}
		
		return null;
	}
	
	//리스트 갯수 가져오기
	public int getListCount() {
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from D15_notice");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rowcount = rs.getInt(1);
			}
		} catch (Exception e) {
			
			System.out.println("getListCount error");
			e.printStackTrace();
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
	
	//상세 글 보기
	public Notice_DTO detailNotice(int notice_no){
		Notice_DTO dto = new Notice_DTO();
		try{
			conn = ds.getConnection();
			String sql = "select * from d15_notice where notice_no = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,notice_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("상세페이지 가져오기 성공");
				dto.setNotice_no(rs.getInt(1));
				dto.setM_no(rs.getInt(2));
				dto.setNotice_name(rs.getString(3));
				dto.setNotice_date(rs.getDate(4));
				dto.setNotice_content(rs.getString(5));
				dto.setNotice_count(rs.getInt(6));
				
				return dto;
				
				
			}else{
				System.out.println("상세글 보기 실패");
			}
		}catch(Exception e){
			System.out.println("detailNotice error");
			e.printStackTrace();
		}finally{
			
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		
		
		return null;
	}
	
	// 조회수 증가
	public void setReadCountUpdate(int no){

		String sql = "update D15_notice set notice_count = "
				+ "notice_count+1 where notice_no = " + no;

		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("setReadCountUpdate 에러 ");
			e.printStackTrace();
			
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
	
	//공지사항 수정
	public boolean noticeUpdate(Notice_DTO dto){

		String sql = "update D15_notice set notice_name =? , notice_content =? where notice_no = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNotice_name());
			pstmt.setString(2, dto.getNotice_content());
			pstmt.setInt(3, dto.getNotice_no());
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception e) {
			System.out.println("noticeUpdate error : ");
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
		return false;
	}
	
	public Notice_DTO getDetail(int no){
		
		Notice_DTO dto = null;
		try {
			
			conn = ds.getConnection();
			String sql = "select notice_no,m_no,notice_name,notice_date , notice_content,notice_count "
					+"from d15_notice where notice_no = ? ";
			pstmt = conn.prepareStatement(sql);							

		
			pstmt.setInt(1, no);
			rs =pstmt.executeQuery();
			
			if (rs.next()) {

				dto = new Notice_DTO();
				dto.setNotice_no(rs.getInt("notice_no"));
				dto.setNotice_name(rs.getString("notice_name"));
				dto.setNotice_content(rs.getString("notice_content"));
				dto.setNotice_count(rs.getInt("notice_count"));
				dto.setNotice_date(rs.getDate("notice_date"));
			}
			return dto;
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
		return dto;
	}
}