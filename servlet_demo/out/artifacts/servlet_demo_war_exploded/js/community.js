/**
 * 提交评论
 */
function post() {
    var questionId = $("#question_id").val();
    var content = $("#comment_content").val();
    comment2Target(questionId,1,content);
}

function comment2Target(targetId,type,content) {
    if (!content){
        alert("评论内容不能为空~~");
        return;
    }
    console.log(content);
    $.ajax({
        type:"POST",
        url:"/comment",
        contentType:"application/json",
        data:JSON.stringify({
            "parentId":targetId,
            "content":content,
            "type":type
        }),
        success: function (result) {
            if (result.code == 200){
                //回复成功后隐藏回复区
                //$("#comment-section").hide();
                window.location.reload();
            }else if (result.code == 2003){
                var isAccepted = confirm(result.message);
                if (isAccepted){
                    //调用登录接口
                    window.open("https://github.com/login/oauth/authorize?client_id=bf3d17985bef070371ce&redirect_uri=http://localhost:8088/callback&scope=user&state=1");
                    //本地存储closable
                    window.localStorage.setItem("closable",true);
                }
            } else {

            }
            console.log(result);
        },
        dataType:"json"
    });
}
function test() {
    console.log("success");
}
function comment(e) {
    var commentId = e.getAttribute("data-id");
    var content = $("#input-"+commentId).val();
    comment2Target(commentId,2,content);
}

/**
 * 展开二级评论
 */
function collapseComments(e) {
    //console.log(e);
    var id = e.getAttribute("data-id");
    console.log(id);

    var comments = $("#comment-"+id);

    //获取二级评论的展开状态
    var collapse = e.getAttribute("data-collapse");
    if (collapse){
        //折叠二级评论
        comments.removeClass("in");
        e.removeAttribute("data-collapse");
        e.classList.remove("active");
    } else {

        //
        $.getJSON("/comment/"+id,function (data) {
            var div = document.getElementById("test"+id);
            while(div.hasChildNodes()) //当div下还存在子节点时 循环继续
            {
                div.removeChild(div.firstChild);
            }
          for (var i = 0;i<data.data.length;i++) {
             // var user= data.data[0]['user']
              var time = data.data[0];
              console.log(time['gmtCreate'])
             var user= data.data[i]['user']['name']

              var datetemp = data.data[i]['gmtCreate'];
              var date = new Date(datetemp);
              var year = date.getFullYear()+'年';
              var month = date.getMonth()+1+'月';
              var day = date.getDate()+'日';
              var hour =  date.getHours()+"时";
              var sec = date.getSeconds()+"分"
              // console.log(st['name'])
              $("#test"+id).append("<p>"+data.data[i].content+"</p>")
              .append("<div class=\"media-body\">" +
                  "<span class=\"minus-sign\"> — </span>" +
                  "<a href=\"#\">" +
                  "<strong class=\"comment-name\">"+user+"</strong>" +
                  "</a>" +
                  "<span class='time'>("+year+month+day+hour+sec+")</span>"+
                  " <hr class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">" +
                  "</div>"
              )
            }
        });

        //展开二级评论
        comments.addClass("in");
        //标记二级评论展开状态
        e.setAttribute("data-collapse","in");
        e.classList.add("active");
    }

}
function selectTag(e) {
    var value = e.getAttribute("data-tag");
    var previous = $("#tag").val();
    if (previous.indexOf(value)==-1){
        if (previous) {
            $("#tag").val(previous+','+value);
        }else {
            $("#tag").val(value);
        }
    }
}

function showSelectTag() {
    $("#select-tag").show();
}

function editName(e){
    var name = $("#user-name").text();

    var value = e.getAttribute("data-name");

    if (value == "name") {
        $("#userName").val(name);
    }
    if (value == "address") {
        $("#userAddress").val(name);
    }
    if (value == "email") {
        $("#userEmail").val(name);
    }
    if (value == "telephone") {
        $("#userTelephone").val(name);
    }
    if (value == "github") {
        $("#userGithub").val(name);
    }
    if (value == "certification") {
        $("#userCertification").val(name);
    }
}