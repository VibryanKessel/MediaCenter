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


@Path("borrows")
public class BorrowRequests {
    List<Media> medias;
    
    Connection con = null;
    
    public BorrowRequests(){
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

/*-------Get Borrow of a user------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("borrower/{pseudo}")
    public List<Borrow> getBorrows(@PathParam("pseudo") String pseudo){
        String sql = "select * from borrow where borrower = "+"'"+pseudo+"'";
        List<Borrow> borrows = new ArrayList<>();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
                Borrow borrow = new Borrow();
                borrow.setIdBorrow(rs.getInt(1));
                borrow.setBorrower(rs.getString(2));
                borrow.setIdMedia(rs.getString(3));    
                
                borrows.add(borrow);
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return borrows;
    }
    
    /*-------Get borrowed medias of a user------*/
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("owner/{pseudo}")
    public List<Borrow> getLoanedMedias(@PathParam("pseudo") String pseudo){
        String sql = "select DISTINCT media.* from borrow,media where borrow.idMedia = media.id and media.owner = "+"'"+pseudo+"'";
        List<Borrow> loanedMedias = new ArrayList<>();
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()) {
                Borrow borrow = new Borrow();
                borrow.setIdBorrow(rs.getInt(1));
                borrow.setBorrower(rs.getString(2));
                borrow.setIdMedia(rs.getString(3));    
                
                loanedMedias.add(borrow);
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        
        return loanedMedias;
    }
    /*---------------insert a borrow---------------*/
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("add")
    public void insert(Borrow brw) {
        String sql = "insert into borrow(borrower,idMedia) values (?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,brw.getBorrower());
            st.setString(2,brw.getIdMedia());
            
            st.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
    }
}