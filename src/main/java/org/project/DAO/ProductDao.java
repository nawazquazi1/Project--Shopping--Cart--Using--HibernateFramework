package org.project.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.project.entities.Cart;
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

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> item = new ArrayList<>();
		Session session = factory.openSession();
		session.beginTransaction();
		if (cartList.size() > 0) {
			for (Cart ca : cartList) {
				item = (List<Cart>) session.get(Product.class, ca.getId());
			}
		}
		session.getTransaction().commit();
		return item;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		Session session = factory.openSession();
		session.beginTransaction();
		if (cartList.size() > 0) {
			for (Cart item : cartList) {
				Query query = session.createQuery("select price from products where id=:id");
				query.setParameter("id", item.getId());
				Product product = (Product) query.uniqueResult();
				sum += product.getPrice() * item.getQuantity();
			}
		}
		return sum;
	}
	public static void main(String[] args) {
		Cart cm = new Cart();
		cm.setId(3);
		cm.setQuantity(1);
		ArrayList<Cart> cart_list = new ArrayList<Cart>();
		cart_list.add(cm);
		List<Cart> cartProduct = null;
		if (cart_list != null) {
			for( Cart item :cart_list) {
			ProductDao Dao = new ProductDao();
			cartProduct = Dao.getCartProducts(cart_list);
			double total = Dao.getTotalCartPrice(cart_list);
			System.out.println(total);
			System.out.println(cartProduct);
		}
}
	}
}
