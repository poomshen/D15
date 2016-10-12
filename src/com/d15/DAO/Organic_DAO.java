/*
 * @Class : Organic_DAO
 * @Date : 2016.10.5
 * @Author : 이성준
 * @Desc : 유기동물 테이블에 대한 DAO(db연결,CRUD 작업)
 * 
 * */
package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Organic_DTO;


public class Organic_DAO {
	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	static {
		InitialContext ctx;
		try {
			/*
			 * Context context = new InitialContext(); DataSource datasource =
			 * (DataSource)context.lookup("java:comp/env/jdbc/oracle"); conn =
			 * datasource.getConnection();
			 */
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
			System.out.println("DataSource 객체 생성 성공 !");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	//등록
	public boolean insertOrganic(Organic_DTO org) throws SQLException{
		boolean ck = false;
		try {
			conn = ds.getConnection();
			
			String sql = "insert into D15_Organic(org_no, org_animal, org_img, org_code, org_gender, org_situation, org_count, org_date) "
					+ "values(org_no_seq.nextval,?,?,?,?,?,1,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, org.getOrg_animal());
			pstmt.setString(2, org.getOrg_img());
			pstmt.setString(3, org.getOrg_code());
			pstmt.setString(4, org.getOrg_gender());
			System.out.println(org.getOrg_situation());
			pstmt.setString(5, org.getOrg_situation());
			pstmt.setInt(6, org.getOrg_date());
			
			int inck  = pstmt.executeUpdate();
			if(inck >0){
				ck = true;
			}else {
				ck = false;
			}
			
		} catch (Exception e) {
			System.out.println("아이디 있음");
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		return ck;
	}
	
	//특정 하나 찾기 동물번호로 찾기 -처음 동물상태 알려 줄때 사용?
	public Organic_DTO selectOrganic(String no) throws SQLException{
		Organic_DTO list = new Organic_DTO();
		try {
			conn = ds.getConnection();
			String sql = "select org_situation, org_count ,org_no from D15_organic where org_animal = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list = new Organic_DTO();
				list.setOrg_situation(rs.getString("org_situation"));
				list.setOrg_count(rs.getInt("org_count"));
				list.setOrg_no(rs.getInt("org_no"));
				return list;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		
		return list;
	}
	
	//특정 하나 찾기 보호소 번호로 찾기(동물번호, 보호소번호) -보호소가 가지고 있는 동물 하나 찾기? 사용 의문 ? 나중 구현
	public Organic_DTO selectOrganic(String no,int i) throws SQLException{
		Organic_DTO organic = new Organic_DTO();
		try {
			conn = ds.getConnection();
			String sql = "select org_img,org_code,org_gender,org_situation ,org_count,org_date from D15_organic where org_animal = ? and st_no = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.setInt(2, i);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				organic.setOrg_img(rs.getString("org_img"));
				organic.setOrg_code(rs.getString("org_code"));
				organic.setOrg_gender(rs.getString("org_gender"));
				organic.setOrg_situation(rs.getString("org_situation"));
				organic.setOrg_count(rs.getInt("org_count"));
				organic.setOrg_date(rs.getInt("org_date"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		
		return organic;
	}
	
	//특정 찾기 보호소 번호로 찾기(동물번호, 보호소번호) -보호소가 가지고 있는 동물들 -사용?의문 나중 구현
	public  List<Organic_DTO> selectOrganic(int i,String no) throws SQLException{
		try {
			conn = ds.getConnection();
			String sql = "select org_img,org_code,org_gender,org_situation ,org_count,org_date from D15_organic where  org_animal = ? and st_no = ?";
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		
		return null;
	}
	
	//특정 하나 찾기 유기견 시퀀스로 찾기  -특정 동물 찾기 왜 필요?타 테이블이 필요해서
	public Organic_DTO selectOrganic(int i) throws SQLException{
		Organic_DTO organic = new Organic_DTO();
		try {
			conn = ds.getConnection();
			String sql = "select org_img,org_code,org_gender,org_situation ,org_count,org_date,st_no from D15_organic where org_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				organic.setOrg_img(rs.getString("org_img"));
				organic.setOrg_code(rs.getString("org_code"));
				organic.setOrg_gender(rs.getString("org_gender"));
				organic.setOrg_situation(rs.getString("org_situation"));
				organic.setOrg_count(rs.getInt("org_count"));
				organic.setOrg_date(rs.getInt("org_date"));
				organic.setSt_no(rs.getInt("st_no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		
		return organic;
	}
	
	//상태 수정 - 동물번호받고 바꿀 상태 주기 - 하면 초기 임보,분양 상태를 설정 함 
	public boolean updateSituation(String name,String Situation) throws SQLException{
			boolean ck = false;
		try {
			conn = ds.getConnection();
			//UPDATE table_name SET column1 = value1,column2 = value2, ... WHERE some_column = some_value;
			String sql = "update D15_organic set org_situation = ? where org_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Situation);
			pstmt.setInt(2, Integer.parseInt(name));
			
			int re = pstmt.executeUpdate();
			if(re > 0){
				ck = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		return ck;
	}
	
	//상태 수정 - 동물번호받고 바꿀 상태 주기 - 하면 관리자가 상태를 바꿀때 사용 될 것같음 
	public boolean updateSituation(int name,String Situation) throws SQLException{
		boolean ck = false;
		try {
			conn = ds.getConnection();
			String sql = "update D15_organic set org_situation = ? where org_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Situation);
			pstmt.setInt(2, name);
			
			int re = pstmt.executeUpdate();
			if(re > 0){
				ck = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		return ck;
	}
	
	//조회수 늘리기
	public boolean insertCount(String name) throws SQLException{
		boolean ck = false;
		try {
			
			conn = ds.getConnection();
			String sql ="update D15_organic set org_count=org_count+1 where org_animal=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			int re = pstmt.executeUpdate();
			if(re > 0){
				ck=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		return ck;
	}
	
	//남는 날짜수정 -- 나중 구현
	public boolean updateDate() throws SQLException{
		try {
			conn = ds.getConnection();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
	    	if(pstmt !=null)pstmt.close();
	    	if(rs !=null) rs.close();
	    	if(conn !=null)conn.close();
	    }
		return false;
	}
	
	//삭제
	

}
