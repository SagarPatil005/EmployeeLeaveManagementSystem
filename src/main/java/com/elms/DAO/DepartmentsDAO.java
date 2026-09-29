package com.elms.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.elms.Hibernate.Util.CreateFactory;
import com.elms.Models.Departments;
import com.elms.Models.Employee;
import com.elms.Models.User;

public class DepartmentsDAO {

	public static boolean saveDepartments(Departments dept) {

		Session session = CreateFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		session.save(dept);

		tx.commit();

		session.close();
		return true;
	}

	public static List<Departments> getDepartments() {

		Session session = CreateFactory.getSessionFactory().openSession();
		List<Departments> list = session.createQuery("from Departments", Departments.class).list();

		session.close();
		return list;

	}

	public static long getDepartmentsCount() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Long count = (Long) session.createQuery("select count(*) from Departments").uniqueResult();

		session.close();

		return count;
	}

	public static boolean updateDepartment(int deptId, String deptName) {

		Transaction tx = null;

		try {

			Session session = CreateFactory.getSessionFactory().openSession();

			tx = session.beginTransaction();

			Departments dept = session.get(Departments.class, deptId);

			if (dept == null) {

				session.close();

				return false;

			}

			Query<Departments> query = session.createQuery(

					"from Departments where lower(dept_name)=:name and dept_id<>:id",

					Departments.class);

			query.setParameter("name", deptName.toLowerCase());

			query.setParameter("id", deptId);

			Departments existing = query.uniqueResult();

			if (existing != null) {

				session.close();

				return false;

			}

			dept.setDept_name(deptName);

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

	public static List<Departments> getDepartments(String keyword, int page, int pageSize) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "from Departments d where 1=1 ";

		if (keyword != null && !keyword.trim().isEmpty()) {

		    hql += "and lower(d.dept_name) like :key ";

		}

		hql += "order by d.dept_id";

		Query<Departments> query = session.createQuery(hql, Departments.class);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		query.setFirstResult((page - 1) * pageSize);

		query.setMaxResults(pageSize);

		List<Departments> list = query.list();

		session.close();

		return list;
	}

	public static long getDepartmentCount(String keyword) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "select count(d) from Departments d where 1=1 ";

		if (keyword != null && !keyword.trim().isEmpty()) {

		    hql += "and lower(d.dept_name) like :key";

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
