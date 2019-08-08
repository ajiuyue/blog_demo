<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>编写博客</title>
    <meta charset="UTF-8" content="text/html">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/community.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" href="css/editormd.min.css">
    <script src="js/bootstrap.js" type="application/javascript"></script>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/community.js"></script>
    <script src="js/editormd.min.js"></script>
</head>
<body>
    <!--header-->
    <%@ include file="header.jsp"%>
    <!--header end-->
<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <h3><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>发布</h3>
            <hr>
            <form action="/publish" method="post">
                <input type="hidden"  name="id">
                <div class="form-group">
                    <label for="title">博客标题 (简单扼要)：</label>
                    <input type="text" class="form-control"  id="title"
                           name="title" placeholder="博客标题..." autocomplete="off">
                </div>
                <!--editor-->
                <div class="form-group" id="blog-editor">
                    <label for="content">主要内容 (请参考右侧提示)：</label>
                    <textarea  style="display:none;" class="form-control" rows="3" id="content" name="content"></textarea>
                </div>

                <script type="text/javascript">
                    $(function() {
                        var editor = editormd("blog-editor", {
                            width  : "100%",
                            height : "350",
                            path   : "/js/lib/",
                            delay  : 0,
                            watch  : false,
                            placeholder : "欢迎使用Markdown编辑器...",
                            imageUpload    : true,
                            imageFormats   : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                            imageUploadURL : "/file/upload"
                        });
                    });
                </script>
                <!--editor-->
                <div class="form-group">
                    <label for="tag">添加标签：</label>
                    <input type="text" class="form-control" id="tag"
                           name="tag" placeholder="请输入标签，以逗号分隔" autocomplete="off">
                </div>
                <button type="submit" class="btn btn-success btn-publish">发布</button>
            </form>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
            <h3>博客发布指南</h3>
            * 使用Markdown语法 <br>
            * 选择标签使用英文逗号分隔 <br>
        </div>
    </div>
</div>
<!--footer-->
<%@ include file="footer.jsp"%>
<!--footer end-->
</body>
</html>