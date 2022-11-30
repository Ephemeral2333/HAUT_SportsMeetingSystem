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
    <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
    <title>河南工业大学运动会管理系统登录页面</title>
</head>
<body>
<canvas id="canvas"></canvas>
<div class="header">
    <h2>河南工业大学运动会管理系统</h2>
    <p>搏生命之极限，铸青春之辉煌</p>
</div>
<div class="box">
    <form action="login">
        <h4>用户登录中心</h4>
        <div class="acc">
            <label>
                <input type="text" name="uid" placeholder="请输入用户名">
            </label>
            <label>
                <input type="password" name="password" placeholder="请输入密码">
            </label>
        </div>
        <button href="javascript:" class="btn fff">点击验证</button>
        <div class="fn">
            <label for="check"><input id="check" type="checkbox"><span><span></span></span>记住我</label>
            <a href="javascript:" class="ccc">忘记密码</a>
        </div>
        <div class="register">
            <input type="submit" value="登录" class="fff">
        </div>
        <div class="reg">
            <p>还没有账号？
                <a href="register.jsp" class="ccc">立即注册</a>
            </p>
        </div>
    </form>
</div>

<script src="assets/js/particleground.js" type="text/javascript"></script>
</body>
</html>
