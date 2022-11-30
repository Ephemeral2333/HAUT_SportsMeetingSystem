<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/28
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="student" class="org.haut.entity.Student" scope="application" />
<jsp:useBean id="matches" class="org.haut.entity.Matches" scope="application" />
<%
    Integer id = Integer.parseInt(request.getParameter("sId"));
    student.selectBySId(id);
    matches.selectMatches(student.getSNo());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生信息详情</title>
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
                学生信息详情
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/People/StudentList.jsp"> 学生信息</a></li>
                <li class="active">学生信息详情</li>
            </ol>
        </section>

        <section class="content">

            <div class="box-body" id="display" style="display: none">

                <form id="form" action=""
                      method="post">
                    <!--tab页-->
                    <div class="nav-tabs-custom">

                        <!--tab头-->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-student" data-toggle="tab">学生信息</a>
                            </li>
                            <li>
                                <a href="#tab-class" data-toggle="tab">班级信息</a>
                            </li>
                            <li>
                                <a href="#tab-dept" data-toggle="tab">学院信息</a>
                            </li>
                        </ul>
                        <!--tab头/-->

                        <!--tab内容-->
                        <div class="tab-content">

                            <!--label显示的内容-->
                            <div class="tab-pane active" id="tab-student">
                                <div class="row data-type">

                                    <div class="col-sm-2 title">学号</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SNo"
                                               value="${student.SNo}">
                                    </div>

                                    <div class="col-sm-2 title">姓名</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SName"
                                               value="${student.SName}">
                                    </div>

                                    <div class="col-sm-2 title">性别</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SGenderStr"
                                               value="${student.SGenderStr}">
                                    </div>

                                    <div class="col-sm-2 title">手机号码</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SPhone"
                                               value="${student.SPhone}">
                                    </div>

                                    <div class="col-sm-2 title">电子邮箱</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SEmail"
                                               value="${student.SEmail}">
                                    </div>

                                    <div class="col-sm-2 title">身份证号码</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SIdcard"
                                               value="${student.SIdcard}">
                                    </div>

                                </div>
                            </div>

                            <!--label显示的内容-->
                            <div class="tab-pane" id="tab-class">
                                <div class="row data-type">
                                    <div class="col-sm-2 title">所在班级</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="student.classes.CName"
                                               value="${student.classes.CName}">
                                    </div>

                                    <div class="col-sm-2 title">专业名称</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control " readonly="readonly"
                                               value="${student.classes.CMajor}">
                                    </div>

                                    <div class="col-sm-2 title">班主任</div>
                                    <div class="col-sm-10 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${student.classes.teacher.TName}">
                                    </div>
                                </div>
                            </div>

                            <!--label显示的内容-->
                            <div class="tab-pane " id="tab-dept">
                                <div class="row data-type">
                                    <div class="col-sm-2 title">学院</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="student.classes.department.DName"
                                               value="${student.classes.department.DName}">
                                    </div>

                                    <div class="col-sm-2 title">院长</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control " readonly="readonly"
                                               value="${student.classes.department.teacher.TName}">
                                    </div>
                                </div>
                            </div>

                        </div>


                        <br>
                    </div>
                </form>
            </div>

            <!--tab页-->
            <div class="nav-tabs-custom">

                <!--tab头-->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab-match" data-toggle="tab">参赛信息</a>
                    </li>
                    <li>
                        <a href="#tab-borrow" data-toggle="tab">体育设备借用信息</a>
                    </li>
                </ul>
                <!--tab头/-->

                <!--tab内容-->
                <div class="tab-content">

                    <!--label显示的内容-->
                    <div class="tab-pane active" id="tab-match">
                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="text-center">序号</th>
                                <th class="text-center">参赛届时</th>
                                <th class="text-center">参赛人</th>
                                <th class="text-center">参赛项目</th>
                                <th class="text-center">参赛时间</th>
                                <th class="text-center">成绩</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${matches.matchesList}" var="matches" varStatus="status">

                                <tr>
                                    <td class="text-center">${status.index+1}</td>
                                    <td class="text-center">${matches.event.sportmeeting.SId }届</td>
                                    <td class="text-center">${student.SName}</td>
                                    <td class="text-center">${matches.event.EName }</td>
                                    <td class="text-center">${matches.event.EDateStr}</td>
                                    <td class="text-center">${matches.MScore == null ? "未录入":matches.MScore }${matches.MScore == null ? "":matches.event.EUnit}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs "
                                                onclick="location.href='${pageContext.request.contextPath}/matches/findDetailsBymId.do?mId=${matches.MId}'">
                                            详情
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-borrow">
                        <!--数据列表-->
                        <table id="dataList2"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>

                            <tr>
                                <th class="text-center">序号</th>
                                <th class="text-center">借用人</th>
                                <th class="text-center">借用器材</th>
                                <th class="text-center">借用地点</th>
                                <th class="text-center">借出数量</th>
                                <th class="text-center">借出时间</th>
                                <th class="text-center">归还时间</th>
                                <th class="text-center">借还状态</th>
                                <th class="text-center">借用描述</th>

                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${student.user.borrow}" var="borrow" varStatus="status">
                                <tr>
                                    <td class="text-center">${status.index+1}</td>
                                    <td class="text-center">${student.SName }</td>
                                    <td class="text-center">${borrow.equipment.EName}</td>
                                    <td class="text-center">${borrow.equipment.EPlace }</td>
                                    <td class="text-center">${borrow.BNum }</td>
                                    <td class="text-center">${borrow.BStarttimeStr }</td>
                                    <td class="text-center">${borrow.BEndtimeStr != null ? borrow.BEndtimeStr: "未还"}</td>
                                    <td align="center"><span
                                            class=" label ${borrow.BState == false ? "label-danger":"label-success"} "> ${borrow.BState==false?"未还":"已还"}</span>
                                    </td>
                                    <td class="text-center">${borrow.BDescription }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--数据列表/-->
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
        "order": [4, 'desc'],
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


    $('#dataList2').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [5, 'desc'],
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


    $(document).ready(function () {
        document.getElementById("display").removeAttribute("style");
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
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
        setSidebarActive("student-list");


        // 全选操作
        $("#selall").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</html>