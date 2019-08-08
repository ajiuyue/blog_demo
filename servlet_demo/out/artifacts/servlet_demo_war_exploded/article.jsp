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
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/css/main.css">
  <link rel="stylesheet" type="text/css" href="css/editormd.preview.min.css">
  <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
  <script src="js/editormd.min.js"></script>
  <script src="js/lib/marked.min.js"></script>
  <script src="js/lib/prettify.min.js"></script>
</head>

<body class="body-home">
  <!--header-->
    <%@ include file="header.jsp"%>
  <!--header end-->
<div class="home">
  <div class="landing-section hero">
    <div class="container">
    </div>
  </div>
  <div class="landing-section users">
    <div class="container">
      <!--begin-->
      <div class="row">
        <div class="col-sm-8 blog-main">
          <div class="blog-post">
            <h3 class="top-pos"><span>${content.title}</span></h3>
            <span class="text-span">| 作者  九月  |  发布于 2019-8-2  |  阅读数：998</span>
            <hr class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="blog-view">
                <textarea style="display:none;">${content.content}</textarea>
            </div>
            <script type="text/javascript">
                $(function() {
                    editormd.markdownToHTML("blog-view", {
                    });
                });
            </script>
          </div><!-- /.blog-post -->

          <nav>
            <ul class="pager">
              <li><a href="#">Previous</a></li>
              <li><a href="#">Next</a></li>
            </ul>
          </nav>

        </div><!-- /.blog-main -->

          <!--right-->
          <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
              <!--热门专题-->
              <div class="sidebar-module sidebar-module-inset">
                  <h4>热门专题</h4>
                  <div class="row">
                      <div class="col-sm-12 col-md-12 col-lg-12">
                          <div class="thumbnail">
                              <img src="images/ShiroFeatures.png" height="320px">
                              <div style="background: rgba(0,0,0,0.4);">
                                  <a href="https://blog.csdn.net/qq_37745470/column/info/30284" style="text-decoration: none">
                                      <span style="color:white;display: block;width: 100%">Shiro安全框架学习</span>
                                  </a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!--猜你稀罕-->
              <div class="sidebar-module sidebar-module-inset">
                  <h4>猜你稀罕</h4>
                  <%--<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>--%>
                  <div class="row">
                      <div class="col-sm-12 col-md-12 col-lg-12">
                          <div class="thumbnail">
                              <img src="images/side-geektime.jpeg" height="320px">
                              <div style="background: rgba(0,0,0,0.4);">
                                  <a href="https://blog.csdn.net/qq_37745470/column/info/30284" style="text-decoration: none">
                                      <span style="color:white;display: block;width: 100%">极客时间·专享福利通道</span>
                                  </a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!--标签云-->
              <div class="sidebar-module sidebar-module-inset">
                  <h4>标签云</h4>
                  <%--<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>--%>
                  <div class="row">
                      <div class="col-sm-12 col-md-12 col-lg-12" style="line-height: 26px">
                          <span class="label label-default">Java</span>
                          <span class="label label-primary">Springboot</span>
                          <span class="label label-success">Python</span>
                          <span class="label label-success">SSM</span>
                          <span class="label label-default">TensorFlow</span>
                          <span class="label label-info">JavaScript</span>
                          <span class="label label-warning">Vue</span>
                          <span class="label label-danger">HTML</span>
                          <span class="label label-primary">CSS</span>
                          <span class="label label-success">Mybatis</span>
                          <span class="label label-default">Hibernate</span>
                          <span class="label label-danger">SSH</span>
                          <span class="label label-danger">Bootstrap</span>
                          <span class="label label-primary">机器学习</span>
                          <span class="label label-danger">SEO</span>
                          <span class="label label-primary">Shiro</span>
                      </div>
                  </div>
              </div>
              <!--归纳-->
              <div class="sidebar-module">
                  <h4>归纳</h4>
                  <ol class="list-unstyled">
                      <c:forEach items="${archiveDTOList}" var="archiveDTO">
                          <li><a href="/archive?year=${archiveDTO.year}&month=${archiveDTO.month}">${archiveDTO.year}年${archiveDTO.month}月<span style="float: right">${archiveDTO.count}  篇</span></a></li>
                      </c:forEach>
                  </ol>
              </div>
          </div><!-- /.blog-sidebar -->
          <!--right-->

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

