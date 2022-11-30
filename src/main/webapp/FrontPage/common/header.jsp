<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/16
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .headeron{
        margin-left:20px;
    }

    .logo .logoimg {
        position: absolute;
        top: 15px;
        left:0;
    }
    .headeron a{
        padding:0;
        color:#A2A2A2
    }
    .headeron a:visited{
        color:#A2A2A2;
    }
    .left_alter_left{
        padding-top:20px;
        height:80px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content:center;

    }
    .logo p.el {
        font-size: 12px;
        color: #408ed6;
        padding-bottom: 0;
    }
    .logo p {
        color: #1e6eb9;
        font-size: 28px;
        height: 40px;
        padding-left: 88px;
    }
    .headersearch .headerinput{
        display: flex;
        height:100px;
        align-items: center;
        margin:0;
    }
</style>
<div class="top">
    <div class="header">
        <div class="headersearch clearfix">
            <div class="logo left">
                <img class="logoimg" src="./img/logo.png" width="75px" height="75px" alt="">
                <div class="left_alter_left">
                    <p style="font-family: 华文行楷,serif">河南工业大学运动会</p>
                    <p class="el">Henan University of Technology SportsMeeting</p>
                </div>
            </div>
            <form action="">
                <div class="headerinput right">
                    &ensp;&ensp;&ensp;
                    <span class="headeron">
            <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
            <a href="${pageContext.request.contextPath}/login.jsp">登录|</a>
            <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
          </span>
                </div>
            </form>
        </div>
    </div>
    <div class="top-nav">
        <div class="nav">
            <ul class="clearfix">
                <li class="firstli"><a class="nul" href="/">首页</a></li>
                <li class="firstli">
                    <a class="nul" href="">赛事管理</a>
                    <ul class="sub-ul" style="display:none">
                        <li> <a href="">赛事查询</a> </li>
                        <li> <a href="">赛事信息</a> </li>
                        <li> <a href="">成绩查询</a> </li>
                    </ul>
                </li>
                <li class="firstli"><a class="nul" href="">业务百科</a>
                    <ul class="sub-ul" style="display:none">
                        <li> <a href="">竞赛规则</a> </li>
                        <li> <a href="">视频大讲堂</a> </li>
                    </ul>
                </li>
                <li class="firstli"><a class="nul" href="">裁判员管理</a>
                    <ul class="sub-ul" style="display:none">
                        <li> <a href="">注册/查询</a> </li>
                        <li> <a href="">裁判资讯</a> </li>
                    </ul>
                </li>
                <li class="firstli"><a class="nul" href="">志愿管理</a>
                    <ul class="sub-ul" style="display:none">
                        <li> <a href="">注册/查询</a> </li>
                        <li> <a href="">志愿风采</a> </li>
                    </ul>
                </li>
                <li class="firstli"><a class="nul" href="">友情链接</a>
                    <ul class="sub-ul" style="display:none">
                        <li> <a href="https://www.haut.edu.cn/">学校官网</a> </li>
                        <li> <a href="https://hqjt.haut.edu.cn/">学校后勤</a> </li>
                        <li> <a href="https://aidata.haut.edu.cn/">人工智能与大数据学院</a> </li>
                        <li> <a href="https://jwc.haut.edu.cn/">教务处</a> </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>