package com.elms.Models;

public class Departments {
	private int dept_id;
	private String dept_name;
	private String created_date;

	public Departments() {

	}

	public Departments(String dept_name, String created_date) {
		super();
		this.dept_name = dept_name;
		this.created_date = created_date;
	}

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

}
