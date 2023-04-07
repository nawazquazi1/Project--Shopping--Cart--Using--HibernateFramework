package org.project.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.project.entities.Product;

public class ProductDao {
	static SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Product.class)
			.buildSessionFactory();

	public static void addFileDetails(Product product) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(product);
		session.getTransaction().commit();
		System.out.println(product.getImage() + " Got added");
	}

	public static void main(String args[]) {
		Product p = new Product("Furniture Cafe Wooden Wall Shelves", "Furniture", 450d, "2.jpg",
				"𝐈𝐦𝐩𝐫𝐨𝐯𝐞𝐝 𝐀𝐞𝐬𝐭𝐡𝐞𝐭𝐢𝐜𝐬 & 𝐀𝐦𝐩𝐥𝐞 𝐒𝐭𝐨𝐫𝐚𝐠𝐞 Turn the empty corners of your bedroom, bathroom, kitchen, or workspace into additional storage space with this contemporary decorative wall shelf that will surely complement your home decor.");
		addFileDetails(p);

	}

}
