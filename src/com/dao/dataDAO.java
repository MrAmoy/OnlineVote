package com.dao;

import java.sql.*;
import com.bean.*;
import java.util.List;
import java.util.ArrayList;

public class dataDAO {

    public static List<image> queryAllImg() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBGet.getConnection();
            String sql = "select * from voteInfo";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            List<image> list = new ArrayList<>();
            image img;
            while (rs.next()) {
                img = new image();
                img.setImgName(rs.getString("imgName"));
                img.setImgPath(rs.getString("imgPath"));
                img.setOptName(rs.getString("optName"));
                img.setVoteNum(rs.getString("voteNum"));
                list.add(img);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closeResultSet(rs);
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
        }
        return null;
    }

    public static List<String> queryAllName() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBGet.getConnection();
            String sql = "select username from user";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                list.add(rs.getString("username"));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closeResultSet(rs);
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
        }
        return null;
    }

    //添加用户信息到数据库
    public static boolean insertUser(user u) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBGet.getConnection();
            String sql = "insert into user (username,password) values(?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            if (!u.getPassword().equals(""))
                ps.setString(2, u.getPassword());
            else ps.setString(2, "123456");
            int num = ps.executeUpdate();
            if (num > 0)
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
        }
        return false;
    }

    //检查用户是否已投票
    public static boolean checkVote(String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBGet.getConnection();
            String sql = "SELECT votingstatus FROM USER WHERE username=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            rs.next();
            if (rs.getString("votingstatus").equals("1"))
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
            DBGet.closeResultSet(rs);
        }
        return false;
    }

    //计票,调用此方法为用户选择投票的图片计票
    public static boolean count(String imgName) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBGet.getConnection();
            String sql = "update voteinfo set voteNum=voteNum+1 where optName=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, imgName);
            int num = ps.executeUpdate();
            if (num > 0)
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
        }
        return false;
    }

    //投票成功后改变用户的投票状态
    public static boolean alterVoteStatus(String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBGet.getConnection();
            String sql = "UPDATE USER SET votingstatus=? WHERE username=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "1");
            ps.setString(2, username);
            int num = ps.executeUpdate();
            if (num > 0)
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
        }
        return false;
    }

    public static boolean insertImage(String imgName) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBGet.getConnection();
            String sql = "insert into voteinfo (imgName,imgPath,optName,voteNum) values(?,?,?,0)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, imgName);
            ps.setString(2, "image/" + imgName);
            ps.setString(3, imgName);
            int num = ps.executeUpdate();
            if (num > 0)
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
        }
        return false;
    }
}
