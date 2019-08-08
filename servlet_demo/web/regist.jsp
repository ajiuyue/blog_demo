<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>注册</title>
    <!--引入jquery-->
    <script src="js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/regist.js" type="application/javascript" charset="UTF-8"></script>
</head>
<body>
<!-- 请求方式为post时，中文可能会乱码 -->
<form id="form" action="/RegistServlet" method="post">
    <div style="margin-top:80px;">
        <table width="450" height="500" align="center" style="border:1px darkslategray solid"
               cellspacing="0" >
            <!-- jsp页面使用el表达式来获取后台传递的值 -->
            <caption>${msg}</caption>
            <tr height="80" bgcolor="darkslategray">
                <td colspan="2" align="center">
                    <label style="color:white; font-size: 30px; font-family: 黑体;">九月个人博客</label>
                    <label style="color:white; font-size: 20px; font-family: 黑体;">欢迎注册</label>
                </td>
            </tr>
            <tr>
                <td width="120" align="right">
                    <label>账号&nbsp;&nbsp;</label>
                </td>
                <td>
                    <!--placeholder：输入框给出的提示
                        onblur:失去焦点时会触发的方法
                        onfocus:聚集焦点时会触发的方法
                    -->
                    <input id="username" type="text" name="username" onblur="checkInput(this)"
                           placeholder="手机号注册" class="inputStyle"/>
                    <span id="tip_username" style="font-size:12px"></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label>密码&nbsp;&nbsp;</label>
                </td>
                <td>
                    <input id="password" type="password" onblur="checkInput(this)"
                           placeholder="密码长度必须在4位到8位" name="password" class="inputStyle"/>
                    <span id="tip_password" style="font-size:12px"></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label>确认密码&nbsp;&nbsp;</label>
                </td>
                <td>
                    <input id="rePassword"  type="password" onblur="checkInput(this)"
                           name="rePassword" class="inputStyle"/>
                    <span id="tip_rePassword" style="font-size:12px"></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label>昵称&nbsp;&nbsp;</label>
                </td>
                <td>
                    <input id="nickname" type="text" name="nickname" onblur="checkInput(this)"
                           class="inputStyle"/>
                    <span id="tip_nickname" style="font-size:12px"></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label>年龄&nbsp;&nbsp;</label>
                </td>
                <td>
                    <input id="age" type="text" name="age" onblur="checkInput(this)"
                           class="inputStyle"/>
                    <span id="tip_age" style="font-size:12px"></span>
                </td>
            </tr>
            <tr height="60">
                <TD></TD>
                <td>
                    <!--submit:不管js校验，点击直接跳转
                        所以开发中表单提交一般使用button按钮，校验之后，在js中手动提交
                    -->
                    <input onclick="post()" id="submit_form" type="button" value="提交注册" style="border:none;background: darkslategray; color: white; width: 200px; height: 35px;" />
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
