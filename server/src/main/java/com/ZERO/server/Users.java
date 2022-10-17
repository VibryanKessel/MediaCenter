package com.ZERO.server;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("users")
public class Users {
	List<User> users;
	
	Connection con = null;
	
	public Users(){
		String url = "jdbc:mysql://localhost:3306/mediacenter";
		String Uname = "root";
		String pwd = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,Uname,pwd);
		}catch(Exception e) {
			System.out.println(e);
		}
	}

	/*-------Get all users------*/
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public User getUsers(){
		List<User> users = new ArrayList<>();
		String sql = "select * from users";
		User user = new User();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				user.setPseudo(rs.getString(1));
				user.setFirstname(rs.getString(2));
				user.setLastname(rs.getString(3));
				
				users.add(user); 
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return user;
	}
	
	/*-------Get a User with its pseudo------*/
	public User getUser(String pseudo){
		String sql = "select * from users where pseudo = "+pseudo;
		User user = new User();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			if(rs.next()) {
				user.setPseudo(rs.getString(1));
				user.setFirstname(rs.getString(2));
				user.setLastname(rs.getString(3));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return user;
	}
	
	/*----------Insert a user-----------*/
	public void insert(User user) {
		String sql = "insert into users values (?,?,?)";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,user.getPseudo());
			st.setString(2,user.getFirstname());
			st.setString(3,user.getLastname());
			st.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
