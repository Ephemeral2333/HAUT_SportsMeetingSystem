<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/16
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="baidu-site-verification" content="Gh1rQnIAsj" />
    <title>河南工业大学秋季运动会</title>
    <meta name="keywords" content="河南工业大学秋季运动会" />
    <meta name="description" content="河南工业大学秋季运动会官方网站" />
    <link href="css/common.css" rel="stylesheet" type="text/css">
    <link href="css/i_style.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <link rel="icon" type="image/x-icon" href="img/logo.png" />  <!--网站图标-->
    <script src="js/echarts.min.js"></script>
    <script src="js/jquery-1.12.4.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/header.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
    </style>
    <link rel="stylesheet" href="css/box.css">
</head>
<body>
    <jsp:include page="common/header.jsp" flush="true"/>

    <%--创建轮播图--%>
    <div class="wrapper">
        <div class="mainpart">
            <div class="slide-box">
                <div class="banner-box"></div>
                <button class="slide-left-btn material-icons">arrow_back_ios</button>
                <button class="slide-right-btn material-icons">arrow_forward_ios</button>
                <div class="pagination-box"></div>
            </div>
        </div>
    </div>

    <jsp:include page="common/footer.jsp" flush="true"/>

<script src="js/box.js"></script>
</body>
</html>
