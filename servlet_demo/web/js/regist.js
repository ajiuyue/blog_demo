//定义一个全局变量
var flag = false;
//定义checkInput
function checkInput(obj){
    //获取输入框的值，可以取到手机号，也可以取到密码，也可以取到确认密码
    // obj.id可以取到userName  userPwd   rePwd
    var inputValue = $("#"+obj.id).val();
    //分别对手机号、密码、确认密码作数据校验
    if(obj.id=="username"){
        //正则表达式：正则表达式通常被用来检索、替换那些符合某个模式(规则)的文本
        //规则：手机号规则    都是数字   以1开头  第二位：3 4 5 6 7 8  后边九位：数字
        //原子操作    [a]:匹配小写字母a   [abc]:匹配小写字母a或者b或者c   [a-z]:匹配所有小写字母
        // [A-Za-z]:匹配所有字母  [0-9]:匹配所有数字    \d:匹配所有数字
        // \w:匹配大小写字母、数字以及下划线  等价于 [a-zA-Z0-9_]
        // 数量：{m}:前面的字符m个    {m,n}:前面的字符m个到n个
        //  {m,}:前面的字符最少m个    ^：以什么什么开头     $:以什么什么结尾
        //书写手机号正则表达式
        var re = /^[1][3-8]\d{9}$/;
        //验证inputValue是否满足正则表达式
        var result = re.test(inputValue);
        if(result){
            $("#tip_"+obj.id).html("＜（＾－＾）＞");
            $("#tip_"+obj.id).css("color","green");
            flag = true;
        }else{
            $("#tip_"+obj.id).html("(；′⌒`)");
            $("#tip_"+obj.id).css("color","red");
            flag = false;
        }
    }else if(obj.id=="password"){
        if(inputValue.length>=4 && inputValue.length<=8){
            $("#tip_"+obj.id).html("密码设置成功");
            $("#tip_"+obj.id).css("color","green");
            flag = true;
        }else{
            $("#tip_"+obj.id).html("密码设置失败");
            $("#tip_"+obj.id).css("color","red");
            flag = false;
        }

    }else if(obj.id=="rePassword"){
        //获取密码输入框的值
        var password = $("#password").val();
        //java中：==比较地址     equals：比较值
        if(password==inputValue && password!=""){
            $("#tip_"+obj.id).html("密码设置一致");
            $("#tip_"+obj.id).css("color","green");
            flag = true;
        }else{
            $("#tip_"+obj.id).html("密码前后不一致");
            $("#tip_"+obj.id).css("color","red");
            flag = false;
        }
    }else{
        //验证昵称、年龄   不能为空
        if(inputValue!=""){
            $("#tip_"+obj.id).html(obj.id+"设置成功");
            $("#tip_"+obj.id).css("color","green");
            flag = true;
        }else{
            $("#tip_"+obj.id).html(obj.id+"设置失败");
            $("#tip_"+obj.id).css("color","red");
            flag = false;
        }
    }
}
//提交注册
function post() {
    //判断是否为空
    if($("#username").val()=="" || $("#password").val()=="" || $("#rePassword").val()=="" || $("#age").val()=="" || $("#nickname").val()==""){
        alert("表单数据不满足要求");
        return;
    }
    if(flag){
        //提交表单
        $("#form").submit();
    }else{
        alert("表单数据不满足要求");
    }
}