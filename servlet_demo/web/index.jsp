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
            <c:forEach items="${paginationDTOList.data}" var="content" varStatus="dataStatus">
              <%--<p class="blog-post-meta">发布于  <fmt:formatDate value="${content.gmtCreate}" pattern="yyyy-MM-dd"/>  by  <a href="#"> 雨女无瓜</a><span style="font-size: 12px">  阅读数 998</span></p>--%>
              <%--<h3 class="blog-post-meta"><a href="/article?articleId=${content.id}">${content.title}</a></h3>--%>
              <%--<p>${content.content}</p>--%>
              <%--<hr>--%>
              <div class="media">
                <div class="media-left">
                  <a href="#">
                    <img class="media-object" width="200px" height="120px" src="images/pic${dataStatus.count}.jpg" alt="...">
                  </a>
                </div>
                <div class="media-body">
                  <h3 class="media-heading"><a href="/article?articleId=${content.id}">${content.title}</a></h3>
                  ${content.content}
                </div>
                <div class="media-auth">
                  <span class="auth-span"><i class="glyphicon glyphicon-user"></i><a href="#">九月</a></span>
                  <span class="auth-span"><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${content.gmtCreate}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                  <span class="auth-span"><i class="glyphicon glyphicon-eye-open"></i>85011浏览</span>
                  <span class="auth-span"><i class="glyphicon glyphicon-comment"></i><a href="#">1评论</a></span>
                  <span><i class="glyphicon glyphicon-heart-empty"></i><a href="#">114喜欢</a></span>
                </div>
              </div>
            </c:forEach>
          </div><!-- /.blog-post -->

          <!--分页-->
          <nav aria-label="Page navigation" class="page-position">
            <ul class="pagination">
              <c:if test="${paginationDTOList.showFirstPage}">
                <li>
                  <a href="/index" aria-label="Previous">
                    <span aria-hidden="true">&lt;&lt;</span>
                  </a>
                </li>
              </c:if>

              <c:if test="${paginationDTOList.showPrevious}">
                <li>
                  <a href="/index?page=${paginationDTOList.page -1}" aria-label="Previous">
                    <span aria-hidden="true">&lt;</span>
                  </a>
                </li>
              </c:if>

              <c:forEach items="${paginationDTOList.pages}" var="page">
                <c:choose>
                  <c:when test="${paginationDTOList.page eq page}">
                      <li class="active">
                        <a href="/index?page=${page}">${page}</a>
                      </li>
                  </c:when>
                  <c:otherwise>
                      <li>
                        <a href="/index?page=${page}">${page}</a>
                      </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${paginationDTOList.showNext}">
                <li>
                  <a href="/index?page=${paginationDTOList.page +1}" aria-label="Previous">
                    <span aria-hidden="true">&gt;</span>
                  </a>
                </li>
              </c:if>

              <c:if test="${paginationDTOList.showEndPage}">
                <li>
                  <a href="/index?page=${paginationDTOList.totalPage}" aria-label="Previous">
                    <span aria-hidden="true">&gt;&gt;</span>
                  </a>
                </li>
              </c:if>
            </ul>
          </nav>
          <!--分页-->

        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar" style="background-color: white">
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

