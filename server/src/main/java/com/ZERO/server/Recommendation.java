package com.ZERO.server;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Recommendation {
    private Integer idRecommendation;
    private String recommender;
    private Integer idMedia;
    
    public Integer getIdRecommendation() {
        return idRecommendation;
    }
    public void setIdRecommendation(Integer idRecommendation) {
        this.idRecommendation = idRecommendation;
    }
    public String getRecommender() {
        return recommender;
    }
    public void setRecommender(String recommender) {
        this.recommender = recommender;
    }
    public Integer getIdMedia() {
        return idMedia;
    }
    public void setIdMedia(Integer idMedia) {
        this.idMedia = idMedia;
    }
    
    
}