<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/27
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="matches" class="org.haut.entity.Matches" scope="application"/>
<%
    String eventid = request.getParameter("eId");
    matches.selectMatchesByEId(Integer.valueOf(eventid));
    System.out.println(matches);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>项目信息详情</title>
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
                我的信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/Meeting/eventList.jsp"> 比赛项目信息</a></li>
                <li class="active">项目信息详情</li>
            </ol>
        </section>

        <section class="content">
            <div class="box-body" id="display" style="display: none">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-event" data-toggle="tab">项目信息详情</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-event">
                            <div class="row data-type">
                                <div class="col-sm-2 title">届时</div>
                                <div class="col-sm-10 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.ESportmeetingid}届">
                                </div>

                                <div class="col-sm-2 title">项目名称</div>
                                <div class="col-sm-10 data text">
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
                                           value="${matches.event.EGender==true?"男":"女"}">
                                </div>

                                <div class="col-sm-2 title">项目举办日期</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EDateStr}">
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

                                <div class="col-sm-2 title">项目裁判</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EJudgementid}">
                                </div>

                                <div class="col-sm-2 title rowHeight2x">项目规则</div>
                                <div class="col-sm-10 data text rowHeight2x">
                                        <textarea rows="3"
                                                  style="resize:none;background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                                  class="form-control">${matches.event.ERules}</textarea>
                                </div>

                            </div>
                        </div>

                    </div>

                    <br>
                </div>

                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-broadcast" data-toggle="tab">项目参赛名单</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-broadcast">
                            <!--数据列表-->
                            <table
                                    id="dataList"
                                    class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">参赛人学号</th>
                                    <th class="text-center">参赛人姓名</th>
                                    <th class="text-center">参赛项目</th>
                                    <th class="text-center">分道信息</th>
                                    <th class="text-center">成绩</th>
                                    <th class="text-center">排名</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${matches.matchesList}" var="match" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.index+1}</td>
                                        <td class="text-center">${match.user.student.SNo }</td>
                                        <td class="text-center">${match.user.student.SName }</td>
                                        <td class="text-center">${matches.event.EName}</td>
                                        <td class="text-center">${match.MSort==null ? "暂未分道":matches.MSort }</td>
                                        <td class="text-center">${match.MScore==null ? "未录入":matches.MScore }${matches.MScore==null ? "":matches.event.EUnit}</td>
                                        <td class="text-center">${match.MRank == null ? "未排名":matches.MRank}</td>
                                        <td class="text-center">
                                            <button type="button"
                                                    class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/Detail/GradeDetail.jsp?mId=${match.MId}'">
                                                详情
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
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
    $('#dataList').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "language": {
            "sLoadingRecords": "正在加载...",
            "sProcessing": "正在获取数据，请稍候...",
            "sInfo": "当前显示第 _START_ 到第 _END_ 条，共 _TOTAL_ 条",
            "sInfoFiltered": "(从_MAX_条筛选 )",
            "sInfoEmpty": "共筛选到0条",
            "sSearch": "搜索:",
            "sLengthMenu": "每页显示 _MENU_ 条",
            "sZeroRecords": "无相关记录",
            "paginate": {
                "sFirst": "首页",  //首页和尾页必须在pagingType设为full_numbers时才可以
                "sLast": "尾页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "first": "First page",
                "last": "Last page",
                "next": "Next page",
                "previous": "Previous page"
            }
        }
    });

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
        setSidebarActive("event-list");


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
