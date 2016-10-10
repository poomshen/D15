package com.d15.DTO;

import java.sql.Date;

//임시보호
public class Protect_DTO {
	int pr_no;
	int m_no;
	int org_no;
	int pr_history;
	Date pr_reqdate;
	Date pr_argdate;
	Date pr_begdate;
	Date pr_enddate;
	
	public Protect_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Protect_DTO(int pr_no, int m_no, int org_no, Date pr_reqdate) {
		super();
		this.pr_no = pr_no;
		this.m_no = m_no;
		this.org_no = org_no;
		this.pr_reqdate = pr_reqdate;
	}



	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getOrg_no() {
		return org_no;
	}

	public void setOrg_no(int org_no) {
		this.org_no = org_no;
	}

	public int getPr_history() {
		return pr_history;
	}

	public void setPr_history(int pr_history) {
		this.pr_history = pr_history;
	}

	public Date getPr_reqdate() {
		return pr_reqdate;
	}

	public void setPr_reqdate(Date pr_reqdate) {
		this.pr_reqdate = pr_reqdate;
	}

	public Date getPr_argdate() {
		return pr_argdate;
	}

	public void setPr_argdate(Date pr_argdate) {
		this.pr_argdate = pr_argdate;
	}

	public Date getPr_begdate() {
		return pr_begdate;
	}

	public void setPr_begdate(Date pr_begdate) {
		this.pr_begdate = pr_begdate;
	}

	public Date getPr_enddate() {
		return pr_enddate;
	}

	public void setPr_enddate(Date pr_enddate) {
		this.pr_enddate = pr_enddate;
	}
	
	
	
	
	
	

}
