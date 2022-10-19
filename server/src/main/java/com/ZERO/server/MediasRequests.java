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
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("medias")
public class MediasRequests {
    List<Media> medias;
    
    Connection con = null;
    
    public MediasRequests(){
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

    /*-------Get all medias------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
   
    public List<Media> getMedias(){
        List<Media> medias = new ArrayList<>();
        String sql = "select * from media";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
                Media media = new Media();
                media.setId(rs.getInt(1));
                media.setCategory(rs.getString(2));
                media.setTitle(rs.getString(3));
                media.setAuthor(rs.getString(4));
                media.setOwner(rs.getString(5));
                media.setRate(rs.getInt(6));
                
                medias.add(media); 
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return medias;
    }
    
    
    /*----------Insert a media-----------*/
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("add")
    public void insert(Media media) {
        String sql = "insert into media(category,title,author,owner,rate) values (?,?,?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,media.getCategory());
            st.setString(2,media.getTitle());
            st.setString(3,media.getAuthor());
            st.setString(4,media.getOwner());
            st.setInt(5,media.getRate());
            
            st.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
    }
    
    /*----------Update a media-----------*/
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("update/{id}")
    public void insert(@PathParam("id") Integer id, Media media) {
        String sql = "update media set category = ?, title = ?, author = ?, owner = ?, rate = ? where id = "+"'"+id+"'";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,media.getCategory());
            st.setString(2,media.getTitle());
            st.setString(3,media.getAuthor());
            st.setString(4,media.getOwner());
            st.setInt(5,media.getRate());
            
            st.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
    }
    
    /*-------Get Media by id------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("{id}")
    public Media getMediaById(@PathParam("id") Integer id){
        String sql = "select * from media where id = "+"'"+id+"'";
        Media media = new Media();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            if(rs.next()) {
                media.setId(rs.getInt(1));
                media.setCategory(rs.getString(2));
                media.setTitle(rs.getString(3));
                media.setAuthor(rs.getString(4));
                media.setOwner(rs.getString(5));
                media.setRate(rs.getInt(6));    
                
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return media;
    }
    
    /*-------Filter Media by Category------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("category/{category}")
    public List<Media> getMediaByCategory(@PathParam("category") String category){
        String sql = "select * from media where category = "+"'"+category+"'";
        List<Media> mediasByCategory = new ArrayList<>();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
                Media media = new Media();
                media.setId(rs.getInt(1));
                media.setCategory(rs.getString(2));
                media.setTitle(rs.getString(3));
                media.setAuthor(rs.getString(4));
                media.setOwner(rs.getString(5));
                media.setRate(rs.getInt(6));    
                
                mediasByCategory.add(media);
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return mediasByCategory;
    }
    
    /*-------Filter Media by City------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("city/{city}")
    public List<Media> getMediaByCity(@PathParam("city") String city){
        String sql = "select * from media where city = "+"'"+city+"'";
        List<Media> mediasByCity = new ArrayList<>();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
                Media media = new Media();
                media.setId(rs.getInt(1));
                media.setCategory(rs.getString(2));
                media.setTitle(rs.getString(3));
                media.setAuthor(rs.getString(4));
                media.setOwner(rs.getString(5));
                media.setRate(rs.getInt(6));    
                
                mediasByCity.add(media);
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return mediasByCity;
    }
    
    /*-------Filter Media by Keyword------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("Key/{keyword}")
    public List<Media> getMediaByKeyWord(@PathParam("keyword") String keyword){
        String sql = "select * from media where title LIKE "+"'"+keyword+"%'";
        List<Media> mediasByKey = new ArrayList<>();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
                Media media = new Media();
                media.setId(rs.getInt(1));
                media.setCategory(rs.getString(2));
                media.setTitle(rs.getString(3));
                media.setAuthor(rs.getString(4));
                media.setOwner(rs.getString(5));
                media.setRate(rs.getInt(6));    
                
                mediasByKey.add(media);
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return mediasByKey;
    }
    
    /*----------Delete a media-----------*/
    @POST
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete")
    public void delete(Integer id) {
        String sql = "delete from media where id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,id);

            st.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
    }
}