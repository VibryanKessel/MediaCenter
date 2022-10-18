package com.ZERO.server;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class User {
	private String pseudo;
	private String firstname;
	private String lastname;
	private String password;
	
	/*-----------Getters and Setters------------*/
	
	public String getPseudo() {
		return pseudo;
	}
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
   public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
