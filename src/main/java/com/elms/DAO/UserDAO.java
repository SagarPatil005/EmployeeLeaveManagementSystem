package com.elms.DAO;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.elms.Hibernate.Util.CreateFactory;
import com.elms.Models.User;

public class UserDAO {

	public static User login(String userName, String password, String role) {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<User> query = session
				.createQuery("from User where username = :u " + "and password = :p " + "and role = :r", User.class);

		query.setParameter("u", userName);
		query.setParameter("p", password);
		query.setParameter("r", role);

		User user = query.uniqueResult();

		session.close();

		return user;
	}

	public static boolean saveAdmin(User user) {
		Session session = CreateFactory.getSessionFactory().openSession();

		Transaction tx = session.beginTransaction();

		try {

			session.save(user);

			tx.commit();

			return true;

		} catch (Exception e) {

			tx.rollback();

			e.printStackTrace();

			return false;

		} finally {

			session.close();

		}

	}

	public static List<User> getAllAdmins() {

		Session session = CreateFactory.getSessionFactory().openSession();

		Query<User> query = session.createQuery("from User where role='ADMIN'", User.class);

		List<User> list = query.list();

		session.close();

		return list;

	}

	public static boolean updateAdmin(int userId, String username, String password) {

		Transaction tx = null;

		try (Session session = CreateFactory.getSessionFactory().openSession()) {

			tx = session.beginTransaction();

			// Check duplicate username (excluding current admin)
			Query<Long> checkQuery = session.createQuery(
					"select count(u) from User u where u.username = :username and u.user_id <> :id", Long.class);

			checkQuery.setParameter("username", username);
			checkQuery.setParameter("id", userId);

			Long count = checkQuery.uniqueResult();

			if (count != null && count > 0) {
				return false;
			}

			User user = session.get(User.class, userId);

			if (user == null) {
				return false;
			}

			user.setUsername(username);
			user.setPassword(password);

			session.update(user);

			tx.commit();

			return true;

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();

			e.printStackTrace();

			return false;
		}

	}

	public static boolean deleteAdmin(int userId) {

		Transaction tx = null;

		try (Session session = CreateFactory.getSessionFactory().openSession()) {

			tx = session.beginTransaction();

			User user = session.get(User.class, userId);

			if (user == null) {
				return false;
			}

			session.delete(user);

			tx.commit();

			return true;

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();

			e.printStackTrace();

			return false;
		}

	}

	public static List<User> getAdmins(String keyword, int page, int pageSize) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "from User u where u.role='ADMIN' ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and (" + "lower(u.username) like :key "  + ") ";

		}

		hql += "order by u.user_id";

		Query<User> query = session.createQuery(hql, User.class);

		if (keyword != null && !keyword.trim().isEmpty()) {

			query.setParameter("key", "%" + keyword.toLowerCase() + "%");

		}

		query.setFirstResult((page - 1) * pageSize);

		query.setMaxResults(pageSize);

		List<User> list = query.list();

		session.close();

		return list;
	}

	public static long getAdminCount(String keyword) {

		Session session = CreateFactory.getSessionFactory().openSession();

		String hql = "select count(u) from User u where u.role='ADMIN' ";

		if (keyword != null && !keyword.trim().isEmpty()) {

			hql += "and (" + "lower(u.username) like :key " + ")";

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
