package com.ZERO.server;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;  
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("users")
public class UsersRequests {
    List<User> users;
    
    Connection con = null;
    
    public UsersRequests(){
        String url = "jdbc:mysql://localhost:8001/mediacenter";
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
    @Produces(MediaType.APPLICATION_JSON)
   
    public List<User> getUsers(){
        List<User> users = new ArrayList<>();
        String sql = "select * from users";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
                User user = new User();
                user.setPseudo(rs.getString(1));
                user.setFirstname(rs.getString(2));
                user.setLastname(rs.getString(3));
                user.setPassword(rs.getString(4));
                users.add(user); 
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return users;
    }
    
    /*-------Get a User with its pseudo------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.TEXT_PLAIN)
    @Path("{pseudo}")
    public User getUser(@PathParam("pseudo") String pseudo){
        String sql = "select * from users where pseudo = "+"'"+pseudo+"'";
        User user = new User();
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            if(rs.next()) {
                user.setPseudo(rs.getString(1));
                user.setFirstname(rs.getString(2));
                user.setLastname(rs.getString(3));
                user.setLastname(rs.getString(4));
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return user;
    }
    
    /*----------Insert a user-----------*/
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("add")
    public void insert(User user) {
        String sql = "insert into users values (?,?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,user.getPseudo());
            st.setString(2,user.getFirstname());
            st.setString(3,user.getLastname());
            st.setString(4,user.getPassword());
            st.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
    }
}
