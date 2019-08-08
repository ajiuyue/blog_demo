<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" itemscope itemtype="https://schema.org/WebPage">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>September | 雨女无瓜的个人博客</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/css/main.css">
  <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
</head>

<body class="body-home" style="margin: 0 auto">
<div class="home">
  <div class="landing-section hero">
    <div class="container" style="width: 320px">
      <form class="form-signin" action="/login" method="post">
        <h2 class="form-signin-heading">请登录</h2>
        <label for="inputEmail" class="sr-only">用户名或邮箱</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="用户名或邮箱" required="" autofocus="">
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required="">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我的登录信息
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>
    </div>
  </div>
</div>

</body>
</html>

