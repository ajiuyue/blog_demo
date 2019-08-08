<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>技术杂谈</title>
    <script src="/js/bootstrap.js" type="application/javascript"></script>
</head>
<body>
<nav id="common-nav" class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index">
                <img class="navbar-logo" src="images/user-logos/bazel-navbar.svg">
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/publish">
                        <span class="hidden-sm">写博客</span>
                        <span class="nav-icon visible-sm"><i class="fa fa-github"></i></span>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.user_info == null}">
                        <li>
                            <a href="login.jsp">
                                <span class="hidden-sm">登录</span>
                                <span class="nav-icon visible-sm"><i class="fa fa-github"></i></span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">
                                <span>${sessionScope.user_info.nickname}</span>
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/index">我的博客</a></li>
                                <li><a href="exchange.jsp">个人设置</a></li>
                                <li><a href="/logout">退出登录</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <form class="navbar-form navbar-right" action="/search.html" id="cse-search-box">
                <div class="form-group">
                    <input type="search" name="q" id="q" class="form-control input-sm" placeholder="Search">
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">技术杂谈</a>
                </li>
                <li>
                    <a href="exchange.jsp">技术交流</a>
                </li>
                <li>
                    <a href="http://47.102.141.55/page/about/preview">
                        <span class="hidden-sm">关于</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
