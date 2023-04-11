package org.project.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.project.entities.User;

public class UserDao {

	static SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class)
			.buildSessionFactory();

	public User userLogin(String email, String password) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("from user where email=:email and password=:password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		User user = (User) query.uniqueResult();
		if (user != null) {
			System.out.println("username and password are valid");
		} else {
			System.out.println("username and password are not valid");
		}
		return user;
	}

	public boolean addUser(User user) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		return true;
	}
}
