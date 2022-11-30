<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/12
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/login.css">
    <title>河南工业大学运动会管理系统注册页面</title>
</head>
<body>
<canvas id="canvas"></canvas>
<div class="box">
    <form action="register">
        <h4>用户注册</h4>
        <div class="acc">
            <label>
                <input type="text" name="uid" placeholder="请输入用户ID">
            </label>
            <label>
                <input type="text" name="uname" placeholder="请输入姓名">
            </label>
            <label>
                <input type="email" name="email" id="email" placeholder="请输入邮箱">
            </label>
            <label>
                <input type="password" name="pwd" placeholder="请输入密码">
            </label>
            <label>
                <input type="password" name="pwd2" placeholder="请输入确认密码">
            </label>
            <label>
                <input type="text" name="vcode" id="vcode" placeholder="请输入验证码">
            </label>
            <select>
                <option value="1">学生</option>
                <option value="5">教师</option>
                <option value="3">裁判</option>
                <option value="4">志愿者</option>
            </select>
        </div>
        <button type="button" id="btnGetVcode" class="btn fff" style="cursor:pointer">点击发送验证码</button>
        <div class="register">
            <input type="button" value="注册" class="fff" id="submit">
        </div>
        <div class="reg">
            <p>已有账号？
                <a href="javascript:" class="ccc">立即登录</a>
            </p>
        </div>
    </form>
</div>
<script src='plugins/jQuery/jquery.particleground.min.js'></script>
<script src="plugins/jQuery/jquery-3.6.1.min.js" type="text/javascript"></script>
<script src="assets/js/particleground.js" type="text/javascript"></script>
<script src="assets/js/VerifyCode.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
        // 获取验证码按钮
        $("#submit").click(function() {
            var pwd = $("input[name='pwd']").val();
            var pwd2 = $("input[name='pwd2']").val();
            if (pwd != pwd2) {
                alert("两次密码不一致");
            } else {
                $.ajax({
                    url: 'register',
                    type: 'post',
                    data: {
                        uid: $("input[name='uid']").val(),
                        uname: $("input[name='uname']").val(),
                        email: $("input[name='email']").val(),
                        pwd: $("input[name='pwd']").val(),
                        pwd2: $("input[name='pwd2']").val(),
                        vcode: $("input[name='vcode']").val(),
                        type: $("select").val()
                    },
                    dataType: 'json',
                    success: function (msg) {
                        if (msg==-1) {
                            alert("验证码错误");
                        } else {
                            alert("注册成功");
                            window.location.href = "login.jsp";
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
