package com.action;

import com.dao.*;
import com.bean.image;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.io.File;
import java.util.*;

public class loginAction extends ActionSupport {
    private String username;
    private String password;
    private List<String> list;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    ActionContext ac = ActionContext.getContext();

    public String execute() throws Exception {
        if(loginCheck.Check(getUsername(),getPassword())) {
            ac.getSession().put("username", getUsername());

            File f = new File("E:\\IdeaProjects\\OnlineVote\\web\\image");
            //File f = new File(".\\.\\");
            String[] name = f.list();
            list = new ArrayList<>();
            for(String imgname: name){
                list.add(imgname);
            }
            ac.getSession().put("list", list);
            return SUCCESS;
        } else {
            ActionContext.getContext().put("tip", "用户名和密码错误！");
        }
        return ERROR;
    }

    public String checkVote() throws Exception {
        if (dataDAO.checkVote((String) ac.getSession().get("username"))) {
            return "yes";
        }
        return "no";
    }
}
