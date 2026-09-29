package com.elms.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.elms.Hibernate.Util.CreateFactory;
import com.elms.Models.Employee;
import com.elms.Models.LeaveRequest;
import com.elms.Models.User;

public class EmployeeDAO {

	public static boolean saveEmployee(Employee emp, User user) {

		Session session = null;
		Transaction tx = null;

		try {

			session = CreateFactory.getSessionFactory().openSession();

			tx = session.beginTransaction();

			// Save User
			session.save(user);

			// Set generated user ID in Employee
			emp.setUser_id(user.getUser_id());

			// Save Employee
			session.save(emp);

			tx.commit();

			return true;

		} catch (org.hibernate.exception.ConstraintViolationException e) {

			if (tx != null) {
				tx.rollback();
			}

			System.out.println("Duplicate entry: " + e.getMessage());

			return false;

		} catch (Exception e) {

			if (tx != null) {
				tx.rollback();
			}

			e.printStackTrace();

			return false;

		} finally {

			if (session != null && session.isOpen()) {
				session.close();
			}
		}
	}

	public static List<Employee> getEmployee() {

		Session session = CreateFactory.getSessionFactory().openSession();
		List<Employee> list = session.createQuery("from Employee", Employee.class).list();

		session.close();
		return list;

	}

	public static long getEmployeeCount() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Long count = (Long) session.createQuery("select count(*) from Employee").uniqueResult();

		session.close();

		return count;
	}

	public static Employee getEmployeeByUserId(int userId) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<Employee> query = session.createQuery("from Employee where user_id=:uid", Employee.class);

		query.setParameter("uid", userId);

		Employee emp = query.uniqueResult();

		session.close();

		return emp;
	}

	public static Employee getEmployeeById(String empId) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Employee emp = session.get(Employee.class, empId);

		session.close();

		return emp;
	}

	public static boolean updateEmployee(Employee emp) {

		Transaction tx = null;

		try {

			Session session = CreateFactory.getSessionFactory().openSession();

			tx = session.beginTransaction();

			Query<Employee> query = session.createQuery(

					"from Employee where emp_id=:id",

					Employee.class

			);

			query.setParameter("id", emp.getEmp_id());

			Employee dbEmp = query.uniqueResult();

			if (dbEmp == null) {

				session.close();

				return false;

			}

			dbEmp.setName(emp.getName());

			dbEmp.setEmail(emp.getEmail());

			dbEmp.setMobile_no(emp.getMobile_no());

			dbEmp.setDepartment(emp.getDepartment());
			dbEmp.setStatus(emp.getStatus());

			tx.commit();

			session.close();

			return true;

		} catch (Exception e) {

			if (tx != null) {

				tx.rollback();

			}

			e.printStackTrace();

			return false;

		}

	}

	public static boolean deactivateEmployee(String empId) {

		Transaction tx = null;

		try {

			Session session = CreateFactory.getSessionFactory().openSession();

			tx = session.beginTransaction();

			Query<Employee> query = session.createQuery(

					"from Employee where emp_id=:id",

					Employee.class);

			query.setParameter("id", empId);

			Employee emp = query.uniqueResult();

			if (emp == null) {

				session.close();

				return false;

			}

			emp.setStatus("Inactive");

			tx.commit();

			session.close();

			return true;

		} catch (Exception e) {

			if (tx != null) {

				tx.rollback();

			}

			e.printStackTrace();

			return false;

		}

	}

	public static List<Employee> getEmployees(String keyword, int page, int pageSize) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "from Employee where 1=1 ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and (" + "lower(emp_id) like :key " + "or lower(name) like :key " + "or lower(email) like :key "
					+ "or lower(department) like :key " + "or lower(status) like :key" + ") ";

		}

		hql += "order by emp_id";

		Query<Employee> query = session.createQuery(hql, Employee.class);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		query.setFirstResult((page - 1) * pageSize);

		query.setMaxResults(pageSize);

		List<Employee> list = query.list();

		session.close();

		return list;
	}

	public static long getEmployeeCount(String keyword) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "select count(e) from Employee e where 1=1 ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and (" + "lower(emp_id) like :key " + "or lower(name) like :key " + "or lower(email) like :key "
					+ "or lower(department) like :key " + "or lower(status) like :key" + ")";

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
