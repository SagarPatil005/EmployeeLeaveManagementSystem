package com.elms.Models;

import java.util.Set;

public class Employee {
	private String emp_id, name, email, mobile_no, department, joining_date, status;
	private int user_id;
	private Set<LeaveRequest> leaveRequests;

	public Employee() {

	}

	public Employee(String emp_id, String name, String email, String mobile_no, String department, String joining_date,
			String status, int user_id, Set<LeaveRequest> leaveRequests) {
		super();
		this.emp_id = emp_id;
		this.name = name;
		this.email = email;
		this.mobile_no = mobile_no;
		this.department = department;
		this.joining_date = joining_date;
		this.status = status;
		this.user_id = user_id;
		this.leaveRequests = leaveRequests;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getJoining_date() {
		return joining_date;
	}

	public void setJoining_date(String joining_date) {
		this.joining_date = joining_date;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<LeaveRequest> getLeaveRequests() {
		return leaveRequests;
	}

	public void setLeaveRequests(Set<LeaveRequest> leaveRequests) {
		this.leaveRequests = leaveRequests;
	}

}
