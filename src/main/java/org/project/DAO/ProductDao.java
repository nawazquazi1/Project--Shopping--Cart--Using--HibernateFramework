package org.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
	private Connection con;

	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public ProductDao(Connection con) {
		super();
		this.con = con;
	}

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
		List<Cart> book = new ArrayList<>();
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select * from products where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setPrice(rs.getDouble("price") * item.getQuantity());
						row.setQuantity(item.getQuantity());
						row.setImage(rs.getString("image"));
						book.add(row);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return book;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select price from products where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("price") * item.getQuantity();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return sum;
	}

	public Product getSingleProduct(int id) {
		Product row = null;
		try {
			query = "select * from products where id=? ";

			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setImage(rs.getString("categories"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setAbout(rs.getString("description"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return row;
	}

	public List<Product> getPostByCatId(int catId) {
		List<Product> list = new ArrayList<>();
		// fetch all post by id
		// fetch all the post
		try {

			PreparedStatement p = con.prepareStatement("");
			p.setInt(1, catId);
			ResultSet set = p.executeQuery();

			while (set.next()) {

				int id = set.getInt("id");
				String pName = set.getString("name");
				String pCategories = set.getString("categories");
				double pPrice = set.getDouble("price");
				String pPic = set.getString("image");
				String pAbout = set.getString("about");
				Product post = new Product(id, pName, pCategories, pPrice, pPic, pAbout);
				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getAllProduct() {

		List<Product> list = new ArrayList<>();
		// fetch all the post
		try {

			PreparedStatement p = con.prepareStatement("SELECT DISTINCT name,categories ,FROM products");

			ResultSet set = p.executeQuery();

			while (set.next()) {
				int id = set.getInt("id");
				String pName = set.getString("name");
				String pCategories = set.getString("categories");
				double pPrice = set.getDouble("price");
				String pPic = set.getString("image");
				String pAbout = set.getString("about");
				Product post = new Product(id, pName, pCategories, pPrice, pPic, pAbout);
				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {

	}
}
