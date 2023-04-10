package org.project.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.project.entities.Product;
import org.project.entities.User;

public class UserDao {

	static SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class)
			.buildSessionFactory();

	public static User userLogin(String email, String password) {
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

	public static void addUser(User user) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		System.out.println(user.getName() + " Got added");
	}

	public static void main(String args[]) {
		User user = new User("akib", "6350593403", "akib@gmail.com", "akib");
		addUser(user);

	}
}
