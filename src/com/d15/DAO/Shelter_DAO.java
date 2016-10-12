/*
 * @Class : Shelter_DAO
 * @Date : 2016.10.5
 * @Author : 이성준
 * @Desc : 보호소 테이블에 대한 DAO(db연결,CRUD 작업)
 * 
 * */

package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Shelter_DTO;

public class Shelter_DAO {
	//db연결 초기작업
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
		
	public int insertShelter(Shelter_DTO shelter){
			
		try{
				
			conn = ds.getConnection();
						
			String sql = "insert into D15_Shelter(st_no, st_phone, st_loc, st_name, st_mgr, st_mgrphone) "
					+"values(시퀀스, ?, ?, ?, ?, ?)";
				
			pstmt = conn.prepareStatement(sql);
				
			pstmt.setString(1, shelter.getSt_phone());
			pstmt.setString(2, shelter.getSt_loc());
			pstmt.setString(3, shelter.getSt_name());
			pstmt.setString(4, shelter.getSt_mgr());
			pstmt.setString(5, shelter.getSt_mgrphone());

			int row = pstmt.executeUpdate();
			if(row > 0){
				System.out.println("행 삽입  : " + row + "개");
				return row;
			}else{
				System.out.println("행 삽입 실패");
			}
			
		}catch(Exception e){
			System.out.println("insertPet error : " + e.getMessage());
		}finally{
			
			if(pstmt != null)try{rs.close();}catch(Exception e){}
			if(conn != null)try{rs.close();}catch(Exception e){}
			
		}
			
		return 0;
	}
}
