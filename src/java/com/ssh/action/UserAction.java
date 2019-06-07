package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.ssh.service.UserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport {

    private String name;
    private String pwd;
    private static Logger LOG = LoggerFactory.getLogger(UserAction.class);

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Resource
    private UserService userService;

    ActionContext actionContext = ActionContext.getContext();
    Map session = actionContext.getSession();

    public String checkUser(){
        if(userService.checkUser(name,pwd)){
            session.put("name", name);
            if(name.equals("admin")){
                return "admin";
            }else {
                return SUCCESS;
            }
        }
        else{
            LOG.debug("登陆失败");
            addActionMessage("用户名或密码错误");
            return INPUT;
        }
    }
    public String zhuxiao(){
        session.remove("name");
        return SUCCESS;
    }
}

