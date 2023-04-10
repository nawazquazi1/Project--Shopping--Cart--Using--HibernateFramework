package org.project.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.project.entities.Product;

public class ProductDao {
	static SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Product.class)
			.buildSessionFactory();

	public static void addProductDetails(Product product) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(product);
		session.getTransaction().commit();
		System.out.println(product.getImage() + " Got added");
	}

	public static List<Product> listProduct() {
		Session session = factory.openSession();
		session.beginTransaction();
		List<Product> product = session.createQuery("from products").getResultList();
		// session.getTransaction().commit();
		return product;
	}

	public static void main(String args[]) {
		List<Product> products = ProductDao.listProduct();
		if (!products.isEmpty()) {
			for (Product p : products) {

			}
		}

	}

}
