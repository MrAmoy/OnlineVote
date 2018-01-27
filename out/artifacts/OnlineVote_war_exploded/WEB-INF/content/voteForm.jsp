<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" errorPage="" %>
<%@ page import="com.bean.image,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>投票页面</title>
    <link rel="stylesheet" type="text/css" href="./CSS/myStyle.css">
</head>
<body style="text-align: center" bgcolor="#faebd7">
<%
    List<String> list = (List<String>) session.getAttribute("list");
%>
<h1>欢&nbsp;迎&nbsp;投&nbsp;票</h1>
欢迎您，&nbsp;<font color="red">${sessionScope.username}</font>&nbsp;老师！请选择&nbsp;1~3&nbsp;张图片投票&nbsp;&nbsp;&nbsp;<a
        href="loginForm.action">[注销]</a>
<form name="voteForm" action="vote" method="post">
    <div id="box" onclick="choicetest('image',3)">
        <table align="center">
            <tr>
                <td colspan="5" width="150" height="50" align="center" valign="middle"><br><input type="button" value="  投   票  "
                                                                                             class="buttonFont-style"
                                                                                             onclick="vote();"/>
                </td>
            </tr>
            <%
                //k值累加用于判断是否超过list的大小
                int k = 0;
                //m表示行数，n表示列数，更改列数修改n的值
                int m, n = 4;
                if (list.size() % n == 0) {
                    m = list.size() / n;
                } else {
                    m = list.size() / n + 1;
                }
                String imgPath, imgName;
                //循环的行数
                for (int i = 0; i < m; i++) {
            %>
            <tr>
                <%
                    //循环的列数，即每行放的图片数
                    for (int j = 0; j < n; j++, k++) {
                        if (k >= list.size())
                            break;
                        imgName = (String) list.get(k);
                        imgPath = "./image/" + (String) list.get(k);
                %>
                <td>
                    <br><br><br>&nbsp;&nbsp;&nbsp;
                    <a href="<%=imgPath%>" target="_blank"><img src="<%=imgPath%>" align="middle" width="330"
                                                                height="240"/></a>
                    &nbsp;&nbsp;&nbsp;<br><br>
                    <input type="checkbox" name="image" id="<%=imgName%>" value="<%=imgName%>"/>
                    <label for="<%=imgName%>"><font size="4"><%=imgName.substring(0, imgName.lastIndexOf("."))%>
                    </font>
                    </label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <%
                    }
                %>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="5" width="150" height="50" align="center" valign="middle"><br><input type="button" value="  投   票  "
                                                                                             class="buttonFont-style"
                                                                                             onclick="vote();"/><br><br>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    //此函数设置每个用户投票数不能超过3票
    function choicetest(name, num) {
        var choicearr = document.getElementsByName(name);
        var a = 0;
        for (var i = 0; i < choicearr.length; i++)
            if (choicearr[i].checked) {
                a = a + 1;
            }
        if (a == num) {
            for (var i = 0; i < choicearr.length; i++)
                if (!choicearr[i].checked)
                    choicearr[i].disabled = 'disabled';
        } else {
            for (var i = 0; i < choicearr.length; i++)
                choicearr[i].removeAttribute('disabled');
        }
    }


    function vote() {
        var arr = document.getElementsByName("image");
        var confirm1 = true;
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].checked) {
                if (confirm("确认投票吗？")) {
                    document.voteForm.submit();
                    return true;
                } else {
                    return true;
                }
            }
        }
        alert("请选择图片！");
        return false;
    }
</script>
</body>
</html>
