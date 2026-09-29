package com.elms.Models;

import java.sql.Date;

public class LeaveRequest {
	private int request_id; // Primary Key

	private Employee employee; // Many-to-One

	private LeaveType leaveType; // Many-to-One

	private Date from_date;

	private Date to_date;

	private int days;

	private Date applied_date;

	private String status;

	public LeaveRequest() {

	}

	public LeaveRequest(Employee employee, LeaveType leaveType, Date from_date, Date to_date, int days,
			Date applied_date, String status) {
		super();
		this.employee = employee;
		this.leaveType = leaveType;
		this.from_date = from_date;
		this.to_date = to_date;
		this.days = days;
		this.applied_date = applied_date;
		this.status = status;
	}

	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public LeaveType getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(LeaveType leaveType) {
		this.leaveType = leaveType;
	}

	public Date getFrom_date() {
		return from_date;
	}

	public void setFrom_date(Date from_date) {
		this.from_date = from_date;
	}

	public Date getTo_date() {
		return to_date;
	}

	public void setTo_date(Date to_date) {
		this.to_date = to_date;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public Date getApplied_date() {
		return applied_date;
	}

	public void setApplied_date(Date applied_date) {
		this.applied_date = applied_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
