<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/27
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="matches" class="org.haut.entity.Matches" scope="application" />
<%
    String mId = request.getParameter("mId");
    matches.selectMatchesBymId(Integer.valueOf(mId));
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>赛事成绩信息</title>
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body class="hold-transition skin-blue-light sidebar-mini">
<div class="wrapper">
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/aside.jsp" />

    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                成绩详细信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/Meeting/gradeList.jsp"> 运动会成绩表</a></li>
                <li class="active">运动会成绩信息详情</li>
            </ol>
        </section>

        <section class="content">
            <div class="box-body" id="display" style="display: none">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-score" data-toggle="tab">成绩</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-score">
                            <div class="row data-type">

                                <div class="col-sm-2 title">赛事成绩</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.MScore == null ?"成绩暂未录入":matches.MScore}${matches.MScore == null ?"":matches.event.EUnit}">
                                </div>

                                <div class="col-sm-2 title">排名</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.MRank == null ? "未进行排名":matches.MRank}">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-mNo" data-toggle="tab">参赛人信息</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">
                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-mNo">
                            <div class="row data-type">

                                <div class="col-sm-2 title">学号</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.SNo}">
                                </div>

                                <div class="col-sm-2 title">姓名</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.SName}">
                                </div>

                                <div class="col-sm-2 title">性别</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.SGenderStr}">
                                </div>

                                <div class="col-sm-2 title">班别</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.classes.CName}">
                                </div>

                                <div class="col-sm-2 title">学院</div>
                                <div class="col-sm-10 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.classes.department.DName}">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-event" data-toggle="tab">参赛项目信息</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">
                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-event">
                            <div class="row data-type">

                                <div class="col-sm-2 title">参赛届时</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.ESportmeetingid}">
                                </div>

                                <div class="col-sm-2 title">项目名称</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EName}">
                                </div>

                                <div class="col-sm-2 title">项目举办地点</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EPlace}">
                                </div>

                                <div class="col-sm-2 title">项目性别限制</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EGender==true? "男":"女"}">
                                </div>

                                <div class="col-sm-2 title">项目比赛时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EDateStr}">
                                </div>

                                <div class="col-sm-2 title">项目裁判代号</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EJudgementid}">
                                </div>

                                <div class="col-sm-2 title">报名开始时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EStarttimeStr}">
                                </div>

                                <div class="col-sm-2 title">报名结束时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EEndtimeStr}">
                                </div>

                                <div class="col-sm-2 title rowHeight2x">项目规则</div>
                                <div class="col-sm-10 data text rowHeight2x">
                                    <textarea rows="3"
                                              style="resize:none; background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                              class="form-control ">${matches.event.ERules}</textarea>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </section>
    </div>
</div>
</body>
<script src="../plugins/jQuery/jquery-3.6.1.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script>

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function () {

        // 激活导航位置
        setSidebarActive("matches-list");


        document.getElementById("display").removeAttribute("style");
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


</script>
</html>
