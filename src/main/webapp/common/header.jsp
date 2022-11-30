<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/12
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String name = (String) session.getAttribute("name");
%>
<header class="main-header">
    <a href="" class="logo">
        <span class="logo-mini"><b>运动会</b></span> <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>运动会</b>管理系统</span>
    </a>
    <nav class="navbar navbar-static-top">
        <img src="../assets/img/haut.png" alt="haut-logo" class="haut-logo" height="50px" width="180px">
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <%--用户抬头--%>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../assets/img/img.png" class="user-image" alt="User Image">
                        <span class="hidden-xs">
							<%=name%>
                        </span>
                    </a>
                    <%--下拉框--%>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li style="background-color: whitesmoke" class="user-header"><img
                                src="../assets/img/img.png"
                                class="img-circle" alt="User Image">
                            <div style="text-align: center">
                                <%--User Name--%>
                                <a href="">
                                    <%=name%>
                                </a>
                            </div>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="" class="btn btn-primary">修改密码</a>
                            </div>
                            <div class="pull-right">
                                <a href="${pageContext.request.contextPath}/login.jsp"
                                   class="btn btn-warning">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
