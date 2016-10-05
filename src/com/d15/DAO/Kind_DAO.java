/*
 * @Class : Kind_DAO
 * @Date : 2016.10.5
 * @Author : 박문수
 * @Desc : 견종(품종) 테이블에 대한 DAO(db연결,CRUD 작업)
 * 
 * */
package com.d15.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Kind_DTO;

public class Kind_DAO {
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
	
	// 견종의 Json data 만들기 위해서 
	public List<Kind_DTO> selectKind(){
		List<Kind_DTO> list = null;
		
		try{
			list = new ArrayList<Kind_DTO>();
			
			conn = ds.getConnection();
			String sql = "select k_code,k_kind from D15_kind";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Kind_DTO dto = new Kind_DTO();
				dto.setK_code(rs.getString(1));
				dto.setK_kind(rs.getString(2));
				//System.out.println("삽입성공" + rs.getString(1) + "/" + rs.getString(2));
				list.add(dto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){
			System.out.println("selectKind Error : " + e.getMessage() );
		}
		
		return list;
	}
}
