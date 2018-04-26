<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./CSS/myStyle.css">
    <title>登录</title>
    <style type="text/css">
        #div {
            margin-top: -13px;
            margin-bottom: -20px;
            border: 1 px solid  #00F;
        }
    </style>
</head>
<body style="text-align: center" bgcolor="#faebd7">
<%
    java.util.List<String> allName = (java.util.List<String>) session.getAttribute("allName");
%>
<form action="login" method="post">
    <div id="div" align="center">
        <table border="0" width=100% height=100%>
            <tr>
                <td>
                    <table border="0" width="1080" height="950" align="center" background="/background/bj3.jpg" bgcolor="#2CA2E8">
                        <tr align="center" height="100">
                            <td>
                                <h2><font face="华文彩云" size="10">计算机学院分工会“随手拍”投票系统</font></h2>
                            </td>
                        </tr>
                        <tr height="200">
                            <td>
                                <table border="0" width="230" align="center">
                                    <tr>
                                        <td valign="middle" class="myfont-style">用&nbsp;户&nbsp;名&nbsp;</td>
                                        <td colspan="2">
                                            <select name="username" class="txtCon1">
                                                <option>请选择</option>
                                                <%
                                                    for(String name: allName) {
                                                %>
                                                <option value="<%=name%>"><%=name%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            <%--<input type="text" name="username" class="txtCon">--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td valign="middle" class="myfont-style">
                                            密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;
                                        </td>
                                        <td colspan="2"><input type="password" name="password" class="txtCon"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center" valign="middle"><font size="2"
                                                                                             color="red">${requestScope.tip}</font><br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center" valign="middle" class="myfont-style">
                                            <input type="submit" value="   登  录   " class="buttonFont-style"/>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="reset" value="   重  置   " class="buttonFont-style"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr height="200">
                            <td align="center">
                                <table>
                                    <tr>
                                        <td>温馨提示：</td>
                                    </tr>
                                    <tr>
                                        <td>1、首次登陆用户名是您的姓名，初始密码是 "123"</td>
                                    </tr>
                                    <tr>
                                        <td>2、每个用户可以投 1~3 张票，投完票后不能再次投票</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</form>

<script type="text/javascript">
    function regist() {
        // 获取页面的第一个表单
        targetForm = document.forms[0];
        // 动态修改表单的action属性
        targetForm.action = "redirect";
    }
</script>
</body>
</html>
