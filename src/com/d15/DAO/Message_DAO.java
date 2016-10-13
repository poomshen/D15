package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Message_DTO;

import oracle.net.aso.f;

public class Message_DAO {
	//db연결 초기작업
		static DataSource ds;
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;

		static {
			InitialContext ctx;
			try {
				ctx = new InitialContext();
				Context envCtx = (Context) ctx.lookup("java:comp/env");
				ds = (DataSource) envCtx.lookup("/jdbc/oracle");
				System.out.println("DataSource 객체 생성 성공 !");
				
			} catch (NamingException e) {				
				System.out.println("lookup Fail : " + e.getMessage());
			}
		}
	
	
	//쪽지 보내기
	public boolean insertMessge(Message_DTO massage){
		boolean ck = false;
		try {
			conn = ds.getConnection();
			String sql = "insert into D15_message(mes_no,m_no,mes_content,mes_date,mes_send,mes_check) "
					+ "values(MES_NO_SEQ.nextval,?,?,sysdate,?,'N')  ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,massage.getM_no());
			pstmt.setString(2, massage.getMes_content());
			pstmt.setInt(3, massage.getMes_send());
			int re = pstmt.executeUpdate();
			if(re > 0){
				ck = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		return ck;
	}
	//쪽지 리스트
	public ArrayList<Message_DTO> selectTakeList(int mb_no){
		ArrayList<Message_DTO> arrayList = new ArrayList<>();
		String sql = "select mes_no,mes_send, mes_content,mes_date,mes_check "
				+ " from D15_message where m_no = ? and mes_check = 'N' or mes_check = 'Y'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mb_no);
		 	rs = pstmt.executeQuery();
		 	while(rs.next()){
		 		Message_DTO massage_DTO = new Message_DTO();
		 		massage_DTO.setM_no(rs.getInt(1));
		 		massage_DTO.setMes_send(rs.getInt(2));
		 		massage_DTO.setMes_content(rs.getString(3));
		 		massage_DTO.setMes_date(rs.getDate(4));
		 		massage_DTO.setMes_check(rs.getString(5));
		 		arrayList.add(massage_DTO);
		 	}
		 	return arrayList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		
		
		return arrayList;
		
	}
	//안읽은 쪽지 리스트
	public ArrayList<Message_DTO> selectNoList(int mb_no){
		ArrayList<Message_DTO> arrayList = new ArrayList<>();
		String sql = "select mes_no,mes_send, mes_content,mes_date,mes_check "
				+ " from D15_message where m_no = ? and mes_check = 'N' ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mb_no);
		 	rs = pstmt.executeQuery();
			while(rs.next()){
		 		Message_DTO massage_DTO = new Message_DTO();
		 		massage_DTO.setM_no(rs.getInt(1));
		 		massage_DTO.setMes_send(rs.getInt(2));
		 		massage_DTO.setMes_content(rs.getString(3));
		 		massage_DTO.setMes_date(rs.getDate(4));
		 		massage_DTO.setMes_check(rs.getString(5));
		 		arrayList.add(massage_DTO);
		 	}
		 	return arrayList;
		 	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		
		return arrayList;
	}
	//안읽은 쪽지 카운트
	public int selectNos(int mb_no){
		String sql = "Select Count(*) from D15_message where m_no = ? and mes_check = 'N'";
		int count = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mb_no);
		 	rs = pstmt.executeQuery();
		 	if(rs.next()){
		 		count = rs.getInt(1);
		 	}
		 	return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		return 0;
	}
	//보낸 쪽지 리스트
	public ArrayList<Message_DTO> selectSendlist(int mb_no){
		ArrayList<Message_DTO> arrayList = new ArrayList<>();
		String sql = "select mes_no,mes_send, mes_content,mes_date,mes_check "
				+ " from D15_message where mes_send = ? and mes_check = 'N' or mes_check = 'Y' ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mb_no);
		 	rs = pstmt.executeQuery();
			while(rs.next()){
		 		Message_DTO massage_DTO = new Message_DTO();
		 		massage_DTO.setM_no(rs.getInt(1));
		 		massage_DTO.setMes_send(rs.getInt(2));
		 		massage_DTO.setMes_content(rs.getString(3));
		 		massage_DTO.setMes_date(rs.getDate(4));
		 		massage_DTO.setMes_check(rs.getString(5));
		 		arrayList.add(massage_DTO);
		 	}
		 	return arrayList;
		 	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		return null;
	}
	//쪽지 완전 삭제
	public boolean removeMessage(int mes_no){
		boolean ck = false;
		String sql = "delete from D15_message where mes_no =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mes_no);
		 	int re = pstmt.executeUpdate();
		 	if(re> 0){
		 		ck = true;
		 	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		return false;
	}
	//글읽음 클릭시 마다/
	public boolean readMessge(int mes_no){
		boolean ck = false;
		String sql ="Update D15_message set mes_check = 'Y' where Mes_no = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mes_no);
		 	int re = pstmt.executeUpdate();
		 	if(re > 0){
		 		ck= true;
		 	}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		return false;
	}
	//글 삭제 클릭시 업데이트 한쪽 삭제 되면 다른 쪽이 보는것이 안되기 때문에
	public boolean ONremoveMessage(int mes_no){
		boolean ck = false;
		String sql ="Update D15_message set mes_check = 'D' where Mes_no = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mes_no);
			int re = pstmt.executeUpdate();
			if(re > 0){
				ck= true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
			
		}
		return false;
	}
}
