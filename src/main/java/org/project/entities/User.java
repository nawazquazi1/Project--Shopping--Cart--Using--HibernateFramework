package org.project.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "user")
@Table(name = "user")
public class User {

	@Id
	@Column(name = "id")
	int id;

	@Column(name = "name")
	String name;

	@Column(name = "contact")
	String contact;

	@Column(name = "email")
	private String email;

	@Column(name = "password")
	private String password;
	
	@Column(name = "profile")
	private String profile;

	public User() {
	}

	public User(String name, String contact, String email, String password) {
		this.name = name;
		this.contact = contact;
		this.email = email;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User(int id, String name, String contact, String email, String password,String profile) {
		super();
		this.id = id;
		this.name = name;
		this.contact = contact;
		this.email = email;
		this.password = password;
		this.profile=profile;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", contact=" + contact + ", email=" + email + ", password="
				+ password + ", profile=" + profile + "]";
	}

	
}
