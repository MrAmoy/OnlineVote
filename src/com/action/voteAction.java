package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.dao.dataDAO;


public class voteAction extends ActionSupport {


    private String[] image;

    public String[] getImage() {
        return image;
    }

    public void setImage(String[] image) {
        this.image = image;
    }


    public String execute() throws Exception {
        /*
         *检查该用户的投票状态；若还没有投过票，则让该用户投的图片票数+1，并且让该用户的状态投票状态变更为1，即已投票。
         *若用户已投过票，则票数不在累加
         */
        if(!dataDAO.checkVote((String) ActionContext.getContext().getSession().get("username"))) {
            for(String n: image) {
                dataDAO.insertImage(n);
                dataDAO.count(n);
            }
            //用户投票后修改投票状态为已投票
            dataDAO.alterVoteStatus((String) ActionContext.getContext().getSession().get("username"));
            return SUCCESS;
        }
        return ERROR;
    }
}
