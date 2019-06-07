package com.ssh.model;

public class CommentDao {
    private String userName;
    private String commentContent;
    private String articleID;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }
    public void addComments(String userName,String commentContent,String articleID){
        this.userName = userName;
        this.articleID = articleID;
        this.commentContent = commentContent;
    }

}
