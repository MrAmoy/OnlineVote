<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dao.*" %>
<%@ page import="java.sql.*" %>
<%--<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>投票统计结果页面</title>
</head>

<body style="text-align: center" bgcolor="#faebd7">
<h1>
    投票结果排行榜 <br>
</h1>
欢迎您，<font color="red">${sessionScope.username}</font>！您已投票!&nbsp;&nbsp;&nbsp;
<a href="loginForm.action">[注销]</a><br><br>
<%
    String imgPath = null;
    ResultSet rs = null;
    float votePer = 0;
    String sql = "select sum(voteNum) As sum from voteInfo";
    rs = DBGet.look(sql);
    rs.next();
    int voteSum = Integer.parseInt(rs.getString("sum"));
    int voteRes = voteSum;
    int voteNum = 0;
    float voteTotal = voteRes;
    System.out.println(voteTotal);
    sql = "select * from voteInfo order by voteNum DESC";
    rs = DBGet.look(sql);
%>
<table border="0" align="center" height="50">
    <tr>
        <td valign="middle" align="center">&nbsp;&nbsp;&nbsp;&nbsp;作品</td>
        <td valign="middle" align="center">百分比</td>
        <td valign="middle" align="center">得票数(由高到低)</td>
    </tr>
    <%
        for (int i = 1; i <= 5 && rs.next(); i++) {
            imgPath = "/" + rs.getString("imgPath");
            voteNum = Integer.parseInt(rs.getString("voteNum"));
            voteRes = voteRes - voteNum;
            votePer = voteNum / voteTotal * 100;
    %>
    <tr>
        <td align="center" valign="middle"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="<%=imgPath %>" align="middle" width="150" height="150"/><br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%=rs.getString("optName")%>&nbsp;&nbsp;&nbsp;

        </td>
        <%imgPath = "/bar_graph/bar" + i + ".JPG"; %>
        <td align="left" valign="middle">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="<%=imgPath %>" align="middle" width="<%=votePer*15 %>" height="50"/><%=votePer + "%" %>
            &nbsp;&nbsp;&nbsp;
        </td>
        <td align="center" valign="middle">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%=voteNum + " 票" %>
            &nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <%
        }
        votePer = voteRes / voteTotal * 100;
    %>
    <tr>
        <td align="center" valign="middle">
            &nbsp;&nbsp;&nbsp;
            <br><br>其他<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <%imgPath = "/bar_graph/bar6.JPG"; %>
        <td align="left" valign="middle">
            &nbsp;&nbsp;&nbsp;
            <br><img src="<%=imgPath %>" align="middle" width="<%=votePer*15 %>" height="50"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%=votePer + "%" %><br>
            &nbsp;&nbsp;&nbsp;
        </td>
        <td align="center" valign="middle">
            &nbsp;&nbsp;&nbsp;
            <br><%=voteRes + " 票"%>
            &nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        &nbsp;
    </tr>
    <tr>
        <td align="center" valign="middle">
            &nbsp;&nbsp;&nbsp;
            <br><br>总数<br><br>
            &nbsp;&nbsp;&nbsp;
        </td>
        <td align="center" valign="middle">
            &nbsp;&nbsp;&nbsp;
            <br><br>100%<br><br>
            &nbsp;&nbsp;&nbsp;
        </td>
        <td align="center" valign="middle">
            &nbsp;&nbsp;&nbsp;
            <br><br><%=voteSum + " 票" %><br><br>
            &nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        &nbsp;
    </tr>
    <%rs.close(); %>
</table>
</body>
</html>
