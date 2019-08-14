function like(e) {
    var id = e.getAttribute("id");
    $.ajax({
        type:"GET",
        url:"/like",
        data:{
            id:id
        },
        success:function (res) {
            alert(res);
            $("#like_"+id).text(parseInt($("#like_"+id).text())+1);
        }
    });
}