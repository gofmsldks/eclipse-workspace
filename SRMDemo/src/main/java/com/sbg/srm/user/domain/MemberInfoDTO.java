package com.sbg.srm.user.domain;

public class MemberInfoDTO {

	private String user_id;
    private String user_pw;
    private String user_name;
    private String session_key;
    private String session_limit;
    private String join_date;
    private String user_email;

    public String getUser_id() {
        return user_id;
    }
 
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
 
    public String getUser_pw() {
        return user_pw;
    }
 
    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }
 
    public String getUser_name() {
        return user_name;
    }
 
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    
    public String getSession_key() {
        return session_key;
    }
 
    public void setSession_key(String session_key) {
        this.session_key = session_key;
    }

    public String setSession_limit() {
        return session_limit;
    }
 
    public void getSession_limit(String session_limit) {
        this.session_limit = session_limit;
    }
    
    public String getJoin_date() {
        return join_date;
    }
 
    public void setJoin_date(String join_date) {
        this.join_date = join_date;
    }
    
    public String getUser_email() {
        return user_email;
    }
 
    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }
}
