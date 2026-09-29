package com.elms.Models;

import java.util.Set;

public class LeaveType {
	private int leaveTypeId;
	private String leaveName, createdDate;
	private Set<LeaveRequest> leaveRequests;

	public LeaveType() {

	}

	public LeaveType(String leaveName, String createdDate, Set<LeaveRequest> leaveRequests) {
		super();
		this.leaveName = leaveName;
		this.createdDate = createdDate;
		this.leaveRequests = leaveRequests;
	}

	public int getLeaveTypeId() {
		return leaveTypeId;
	}

	public void setLeaveTypeId(int leaveTypeId) {
		this.leaveTypeId = leaveTypeId;
	}

	public String getLeaveName() {
		return leaveName;
	}

	public void setLeaveName(String leaveName) {
		this.leaveName = leaveName;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public Set<LeaveRequest> getLeaveRequests() {
		return leaveRequests;
	}

	public void setLeaveRequests(Set<LeaveRequest> leaveRequests) {
		this.leaveRequests = leaveRequests;
	}

}
