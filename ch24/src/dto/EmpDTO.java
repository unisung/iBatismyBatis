package dto;

import java.sql.Date;

public class EmpDTO {
	 private int eno;
	 private String ename;
	 private String job;
	 private int manager;
	 private Date hiredate;
	 private int salary;
	 private int commission;
	 private int dno;
	 
	 private String mname;
	 private String dname;
	 
	public int getEno() {		return eno;	}
	public void setEno(int eno) {		this.eno = eno;	}
	public String getEname() {		return ename;	}
	public void setEname(String ename) {		this.ename = ename;	}
	public String getJob() {		return job;	}
	public void setJob(String job) {		this.job = job;	}
	public int getManager() {		return manager;	}
	public void setManager(int manager) {		this.manager = manager;	}
	public Date getHiredate() {		return hiredate;	}
	public void setHiredate(Date hiredate) {		this.hiredate = hiredate;	}
	public int getSalary() {		return salary;	}
	public void setSalary(int salary) {		this.salary = salary;	}
	public int getCommission() {		return commission;	}
	public void setCommission(int commission) {		this.commission = commission;	}
	public int getDno() {		return dno;	}
	public void setDno(int dno) {		this.dno = dno;	}
	public String getMname() {		return mname;	}
	public void setMname(String mname) {	this.mname = mname;}
	public String getDname() {	return dname;	}
	public void setDname(String dname) {	this.dname = dname;	}
	 
	 

	

}
