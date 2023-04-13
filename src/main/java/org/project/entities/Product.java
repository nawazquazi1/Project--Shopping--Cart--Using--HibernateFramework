package org.project.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "products")
@Table(name = "products")
public class Product {

	@Id
	@Column(name = "id")
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "categories")
	private String category;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "image")
	private String image;
	
	@Column(name = "description")
	private String about;

	public Product(int id, String name, String category, Double price, String image, String about) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
		this.about = about;
	}

	public Product(String name, String category, Double price, String image, String about) {
		super();
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
		this.about = about;
	}

	public Product() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
				+ image + ", about=" + about + "]";
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

}
