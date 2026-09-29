package com.elms.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.elms.Hibernate.Util.CreateFactory;
import com.elms.Models.LeaveRequest;

public class LeaveRequestDAO {
	public static boolean saveLeaveRequest(LeaveRequest lr) {

		Session session = CreateFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		session.save(lr);
		tx.commit();

		session.close();
		return true;
	}

	public static List<LeaveRequest> getLeaveRequest() {

		Session session = CreateFactory.getSessionFactory().openSession();
		List<LeaveRequest> list = session.createQuery("from LeaveRequest", LeaveRequest.class).list();

		session.close();
		return list;

	}

	public static List<LeaveRequest> getLeaveRequest(String keyword, String status, int page, int pageSize) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "from LeaveRequest lr where 1=1 ";

		// Search
		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += " and (" + "lower(lr.employee.emp_id) like :key " + "or lower(lr.employee.name) like :key "
					+ "or lower(lr.leaveType.leaveName) like :key" + ")";

		}

		// Status Filter
		if (status != null && !status.trim().isEmpty()) {

			hql += " and lower(lr.status)=:status";

		}

		hql += " order by lr.applied_date desc";

		Query<LeaveRequest> query = session.createQuery(hql, LeaveRequest.class);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		if (status != null && !status.trim().isEmpty()) {

			query.setParameter("status", status.toLowerCase());

		}

		query.setFirstResult((page - 1) * pageSize);

		query.setMaxResults(pageSize);

		List<LeaveRequest> list = query.list();

		session.close();

		return list;
	}

	public static long getLeaveRequestCount(String keyword, String status) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "select count(lr) from LeaveRequest lr where 1=1 ";

		// Search
		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += " and (" + "lower(lr.employee.emp_id) like :key " + "or lower(lr.employee.name) like :key "
					+ "or lower(lr.leaveType.leaveName) like :key" + ")";

		}

		// Status Filter
		if (status != null && !status.trim().isEmpty()) {

			hql += " and lower(lr.status)=:status";

		}

		Query<Long> query = session.createQuery(hql, Long.class);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		if (status != null && !status.trim().isEmpty()) {

			query.setParameter("status", status.toLowerCase());

		}

		long total = query.uniqueResult();

		session.close();

		return total;
	}

	public static long getTotalLeaves(String empId) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<Long> query = session.createQuery("select count(*) from LeaveRequest where emp_id=:id", Long.class);

		query.setParameter("id", empId);

		long count = query.uniqueResult();

		session.close();

		return count;
	}

	public static long getTotalLeaveCount() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Long count = (Long) session.createQuery("select count(*) from LeaveRequest ").uniqueResult();

		session.close();

		return count;
	}

	public static long getPendingLeaveCount() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Long count = (Long) session.createQuery("select count(*) from LeaveRequest where status='Pending'")
				.uniqueResult();

		session.close();

		return count;
	}

	public static long getApprovedLeaveCount() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Long count = (Long) session.createQuery("select count(*) from LeaveRequest where status='Approved'")
				.uniqueResult();

		session.close();

		return count;
	}

	public static long getRejectedLeaveCount() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Long count = (Long) session.createQuery("select count(*) from LeaveRequest where status='Rejected'")
				.uniqueResult();

		session.close();

		return count;
	}

	public static List<LeaveRequest> getEmployeeLeaves(String empId, String keyword, int page, int pageSize) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "from LeaveRequest lr " + "where lr.employee.emp_id = :empId ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and (" + "lower(lr.leaveType.leaveName) like :key " + "or lower(lr.status) like :key" + ") ";

		}

		hql += "order by lr.applied_date desc";

		Query<LeaveRequest> query = session.createQuery(hql, LeaveRequest.class);

		query.setParameter("empId", empId);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		query.setFirstResult((page - 1) * pageSize);

		query.setMaxResults(pageSize);

		List<LeaveRequest> list = query.list();

		session.close();

		return list;

	}

	public static long getEmployeeLeaveCount(String empId, String keyword) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "select count(lr) " + "from LeaveRequest lr " + "where lr.employee.emp_id = :empId ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and (" + "lower(lr.leaveType.leaveName) like :key " + "or lower(lr.status) like :key" + ")";

		}

		Query<Long> query = session.createQuery(hql, Long.class);

		query.setParameter("empId", empId);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		long total = query.uniqueResult();

		session.close();

		return total;

	}

	public static void updateStatus(int leaveId, String status) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Transaction tx = session.beginTransaction();

		LeaveRequest leave = session.get(LeaveRequest.class, leaveId);

		if (leave != null) {

			leave.setStatus(status);

			session.update(leave);

		}

		tx.commit();

		session.close();

	}

	// for Emp dashboard

	public static long getPendingLeaves(String empId) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<Long> query = session
				.createQuery("select count(*) from LeaveRequest where emp_id=:id and status='PENDING'", Long.class);

		query.setParameter("id", empId);

		long count = query.uniqueResult();

		session.close();

		return count;
	}

	public static long getApprovedLeaves(String empId) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<Long> query = session
				.createQuery("select count(*) from LeaveRequest where emp_id=:id and status='APPROVED'", Long.class);

		query.setParameter("id", empId);

		long count = query.uniqueResult();

		session.close();

		return count;
	}

	public static long getRejectedLeaves(String empId) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<Long> query = session
				.createQuery("select count(*) from LeaveRequest where emp_id=:id and status='REJECTED'", Long.class);

		query.setParameter("id", empId);

		long count = query.uniqueResult();

		session.close();

		return count;
	}

	public static List<LeaveRequest> getRecentLeaveRequests() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<LeaveRequest> query = session.createQuery(

				"select lr from LeaveRequest lr " + "join fetch lr.employee " + "join fetch lr.leaveType "
						+ "order by lr.applied_date desc",

				LeaveRequest.class);

		query.setMaxResults(5);

		List<LeaveRequest> list = query.list();

		session.close();

		return list;
	}

	// for Employee dashboard
	public static List<LeaveRequest> getRecentLeaves(String empId) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<LeaveRequest> query = session.createQuery(
				"from LeaveRequest " + "where employee.emp_id = :empId " + "order by applied_date desc",
				LeaveRequest.class);

		query.setParameter("empId", empId);

		query.setMaxResults(5);

		List<LeaveRequest> list = query.list();

		session.close();

		return list;
	}

}
