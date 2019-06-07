package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.CommentDao;
import com.ssh.model.User;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;
import java.io.IOException;
import java.util.List;

@Controller("testAction")
@Scope("prototype")
public class TestAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    private String userName;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

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

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    private String commentContent;
    private String articleID;
    private String result;

    public String loadUser() throws Exception{
        HttpServletRequest request= ServletActionContext.getRequest();
        CommentDao commentDAO=new CommentDao();
        commentDAO.addComments(this.userName, this.commentContent, this.articleID);
        this.setResult("评论成功");
        return "success";

    }

    public  String test() throws IOException {
        HttpServletResponse resp = ServletActionContext.getResponse() ;

        resp.setCharacterEncoding("utf-8") ;
        resp.getWriter().print("struts ajax") ;

        return null ;

    }


}
