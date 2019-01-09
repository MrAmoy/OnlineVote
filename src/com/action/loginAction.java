package com.action;

import com.dao.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
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
            String imgPath = ServletActionContext.getServletContext().getResource("./").getPath() + "/image";
            File f = new File(imgPath);
            String[] name = f.list();
            list = new ArrayList<>();
            for(String imgname: name) {
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

    public String getAllName() throws Exception {
        List<String> allName =  dataDAO.queryAllName();
        ac.getSession().put("allName", allName);
        return SUCCESS;
    }
}
