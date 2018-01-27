package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.dao.*;
import com.bean.*;
import org.apache.struts2.ServletActionContext;

public class registAction extends ActionSupport {
    private String username;
    private String password1;
    private String password2;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }


    public String regist() throws Exception {
        user u = new user();
        u.setUsername(getUsername());
        //if (!getUsername().equals("") && !getPassword1().equals("") && !getPassword2().equals("") && getPassword1().equals(getPassword2())) {
            u.setPassword(getPassword2());
            if (dataDAO.insertUser(u)) {
                String imgPath = ServletActionContext.getServletContext().getResource("./").getPath() + "/image";
                File f = new File(imgPath);
                String[] name = f.list();
                List<String> list = new ArrayList<>();
                for(String imgname: name){
                    list.add(imgname);
                }
                ActionContext.getContext().getSession().put("list", list);
                ActionContext.getContext().getSession().put("username", getUsername());
                return SUCCESS;
            }
        //}
        ActionContext.getContext().put("tip", "此用户名已注册！");
        return ERROR;
    }
}
