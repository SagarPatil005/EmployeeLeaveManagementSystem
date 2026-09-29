package com.elms.Hibernate.Util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class CreateFactory {

	private static SessionFactory factory;

	static {
		Configuration con = new Configuration();
		con.configure("hibernate.cfg.xml");
		factory = con.buildSessionFactory();
	}

	public static SessionFactory getSessionFactory() {
		return factory;
	}
}
