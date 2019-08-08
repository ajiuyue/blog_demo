<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" itemscope itemtype="https://schema.org/WebPage">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Index</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/css/main.css">
  <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
  <script src="js/bt-index.js" type="application/javascript"></script>
</head>

<body class="body-home">
  <!--header-->
    <%@ include file="header.jsp"%>
  <!--header end-->
<div class="home">
  <div class="landing-section hero">
    <div class="container">
      <p>全部文章>2019-08</p>
    </div>
  </div>
  <div class="landing-section users">
    <div class="container">
      <!--begin-->
      <div class="row">
        <div class="col-sm-8 blog-main">
          <div class="blog-post">
            <c:forEach items="${paginationDTOList.data}" var="content">
              <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>
              <h3 class="blog-post-meta"><a href="/article?articleId=${content.id}">${content.title}</a></h3>
              <p>${content.content}</p>
              <hr>
            </c:forEach>
          </div><!-- /.blog-post -->
        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4>关于</h4>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
          </div>
          <div class="sidebar-module">
            <h4>归纳</h4>
            <ol class="list-unstyled">
              <c:forEach items="${archiveDTOList}" var="archiveDTO">
                <li><a href="/archive?year=${archiveDTO.year}&month=${archiveDTO.month}">${archiveDTO.year}年${archiveDTO.month}月</a></li>
              </c:forEach>
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->
      <!--end-->
    </div>
  </div>
</div>
  <!--footer-->
  <%@ include file="footer.jsp"%>
  <!--footer end-->
</body>
</html>

