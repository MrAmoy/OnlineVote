package com.dao;

import java.sql.*;

public class loginCheck {
    public static boolean Check(String username, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBGet.getConnection();
            String sql = "SELECT * FROM user WHERE username=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getString("password").equals(password)) return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBGet.closeResultSet(rs);
            DBGet.closePreparedStatement(ps);
            DBGet.closeConnection(conn);
        }
        return false;
    }
}
