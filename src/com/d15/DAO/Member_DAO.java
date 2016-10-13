/*
 * @Class : Member_DAO
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 로그인, 회원가입 처리할 DAO
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
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.d15.DTO.Detail_DTO;
import com.d15.DTO.MemberJoin_DTO;
import com.d15.DTO.MemberSearch_DTO;
import com.d15.DTO.Member_DTO;
import com.d15.DTO.Parcel_DTO;
import com.d15.DTO.Pet_DTO;
import com.d15.DTO.Protect_DTO;

public class Member_DAO {
	// db연결 초기작업
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

	// 회원가입 처리 함수
	public int insertMember(Member_DTO dto, Detail_DTO dto2) {

		try {

			conn = ds.getConnection();

			String sql = "insert into D15_Member(m_no, m_id, m_pwd, m_lastdate, c_code) "
					+ "values(m_no_seq.nextval,?,?,sysdate,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getM_id());
			pstmt.setString(2, dto.getM_pwd());
			pstmt.setString(3, dto.getC_code());

			int row = pstmt.executeUpdate();
			if (row > 0) {
				System.out.println("행 삽입  : " + row + "개");
			} else {
				System.out.println("행 삽입 실패");
			}

			String sql2 = "insert into D15_Detail(m_no, m_name, m_phone, m_birth, m_email, m_addr,m_daddr, m_petok, m_update, m_regdate) "
					+ "values(m_no_seq.currval,?,?,?,?,?,?,?,sysdate,sysdate)";

			pstmt = conn.prepareStatement(sql2);

			pstmt.setString(1, dto2.getM_name());
			pstmt.setString(2, dto2.getM_phone());
			pstmt.setInt(3, dto2.getM_birth());
			pstmt.setString(4, dto2.getM_email());
			pstmt.setString(5, dto2.getM_addr());
			pstmt.setString(6, dto2.getM_daddr());
			pstmt.setString(7, dto2.getM_petok());

			System.out.println(dto2);
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertPet error : " + e.getMessage());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}

		}

		return 0;
	}

	// 로그인 처리 함수
	public Member_DTO checkMember(String m_id, String m_pwd) {

		try {

			conn = ds.getConnection();

			String sql = "select m_no, m_id, m_pwd, m_lastdate, c_code from D15_Member " + "where m_id=? and m_pwd=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pwd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("로그인 성공");

				Member_DTO memberdto = new Member_DTO();
				memberdto.setM_no(rs.getInt(1));
				memberdto.setM_id(rs.getString(2));
				memberdto.setM_pwd(rs.getString(3));
				memberdto.setM_lastdate(rs.getDate(4));
				memberdto.setC_code(rs.getString(5));
				return memberdto;
			} else {
				System.out.println("로그인 실패");
			}

		} catch (Exception e) {
			System.out.println("checkmember" + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}

		}
		return null;
	}

	// 상세정보 보기 처리 함수
	public MemberJoin_DTO selectMember(int m_no) {
		MemberJoin_DTO memberjoindto = new MemberJoin_DTO();
		System.out.println(m_no);
		try {

			conn = ds.getConnection();

			String sql = "select M.m_no, M.m_id, M.m_pwd, M.m_lastdate, M.c_code, D.m_name, D.m_phone, D.m_birth, D.m_email, D.m_addr,D.m_daddr, D.m_petok,D. m_update, D.m_regdate "
					+ "from D15_Member M join D15_Detail D on M.M_NO=D.M_NO where M.m_no=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, m_no);

			rs = pstmt.executeQuery();
			System.out.println(rs);

			if (rs.next()) {

				memberjoindto.setM_no(rs.getInt(1));
				memberjoindto.setM_id(rs.getString(2));
				memberjoindto.setM_pwd(rs.getString(3));
				memberjoindto.setM_lastdate(rs.getDate(4));
				memberjoindto.setC_code(rs.getString(5));
				memberjoindto.setM_name(rs.getString(6));
				memberjoindto.setM_phone(rs.getString(7));
				memberjoindto.setM_birth(rs.getInt(8));
				memberjoindto.setM_email(rs.getString(9));
				memberjoindto.setM_addr(rs.getString(10));
				memberjoindto.setM_daddr(rs.getString(11));
				memberjoindto.setM_petok(rs.getString(12));
				memberjoindto.setM_update(rs.getDate(13));
				memberjoindto.setM_regdate(rs.getDate(14));

			} else {
			}

		} catch (Exception e) {
			System.out.println("insertPet error : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}

		}

		return memberjoindto;
	}

	public int MypageUpdate(MemberJoin_DTO dto) {
		try {
			conn = ds.getConnection();
			String sql = "update d15_member set m_pwd = ? where m_id = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getM_pwd());
			pstmt.setString(2, dto.getM_id());

			int row = pstmt.executeUpdate();

			if (row > 0) {
				String sql2 = "update d15_detail set m_name = ? , m_phone = ? , m_email = ? , m_addr = ? , m_daddr = ? , m_petok = ? , m_update = ? where m_no = ?";
				pstmt = conn.prepareStatement(sql2);

				pstmt.setString(1, dto.getM_name());
				pstmt.setString(2, dto.getM_phone());
				pstmt.setString(3, dto.getM_email());
				pstmt.setString(4, dto.getM_addr());
				pstmt.setString(5, dto.getM_daddr());
				pstmt.setString(6, dto.getM_petok());
				pstmt.setDate(7, dto.getM_update());
				pstmt.setInt(8, dto.getM_no());

				int row2 = pstmt.executeUpdate();

				if (row2 > 0) {
					System.out.println("회원 업데이트 성공");
					return row2;
				} else {
					System.out.println("ㅄ");
				}
			} else {
				System.out.println("ㄱㅄ");
			}
		} catch (Exception e) {
			System.out.println("MypageUpdate error");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}

		}

		return 0;
	}

	public List<MemberSearch_DTO> MemberSearch(String search) {
		List<MemberSearch_DTO> list = null;
		try {
			list = new ArrayList<MemberSearch_DTO>();

			conn = ds.getConnection();
			String sql = "select m.m_no , m.m_id , m.m_lastdate , m_name , m_phone , m_birth , m_email , m_addr , m_daddr , m_petok , m_update , m_regdate "
					+ "from D15_member m join D15_detail d on m.m_no = d.m_no where m_id like ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%" + search + "%");

			rs = pstmt.executeQuery();

			while (rs.next()) {

				MemberSearch_DTO dto = new MemberSearch_DTO();

				dto.setM_no(rs.getInt(1));
				dto.setM_id(rs.getString(2));
				dto.setM_lastdate(rs.getString(3));
				dto.setM_name(rs.getString(4));
				dto.setM_phone(rs.getString(5));
				dto.setM_birth(rs.getInt(6));
				dto.setM_email(rs.getString(7));
				dto.setM_addr(rs.getString(8));
				dto.setM_daddr(rs.getString(9));
				dto.setM_petok(rs.getString(10));
				dto.setM_update(rs.getString(11));
				dto.setM_regdate(rs.getString(12));

				list.add(dto);

			}
			System.out.println("Dao 제이슨 사이즈 : " + list.size());
			return list;
		} catch (Exception e) {
			System.out.println("MemberSeach error");
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}

		}

		return null;
	}

	// 마이페이지-분양상태 조회
	public List<Parcel_DTO> MypageStatus(Member_DTO memberdto) {
		List<Parcel_DTO> list = new ArrayList<Parcel_DTO>();
		try {
			conn = ds.getConnection();
			String sql = "select pc_no, m_no, org_no, pc_reqdate, pc_begdate, pc_argdate "
					+ "from D15_parcel where m_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberdto.getM_no());

			Parcel_DTO parceldto = new Parcel_DTO();
			parceldto.setPc_no(rs.getInt(1));
			parceldto.setM_no(memberdto.getM_no());
			parceldto.setOrg_no(rs.getInt(3));
			parceldto.setFc_reqdate(rs.getDate(4));
			parceldto.setFc_begdate(rs.getDate(5));
			parceldto.setPc_argdate(rs.getDate(6));
			list.add(parceldto);

		} catch (Exception e) {
			System.out.println("MypageUpdate error");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}

		}

		return list;
	}

	// 마이페이지-임시보호상태 조회
	public List<Protect_DTO> MypageStatus2(Member_DTO memberdto) {
		List<Protect_DTO> list = new ArrayList<Protect_DTO>();
		try {
			conn = ds.getConnection();
			String sql = "select pr_no, m_no, org_no, pr_reqdate, pr_argdate, pr_begdate, pr_enddate "
					+ "from D15_Protect where m_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberdto.getM_no());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Protect_DTO protectdto = new Protect_DTO();
				protectdto.setPr_no(rs.getInt(1));
				protectdto.setM_no(memberdto.getM_no());
				protectdto.setOrg_no(rs.getInt(3));
				protectdto.setPr_reqdate(rs.getDate(4));
				protectdto.setPr_argdate(rs.getDate(5));
				protectdto.setPr_begdate(rs.getDate(6));
				protectdto.setPr_enddate(rs.getDate(7));
				list.add(protectdto);
			}

		} catch (Exception e) {
			System.out.println("MypageUpdate error");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}

		}

		return list;
	}
	//아이디로 회원 넘버 가지고 오기
	public int selectid(String id){
		int ids = 0;
		try {
			conn = ds.getConnection();
			String sql = "select m_no from D15_Member where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				ids = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ids;
	}
	
	public String idSearch(int m_birth , String m_phone){
		try{
			conn = ds.getConnection();
			String sql = "select m.m_id from d15_member m join d15_detail d "
					+ "on m.m_no = d.m_no where m_birth = ? and m_phone = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m_birth);
			pstmt.setString(2, m_phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String id = rs.getString(1);
				return id;
			}else{
				System.out.println("id 없음");
			}
		}catch(Exception e){
			System.out.println("idSearch error");
			e.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt !=null)try{pstmt.close();}catch(Exception e){}
			if(conn != null)try{conn.close();}catch(Exception e){}
		}
		
		return null;
	}

}
