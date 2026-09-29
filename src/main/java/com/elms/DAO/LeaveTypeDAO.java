package com.elms.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.elms.Hibernate.Util.CreateFactory;
import com.elms.Models.LeaveType;

public class LeaveTypeDAO {
	public static boolean saveLeaveType(LeaveType leave) {

		Session session = CreateFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		session.save(leave);

		tx.commit();

		session.close();
		return true;
	}

	public static List<LeaveType> getAllLeaveTypes() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<LeaveType> query = session.createQuery("from LeaveType", LeaveType.class);

		List<LeaveType> list = query.list();

		session.close();

		return list;
	}

	public static long getLeaveTypeCount() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Long count = (Long) session.createQuery("select count(*) from LeaveType").uniqueResult();

		session.close();

		return count;
	}

	public static LeaveType getLeaveTypeById(int id) {

		Session session = CreateFactory.getSessionFactory().openSession();

		LeaveType leaveType = session.get(LeaveType.class, id);

		session.close();

		return leaveType;
	}

	public static boolean updateLeaveType(int leaveTypeId, String leaveName) {

		Transaction tx = null;

		try {

			Session session = CreateFactory.getSessionFactory().openSession();

			tx = session.beginTransaction();

			LeaveType leave = session.get(LeaveType.class, leaveTypeId);

			if (leave == null) {

				session.close();

				return false;

			}

			Query<LeaveType> query = session
					.createQuery("from LeaveType where lower(leaveName)=:name and leaveTypeId<>:id", LeaveType.class);

			query.setParameter("name", leaveName.toLowerCase());

			query.setParameter("id", leaveTypeId);

			LeaveType existing = query.uniqueResult();

			if (existing != null) {

				session.close();

				return false;

			}

			leave.setLeaveName(leaveName);

			tx.commit();

			session.close();

			return true;

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();

			e.printStackTrace();

			return false;

		}

	}

	public static List<LeaveType> getLeaveTypes(String keyword, int page, int pageSize) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "from LeaveType l where 1=1 ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and lower(l.leaveName) like :key ";

		}

		hql += "order by l.leaveTypeId";

		Query<LeaveType> query = session.createQuery(hql, LeaveType.class);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		query.setFirstResult((page - 1) * pageSize);

		query.setMaxResults(pageSize);

		List<LeaveType> list = query.list();

		session.close();

		return list;
	}

	public static long getLeaveTypeCount(String keyword) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "select count(l) from LeaveType l where 1=1 ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and lower(l.leaveName) like :key";

		}

		Query<Long> query = session.createQuery(hql, Long.class);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		long total = query.uniqueResult();

		session.close();

		return total;
	}
}
