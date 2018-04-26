<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="/CSS/myStyle.css">
    <title>注册</title>
  </head>
  <body style="text-align: center" bgcolor="#faebd7">
    <br/><br/><br/><br/><br/><br/><br/>
    <h1>用户注册</h1><br/><br/>
    <form name="registForm" action="regist" method="post">
      <table border="0" bordercolor="red" align="center">
        <tr>
          <td width="190" align="right" valign="middle" class="myfont-style">注册姓名&nbsp;</td>
          <td align="left">
            <input type="text" style="width: 200px;height: 25px" name="username" id="username" onblur="nameBlur();"
                   onfocus="nameFocus()"/>
          </td>
          <td width="100">
                <span id="usernameMsg">
                    <font color="red"></font>
                </span>
          </td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <td width="190" align="right" valign="middle" class="myfont-style">输入密码&nbsp;</td>
          <td align="left"><input type="password" style="width: 200px;height: 25px" name="password1" id="password1"/>
          </td>
          <td width="100">
                <span id="password1Msg">
                    <font color="red"></font>
                </span>
          </td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <td width="190" align="right" valign="middle" class="myfont-style">确认密码&nbsp;</td>
          <td align="left"><input type="password" style="width: 200px;height: 25px" name="password2" id="password2"
                                  onblur="password2Blur();"/></td>
          <td width="100">
                <span id="password2Msg">
                    <font color="red"></font>
                </span>
          </td>
        </tr>
        <tr>
          <td align="center" colspan="3"><font size="2" color="red">${requestScope.tip}</font>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" align="center" valign="middle"><input type="button" value="注册" style="color: crimson"
                                                                onclick="regist();" class="buttonFont-style"/>
            &nbsp;&nbsp;&nbsp;
            <input type="reset" value="重置" class="buttonFont-style">
            &nbsp;&nbsp;&nbsp;
            <input type="submit" value="返回首页" onclick="back();" class="buttonFont-style">
          </td>
        </tr>
      </table>
    </form>
    <script type="text/javascript">
        function regist() {
            if (confirmSubmit()) {
                if (confirm("确认注册吗？")) {
                    document.registForm.submit();
                    return true;
                }
            }
            return false;
        }

        function back() {
            document.forms[0].action = "loginForm.action";
        }

        function nameBlur() {
            if ("" == document.getElementById("username").value) {
                document.getElementById("username").value = "";
                document.getElementById("usernameMsg").innerHTML = "<font size='2' color='red'>用户名不能为空</font>";
            } else if (document.getElementById("username").value.indexOf(" ") >= 0) {
                document.getElementById("usernameMsg").innerHTML = "<font size='2' color='red'>名称不能有空格</font>";
            } else {
                document.getElementById("usernameMsg").innerHTML = "";
            }
        }

        function nameFocus() {
            if ("" == document.getElementById("username").value) {
                document.getElementById("username").value = "";
                //document.getElementById("usernameMsg").innerHTML="<font size='2' color='red'>用户名不能为空</font>";
            }
        }

        function confirmSubmit() {
            if (document.getElementById("username").value.indexOf(" ") >= 0) {
                document.getElementById("usernameMsg").innerHTML = "<font size='2' color='red'>名称不能有空格</font>";
                document.getElementById("password1Msg").innerHTML = "";
                document.getElementById("password2Msg").innerHTML = "";
                document.getElementById("username").focus();
                return false;
            }
            if ("" == document.getElementById("username").value
                || "请输入用户名" == document.getElementById("username").value) {
                document.getElementById("usernameMsg").innerHTML = "<font size='2' color='red'>用户名不能为空</font>";
                document.getElementById("password1Msg").innerHTML = "";
                document.getElementById("password2Msg").innerHTML = "";
                document.getElementById("username").focus();
                return false;
            }
            if ("" == document.getElementById("password1").value) {
                document.getElementById("usernameMsg").innerHTML = "";
                document.getElementById("password1Msg").innerHTML = "<font size='2' color='red'>密码不能为空</font>"
                document.getElementById("password2Msg").innerHTML = "";
                document.getElementById("password1").focus();
                return false;
            }

            if ("" == document.getElementById("password2").value) {
                document.getElementById("usernameMsg").innerHTML = "";
                document.getElementById("password1Msg").innerHTML = "";
                document.getElementById("password2Msg").innerHTML = "<font size='2' color='red'>请验证密码</font>";
                document.getElementById("password2").focus();
                return false;
            }
            if ("" != document.getElementById("password1").value
                && document.getElementById("password2").value != document.getElementById("password1").value) {
                document.getElementById("usernameMsg").innerHTML = "";
                document.getElementById("password1Msg").innerHTML = "";
                document.getElementById("password2Msg").innerHTML = "<font size='2' color='red'>两次密码不匹配</font>";
                document.getElementById("password2").focus();
                return false;
            }
            return true;
        }


        function password2Blur() {
            if ("" == document.getElementById("password2").value) {
                document.getElementById("password1Msg").innerHTML = "<font size='2' color='red'>请输入密码</font>";
            }
            //两次密码不同，就显示不同
            if ("" != document.getElementById("password1").value
                && document.getElementById("password2").value != document.getElementById("password1").value) {
                document.getElementById("password2Msg").innerHTML = "<font size='2' color='red'>两次密码不匹配</font>";
            }
            //两次密码一样，就显示ok
            if ("" != document.getElementById("password1").value
                && document.getElementById("password2").value == document.getElementById("password1").value) {
                document.getElementById("password2Msg").innerHTML = "<font size='2' color='red'>OK</font>";
            }
        }
    </script>
  </body>
</html>
