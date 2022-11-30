<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/21
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/login.css">
    <title>忘记密码</title>
</head>
<body>
<canvas id="canvas"></canvas>
<div class="box">
    <form action="register">
        <h4>找回密码</h4>
        <div class="acc">
            <label>
                <input type="text" name="uid" placeholder="请输入用户ID">
            </label>
            <label>
                <input type="text" name="code" id="code" placeholder="请输入验证码">
            </label>
            <label>
                <input type="password" name="pwd" placeholder="请输入密码">
            </label>
            <label>
                <input type="password" name="pwd2" placeholder="请输入确认密码">
            </label>
        </div>
        <button type="button" id="btnGetVcode" class="btn fff" style="cursor:pointer">点击发送验证码</button>
        <div class="register">
            <input type="button" value="更改密码" class="fff" id="submit">
        </div>
        <div class="reg">
            <p>已有账号？
                <a href="login.jsp" class="ccc">立即登录</a>
            </p>
        </div>
    </form>
</div>
<script src='plugins/jQuery/jquery.particleground.min.js'></script>
<script src="plugins/jQuery/jquery-3.6.1.min.js" type="text/javascript"></script>
<script src="assets/js/particleground.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
        $("#submit").click(function() {
            var pwd = $("input[name='pwd']").val();
            var pwd2 = $("input[name='pwd2']").val();
            if (pwd != pwd2) {
                alert("两次密码不一致");
            } else {
                $.ajax({
                    url: 'forgot',
                    type: 'post',
                    data: {
                        uid: $("input[name='uid']").val(),
                        pwd: $("input[name='pwd']").val(),
                        code: $("input[name='code']").val(),
                        type: "submit"
                    },
                    dataType: 'json',
                    success: function (msg) {
                        if (msg==-1) {
                            alert("验证码错误");
                        } else {
                            alert("更改成功");
                            window.location.href = "login.jsp";
                        }
                    }
                });
            }
        });
        $("#btnGetVcode").click(function () {
            $.ajax({
                url: 'forgot',
                type: 'post',
                data: {
                    uid: $("input[name='uid']").val(),
                    type: "email"
                },
                dataType: 'json',
                success: function (msg) {
                    if (msg == 1) {
                        alert("验证码已发送");
                    } else {
                        alert("验证码发送失败，未找到该用户");
                    }
                }
            });
        });
    });
</script>
</body>
</html>
