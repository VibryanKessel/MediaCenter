package com.ZERO.server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;


@Path("recommendations")
public class RecommendationRequests {
    List<Media> medias;
    
    Connection con = null;
    
    public RecommendationRequests(){
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

/*-------Get Recommendations of a user------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("recommender/{pseudo}")
    public List<Recommendation> getRecommendations(@PathParam("pseudo") String pseudo){
        String sql = "select * from recommendation where recommender = "+"'"+pseudo+"'";
        List<Recommendation> recommendations = new ArrayList<>();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
                Recommendation recommendation = new Recommendation();
                recommendation.setIdRecommendation(rs.getInt(1));
                recommendation.setRecommender(rs.getString(2));
                recommendation.setIdMedia(rs.getInt(3));    
                
                recommendations.add(recommendation);
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return recommendations;
    }
    
    /*-------Get list of users who recommended a media------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("media/{id}")
    public List<User> getRecommenders(@PathParam("id") Integer id){
        String sql = "select users.* from users,recommendation where media.id = recommendation.idMedia and media.idMedia = "+"'"+id+"'";
        List<User> recommenders = new ArrayList<>();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
                User u = new User();
                u.setPseudo(rs.getString(1));
                u.setFirstname(rs.getString(2));
                u.setLastname(rs.getString(3));
                u.setPassword(rs.getString(4));
                
                recommenders.add(u);
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return recommenders;
    }
    
    /*------insert a recommendation-------------*/
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("add")
    public void insert(Recommendation rcmdt) {
        String sql = "insert into recommendation(recommender,idMedia) values (?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,rcmdt.getRecommender());
            st.setInt(2,rcmdt.getIdMedia());
            
            st.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
    }
    
}